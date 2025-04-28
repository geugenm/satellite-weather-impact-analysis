import pandas as pd
import re
from abc import ABC

from astra.config.data import DataConfig, get_project_config


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
    "kb": "kilobytes",
    "mb": "megabytes",
    "k": "thousands",
    "mib": "mebibytes",
}

UNIT_PATTERN = re.compile(
    f"^(-?\\d*\\.?\\d+)\\s*({"|".join(re.escape(k) for k in sorted(UNIT_MAP.keys(), key=len, reverse=True))})$",
    re.IGNORECASE,
)


class DataFrameParser(ABC):
    def __init__(self):
        self.config: DataConfig = get_project_config()

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        # Clean column names
        for p in self.config.format.special_symbols.patterns:
            df.columns = pd.Series(df.columns).str.replace(
                p, self.config.format.special_symbols.replacement
            )
        df.columns = df.columns.str.lower()

        time_col = self.config.format.time_column

        assert time_col in df.columns, f"{time_col} is not in {df.columns}"

        df[time_col] = pd.to_datetime(
            df[time_col], errors="coerce"
        ).dt.strftime(self.config.format.time_format)

        df[time_col] = pd.to_datetime(df[time_col], errors="coerce")

        return df

    def parse_units(self, df: pd.DataFrame) -> pd.DataFrame:
        time_col = self.config.format.time_column
        rename_dict: dict[str, str] = {}

        # Process string columns that aren't the time column
        for col in [
            c
            for c in df.select_dtypes(include=["object"]).columns
            if c != time_col
        ]:
            sample = df[col].dropna().astype(str).head(10)
            if not sample.str.match(UNIT_PATTERN).any():
                continue

            extracted = df[col].str.extract(UNIT_PATTERN)
            if not extracted.iloc[:, 0].notna().any():
                continue

            df[col] = pd.to_numeric(extracted.iloc[:, 0], errors="coerce")
            unit = extracted.iloc[:, 1].dropna().iloc[0].lower()
            rename_dict[col] = f"{col}_{UNIT_MAP.get(unit, unit)}"

        if rename_dict:
            df.rename(columns=rename_dict, inplace=True)

        return df
