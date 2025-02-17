from abc import ABC, abstractmethod
import json
import pandas as pd
from datetime import datetime
from typing import Any
from pathlib import Path
import logging

from astra.config.data import DataConfig, FormatConfig
from astra.paths import CONFIG_PATH


class DataProcessor(ABC):
    """Base class for data processing pipelines"""

    output_prefix: str
    url: str

    def __init__(self, config_path: Path = CONFIG_PATH / "data.yaml"):
        self.config: DataConfig = DataConfig.from_yaml(config_path)

    @abstractmethod
    def download(self) -> Any:
        """Download data from source"""
        pass

    @abstractmethod
    def process(self, data: Any) -> pd.DataFrame:
        """Process raw data into DataFrame"""
        pass

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        """Apply column name sanitization"""
        special_symbols = self.config.format.special_symbols
        for pattern in special_symbols.patterns:
            df.columns = df.columns.str.replace(
                pattern, special_symbols.replacement
            )
        return df.rename(columns=str.lower)

    def save(self, df: pd.DataFrame) -> None:
        """Save processed data"""
        time_col = self.config.format.time_column
        df[time_col] = pd.to_datetime(df[time_col]).dt.strftime(
            self.config.format.time_format
        )
        df = df.sort_values(by="time").reset_index(drop=True)

        timestamp = datetime.now().strftime(self.config.format.time_format)
        compression = self.config.format.save.compression
        save_type = self.config.format.save.type

        file_name = (
            self.config.fetch.base_dir
            / f"sun/{self.output_prefix}_{timestamp}.{save_type}"
        )
        logging.info(f"Saving file: '{file_name.absolute()}'")

        match save_type:
            case "json":
                data = df.to_dict(orient="records")
                with open(file_name, "w") as f:
                    json.dump(data, f, indent=4)
            case "csv":
                df.to_csv(
                    file_name,
                    sep=self.config.format.separator,
                    index=False,
                    compression=compression,
                )
            case "parquet":
                df.to_parquet(file_name, compression=compression)
            case "feather":
                df.to_feather(file_name, compression=compression)
            case _:
                raise ValueError(
                    f"Unsupported save type: {self.config.format.save.type}"
                )

    def run(self) -> None:
        """Execute the processing pipeline"""
        try:
            data = self.download()
            df = self.process(data)
            self.save(df)
        except Exception as e:
            logging.exception(f"error while running: {str(e)}")
