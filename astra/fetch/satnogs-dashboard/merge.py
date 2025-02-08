from pathlib import Path
import pandas as pd
import logging
import argparse
import re

from astra.analyzer import get_csv_files

DOWNLOAD_BASE = Path("downloads/sat").absolute()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def get_available_satellites() -> list:
    """Get list of satellites with downloaded data"""
    return [d.name for d in DOWNLOAD_BASE.iterdir() if d.is_dir()]


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Merge satellite telemetry data because your disk is a mess",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Operations:
    Merge Mode
        Combines CSV files by time alignment (because time is money)
        Output: merged/<satellite>_merged.csv

    List Mode
        Shows available satellites (in case your memory sucks)

Usage Examples:
    # Merge specific satellite data (if you can remember its name)
    %(prog)s --merge veronika

    # Merge all satellites (because why not?)
    %(prog)s --merge all

    # List available satellites (for the memory-impaired)
    %(prog)s --list
    """,
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "--merge",
        help="satellite name or 'all' to merge everything like a boss",
        metavar="NAME",
    )
    group.add_argument(
        "--list",
        action="store_true",
        help="list available satellites (use when drunk)",
    )
    return parser


def custom_parse(file_path: Path) -> pd.DataFrame:
    """Parse CSV and unfuck units from values because satellite engineers are creative"""
    df = pd.read_csv(file_path)

    # Normalize time column because nobody can agree on naming
    df = df.rename(columns=lambda col: "time" if col.lower() == "time" else col)
    df["time"] = pd.to_datetime(df["time"]).dt.normalize()

    # Hunt down and process units in data
    for col in df.columns:
        if col == "time" or df[col].dtype != "object":
            continue

        # Check first 100 rows for units because we're not parsing the whole shit
        sample = df[col].dropna().astype(str).iloc[:100]

        # Match common satellite telemetry units
        unit_pattern = (
            r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c)$"
        )

        if sample.str.match(unit_pattern, case=False).any():
            # Extract values and detect unit
            cleaned = df[col].str.extract(unit_pattern, flags=re.IGNORECASE)
            if cleaned[0].notna().any():
                df[col] = pd.to_numeric(cleaned[0], errors="coerce")
                unit = cleaned[1].dropna().iloc[0].lower()

                # Map units to sane names
                unit_map = {
                    "c": "celsius",
                    "°c": "celsius",
                    "v": "v",
                    "mv": "mv",
                    "ma": "ma",
                    "ms": "ms",
                    "s": "s",
                    "m": "m",
                    "kg": "kg",
                    "hz": "hz",
                    "db": "db",
                    "rpm": "rpm",
                }

                df = df.rename(
                    columns={col: f"{col}_{unit_map.get(unit, unit)}"}
                )

    # Clean up column names and keep only numeric data
    return df.select_dtypes(include=["number", "bool", "datetime"]).rename(
        columns=lambda col: col.translate(
            str.maketrans({c: "_" for c in " ,<>[]()#+"})
        )
    )


def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    if args.list:
        sats = get_available_satellites()
        if not sats:
            print("No satellites found. Did you even download anything?")
            return
        print("\nAvailable satellites:")
        for sat in sats:
            print(f"  • {sat}")
        print()
        return

    if args.merge == "all":
        satellites = get_available_satellites()
    else:
        satellites = [args.merge]

    output_dir = Path("filtered")
    output_dir.mkdir(exist_ok=True)

    for sat in satellites:
        logging.info(f"processing '{sat}'")
        try:
            for file in get_csv_files(DOWNLOAD_BASE / sat):
                try:
                    custom_parse(file).to_csv(
                        output_dir / file.name, index=False
                    )
                    logging.info(f"saved '{file.name}' to filtered directory")
                except Exception as e:
                    logging.error(f"failed to process {file}: {e}")
        except Exception as e:
            logging.error(f"failed to process satellite {sat}: {e}")


if __name__ == "__main__":
    main()
