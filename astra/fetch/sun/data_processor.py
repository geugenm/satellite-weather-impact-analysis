from abc import ABC, abstractmethod
import pandas as pd
from typing import Any
from pathlib import Path
import logging

from astra.config.data import DataConfig
from astra.paths import CONFIG_PATH


class DataProcessor(ABC):
    output_prefix: str
    url: str

    def __init__(self, config_path: Path = CONFIG_PATH / "data.yaml"):
        self.config: DataConfig = DataConfig.from_yaml(config_path)

    @abstractmethod
    def download(self) -> Any:
        pass

    @abstractmethod
    def process(self, data: Any) -> pd.DataFrame:
        pass

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        special_symbols = self.config.format.special_symbols
        for pattern in special_symbols.patterns:
            df.columns = df.columns.str.replace(
                pattern, special_symbols.replacement
            )
        return df.rename(columns=str.lower)

    def save(self, df: pd.DataFrame) -> None:
        time_col = self.config.format.time_column
        df[time_col] = pd.to_datetime(df[time_col]).dt.strftime(
            self.config.format.time_format
        )
        df = df.sort_values(by="time").reset_index(drop=True)

        file_name = self.config.fetch.base_dir / f"sun/{self.output_prefix}.csv"
        logging.info(f"Saving file: '{file_name.absolute()}'")

        df.to_csv(
            file_name,
            sep=self.config.format.separator,
            index=False,
            compression=compression,
        )

    def run(self) -> None:
        try:
            data = self.download()
            df = self.process(data)
            self.save(df)
        except Exception as e:
            logging.exception(f"error while running: {str(e)}")
