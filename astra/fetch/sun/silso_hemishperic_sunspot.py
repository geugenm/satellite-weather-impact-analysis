from .data_processor import DataProcessor

import requests
import pandas as pd
from io import StringIO


class SndHemCsvProcessor(DataProcessor):
    """Processor for sndhemcsv.php data"""

    output_prefix = "silso_daily_hemispheric_sunspot_number"
    url = "https://www.sidc.be/SILSO/INFO/sndhemcsv.php"

    def download(self) -> str:
        response = requests.get(self.url, timeout=10)
        response.raise_for_status()
        return response.text

    def process(self, data: str) -> pd.DataFrame:
        df = pd.read_csv(
            StringIO(data),
            delimiter=";",
            header=None,
            usecols=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
            names=[
                "year",
                "month",
                "day",
                "decimal_year",
                "Nvalue",
                "Nerror",
                "Svalue",
                "Serror",
                "total",
                "total_error",
            ],
        )
        df[self.config.fetch.time_column] = pd.to_datetime(
            df[["year", "month", "day"]]
        )
        df.drop(columns=["year", "month", "day", "decimal_year"], inplace=True)
        return df


if __name__ == "__main__":
    processor = SndHemCsvProcessor()
    processed_data = processor.run()
