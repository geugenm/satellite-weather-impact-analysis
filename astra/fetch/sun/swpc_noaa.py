from data_processor import DataProcessor

from pathlib import Path
import requests
import yaml
import json
import pandas as pd
from datetime import datetime
from typing import Any, Dict


class SwpcProcessor(DataProcessor):
    """Processor for SWPC NOAA sunspot data"""

    output_prefix = "swpc_ssn"

    def download(self, url: str) -> Dict:
        """Download SWPC JSON data"""
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.json()

    def process(self, data: Dict) -> pd.DataFrame:
        """Process SWPC specific data"""
        df = pd.DataFrame(data)

        # SWPC specific column mappings
        column_mappings = {
            "Obsdate": self.config["time_column"],
            "SSN": "sunspot_number",
        }

        df = df.rename(columns=column_mappings)
        return self.sanitize_columns(df)


def main() -> None:
    """Main execution"""
    url = (
        "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json"
    )
    processor = SwpcProcessor()
    processor.run(url)


if __name__ == "__main__":
    main()
