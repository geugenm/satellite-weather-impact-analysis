from abc import ABC, abstractmethod
from pathlib import Path
import requests
import yaml
import json
import pandas as pd
from datetime import datetime
from typing import Any, Dict


class DataProcessor(ABC):
    """Base class for data processing pipelines"""

    def __init__(self, config_path: str = "schema.yaml"):
        self.config = self.load_config(config_path)

    @staticmethod
    def load_config(path: str) -> dict:
        """Load YAML configuration"""
        with open(path, "r") as f:
            return yaml.safe_load(f)

    @abstractmethod
    def download(self, url: str) -> Any:
        """Download data from source"""
        pass

    @abstractmethod
    def process(self, data: Any) -> pd.DataFrame:
        """Process raw data into DataFrame"""
        pass

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        """Apply column name sanitization"""
        special_symbols = self.config["special_symbols"]
        for pattern in special_symbols["patterns"]:
            df.columns = df.columns.str.replace(
                pattern, special_symbols["replacement"]
            )
        return df.rename(columns=str.lower)

    def save(self, df: pd.DataFrame) -> None:
        """Save processed data"""
        time_col = self.config["time_column"]
        df[time_col] = pd.to_datetime(df[time_col]).dt.strftime(
            self.config["time_format"]
        )

        timestamp = datetime.now().strftime(self.config["time_format"])
        compression = self.config["save"].get("compression")

        match self.config["save"]["type"]:
            case "json":
                data = df.to_dict(orient="records")
                with open(f"{self.output_prefix}_{timestamp}.json", "w") as f:
                    json.dump(data, f, indent=4)
            case "csv":
                df.to_csv(
                    f"{self.output_prefix}_{timestamp}.csv",
                    sep=self.config["separator"],
                    index=False,
                    compression=compression,
                )
            case "parquet":
                df.to_parquet(
                    f"{self.output_prefix}_{timestamp}.parquet",
                    compression=compression,
                )
            case "feather":
                df.to_feather(
                    f"{self.output_prefix}_{timestamp}.feather",
                    compression=compression,
                )
            case _:
                raise ValueError(
                    f'Unsupported save type: {self.config["save"]["type"]}'
                )

    def run(self, url: str) -> None:
        """Execute the processing pipeline"""
        try:
            data = self.download(url)
            df = self.process(data)
            self.save(df)
        except Exception as e:
            print(f"error: {str(e)}")
