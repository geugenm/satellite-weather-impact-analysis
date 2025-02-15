from data_processor import DataProcessor

import requests
import pandas as pd


class SwpcProcessor(DataProcessor):
    """Processor for SWPC NOAA sunspot data"""

    output_prefix = "swpc_noaa_observed_ssn"
    url = (
        "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json"
    )

    def download(self, url: str) -> dict:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.json()

    def process(self, data: dict) -> pd.DataFrame:
        df = pd.DataFrame(data)

        column_mappings = {
            "Obsdate": self.config.fetch.time_column,
            "SSN": "sunspot_number",
        }

        df = df.rename(columns=column_mappings)
        return self.sanitize_columns(df)


if __name__ == "__main__":
    processor = SwpcProcessor()
    processor.run()
