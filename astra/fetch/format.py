import pandas as pd
import re
from abc import ABC

from astra.config.data import DataConfig, get_project_config


UNIT_PATTERN = (
    r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c|days|day|a)$"
)
UNIT_MAP = {
    "c": "celsius",
    "°c": "celsius",
    "v": "volts",
    "mv": "millivolts",
    "ma": "milliamps",
    "ms": "milliseconds",
    "s": "seconds",
    "m": "meters",
    "kg": "kilograms",
    "hz": "hertz",
    "db": "decibels",
    "rpm": "rpm",
    "days": "days",
    "day": "day",
    "a": "amps",
}


class DataFrameParser(ABC):
    def __init__(self):
        self.config: DataConfig = get_project_config()

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        special_symbols = self.config.format.special_symbols
        for pattern in special_symbols.patterns:
            df.columns = df.columns.str.replace(
                pattern, special_symbols.replacement
            )
        df.columns = df.columns.str.lower()

        time_col = self.config.format.time_column

        assert time_col in df.columns, f"{time_col} is not in {df.columns}"

        df[time_col] = pd.to_datetime(
            df[time_col], errors="coerce", format=self.config.format.time_format
        )

        return df

    def parse_units(self, df: pd.DataFrame) -> pd.DataFrame:
        for col in (
            c
            for c in df.columns
            if c != self.config.format.time_column and df[c].dtype == "object"
        ):
            sample = df[col].dropna().astype(str).iloc[:100]
            if not sample.str.match(UNIT_PATTERN, case=False).any():
                continue

            cleaned = df[col].str.extract(UNIT_PATTERN, flags=re.IGNORECASE)
            if cleaned[0].notna().any():
                df[col] = pd.to_numeric(cleaned[0], errors="coerce")
                unit = cleaned[1].dropna().iloc[0].lower()
                df = df.rename(
                    columns={col: f"{col}_{UNIT_MAP.get(unit, unit)}"}
                )
        return df
