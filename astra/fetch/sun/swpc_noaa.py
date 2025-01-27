from pathlib import Path
import requests
import yaml
import json
import pandas as pd
from datetime import datetime


def load_config(path: str = "schema.yaml") -> dict:
    """Load YAML configuration"""
    with open(path, "r") as f:
        return yaml.safe_load(f)


def download_swpc_data(url: str) -> dict:
    """Download SWPC NOAA data"""
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    return response.json()


def process_data(data: list, config: dict) -> pd.DataFrame:
    """Process and rename columns according to config"""
    df = pd.DataFrame(data)

    # Column name mappings for better readability
    column_mappings = {
        "Obsdate": config["time_column"],
        "swpc_ssn": "sunspot_number",
    }

    # Apply column renaming
    df = df.rename(columns=column_mappings)

    # Apply special symbols replacement and convert to snake_case
    special_symbols = config["special_symbols"]
    for pattern in special_symbols["patterns"]:
        df.columns = df.columns.str.replace(
            pattern, special_symbols["replacement"]
        )

    return df


def save_data(df: pd.DataFrame, config: dict) -> None:
    """Save data according to config"""
    # Format time column according to config
    time_col = config["time_column"]
    df[time_col] = pd.to_datetime(df[time_col]).dt.strftime(
        config["time_format"]
    )

    # Generate filename timestamp
    timestamp = datetime.now().strftime(config["time_format"])
    compression = config["save"].get("compression")

    match config["save"]["type"]:
        case "json":
            data = df.to_dict(orient="records")
            with open(f"swpc_ssn_{timestamp}.json", "w") as f:
                json.dump(data, f, indent=4)
        case "csv":
            df.to_csv(
                f"swpc_ssn_{timestamp}.csv",
                sep=config["separator"],
                index=False,
                compression=compression,
            )
        case "parquet":
            df.to_parquet(
                f"swpc_ssn_{timestamp}.parquet", compression=compression
            )
        case "feather":
            df.to_feather(
                f"swpc_ssn_{timestamp}.feather", compression=compression
            )
        case _:
            raise ValueError(f'Unsupported save type: {config["save"]["type"]}')


def main() -> None:
    """Main pipeline"""
    url = (
        "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json"
    )

    try:
        config = load_config()
        data = download_swpc_data(url)
        df = process_data(data, config)
        save_data(df, config)
    except Exception as e:
        print(f"error: {str(e)}")


if __name__ == "__main__":
    main()
