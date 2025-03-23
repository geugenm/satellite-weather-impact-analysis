import logging
from pathlib import Path
from functools import lru_cache

import polars as pl


@lru_cache(maxsize=128)
def create_column_mapping(
    data_dir: Path, time_column: str
) -> dict[str, dict[str, str]]:
    """Create mapping of columns to their source files."""
    mapping = {}

    # Use a single scan operation to get all column names from all files
    for file_path in data_dir.glob("**/*.csv"):
        try:
            # Only fetch schema without loading data
            schema = pl.scan_csv(file_path, n_rows=10).collect().schema

            # Add all non-time columns to the mapping
            for col_name, _ in schema.items():
                if col_name != time_column:
                    mapping[col_name] = {
                        "source": file_path.name,
                        "measurement": col_name,
                    }
        except Exception as e:
            logging.error(f"error reading '{file_path}' for mapping: {e}")

    return mapping


def load_time_series_data(data_dir: Path, time_column: str) -> pl.DataFrame:
    """Load and combine CSV files containing time series data."""
    # Find all CSV files
    csv_files = list(data_dir.glob("**/*.csv"))
    if not csv_files:
        raise ValueError(f"no csv files found in {data_dir}")

    # First pass: check which files have the time column
    valid_files = []
    for file_path in csv_files:
        try:
            # Only scan schema to check for time column
            if (
                time_column
                in pl.scan_csv(file_path, n_rows=10).collect().columns
            ):
                valid_files.append(file_path)
            else:
                logging.warning(
                    f"skipping '{file_path}' - missing '{time_column}' column"
                )
        except Exception as e:
            logging.warning(f"error reading '{file_path}': {e}")

    if not valid_files:
        raise ValueError(
            f"no valid csv files with '{time_column}' column found"
        )

    # Second pass: load all valid files at once using streaming
    try:
        # Use streaming to handle large files efficiently
        return pl.concat(
            [pl.scan_csv(file) for file in valid_files], how="diagonal_relaxed"
        ).collect(streaming=True)
    except Exception as e:
        logging.exception(
            f"schema mismatch detected, trying with schema relaxation: {e}"
        )

        # Fallback: collect each dataframe separately then concat
        return pl.concat(
            [pl.scan_csv(file).collect() for file in valid_files],
            how="diagonal_relaxed",
        )
