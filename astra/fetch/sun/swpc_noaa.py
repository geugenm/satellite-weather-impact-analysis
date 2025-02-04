from data_processor import DataProcessor

import requests
import pandas as pd


class SwpcProcessor(DataProcessor):
    """Processor for SWPC NOAA sunspot data"""

    output_prefix = "swpc_ssn"

    def download(self, url: str) -> dict:
        """Download SWPC JSON data"""
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.json()

    def process(self, data: dict) -> pd.DataFrame:
        """Process SWPC specific data"""
        df = pd.DataFrame(data)

        column_mappings = {
            "Obsdate": self.config["time_column"],
            "SSN": "sunspot_number",
        }

        df = df.rename(columns=column_mappings)
        return self.sanitize_columns(df)


if __name__ == "__main__":
    url = (
        "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json"
    )
    processor = SwpcProcessor()
    processor.run(url)
