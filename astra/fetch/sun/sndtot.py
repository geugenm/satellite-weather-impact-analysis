from data_processor import DataProcessor

import requests
import pandas as pd
from io import StringIO


class SndTotCsvProcessor(DataProcessor):
    """Processor for sndtotcsv.php data"""

    output_prefix = "daily_total_sunspot_number"

    def download(self, url: str) -> str:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.text

    def process(self, data: str) -> pd.DataFrame:
        df = pd.read_csv(
            StringIO(data),
            delimiter=";",
            header=None,
            usecols=[0, 1, 2, 3, 4, 5, 6],
            names=[
                "year",
                "month",
                "day",
                "decimal_year",
                "SNvalue",
                "SNerror",
                "Nb_observations",
            ],
        )

        df[self.config["time_column"]] = pd.to_datetime(
            df[["year", "month", "day"]]
        )

        df.drop(columns=["year", "month", "day", "decimal_year"], inplace=True)

        return self.sanitize_columns(df)


if __name__ == "__main__":
    url = "https://www.sidc.be/SILSO/INFO/sndtotcsv.php"
    processor = SndTotCsvProcessor()
    processed_data = processor.run(url)
