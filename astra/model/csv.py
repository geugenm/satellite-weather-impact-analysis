import logging
from pathlib import Path

import polars as pl


def create_column_mapping(data_dir: Path, time_column: str) -> dict:
    """Create mapping of columns to their source files."""
    mapping = {}
    for file_path in data_dir.glob("**/*.csv"):
        try:
            df = pl.scan_csv(file_path, infer_schema_length=1000).collect()
            for col in df.columns:
                if col != time_column:
                    mapping[col] = {
                        "source": file_path.name,
                        "measurement": col,
                    }
        except Exception as e:
            logging.exception(f"error reading '{file_path}' for mapping: '{e}'")
    return mapping


def load_time_series_data(data_dir: Path, time_column: str) -> pl.DataFrame:
    """Load and combine CSV files containing time series data."""
    csv_files = list(data_dir.glob("**/*.csv"))
    if not csv_files:
        raise ValueError(f"no csv files found in {data_dir}")

    valid_dfs = []
    for file_path in csv_files:
        try:
            df = pl.scan_csv(file_path, infer_schema_length=1000)
            if time_column in df.collect().columns:
                valid_dfs.append(df)
            else:
                logging.warning(
                    f"skipping '{file_path}' - missing '{time_column}' column"
                )
        except Exception as e:
            logging.warning(f"error reading '{file_path}': '{e}'")

    if not valid_dfs:
        raise ValueError(
            f"no valid csv files with '{time_column}' column found"
        )

    try:
        return pl.concat(valid_dfs, how="diagonal_relaxed").collect()
    except Exception as e:
        logging.exception(
            f"schema mismatch detected, trying with schema relaxation: '{e}'"
        )
        return pl.concat(
            [df.collect() for df in valid_dfs], how="diagonal_relaxed"
        )
