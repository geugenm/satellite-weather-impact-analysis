from abc import ABC, abstractmethod
import pandas as pd
from typing import Any
from pathlib import Path
import logging

from astra.config.data import DataConfig, get_project_config
from astra.fetch.format import DataFrameParser


class DataProcessor(ABC):
    output_prefix: str = "not_set"
    url: str = "not_set"

    _parser = DataFrameParser()

    def __init__(self):
        self.config: DataConfig = get_project_config()

    @abstractmethod
    def download(self) -> Any:
        pass

    @abstractmethod
    def process(self, data: Any) -> pd.DataFrame:
        pass

    def sanitize_columns(self, df: pd.DataFrame) -> pd.DataFrame:
        return self._parser.sanitize_columns(df)

    def save(self, df: pd.DataFrame) -> None:
        file_name = Path(f"{self.output_prefix}.csv")
        logging.info(f"Saving file: '{file_name.absolute()}'")

        df.to_csv(
            file_name,
            sep=self.config.format.separator,
            index=False,
        )

    def run(self) -> None:
        try:
            data = self.download()
            df = self.process(data)
            self.save(df)
        except Exception as e:
            logging.exception(f"error while running: {str(e)}")
