from astra.fetch.sun.data_processor import DataProcessor
import requests
import pandas as pd
from io import StringIO


class FluxTableProcessor(DataProcessor):
    """Processor for solar flux table data"""

    output_prefix = "swpc_solar_flux"
    url = "https://spaceweather.gc.ca/solar_flux_data/daily_flux_values/fluxtable.txt"

    def download(self) -> str:
        response = requests.get(self.url, timeout=10)
        response.raise_for_status()
        return response.text

    def process(self, data: str) -> pd.DataFrame:
        # Remove the second line (dashes)
        lines = data.splitlines()
        lines.pop(1)

        # Read and process data
        df = pd.read_csv(StringIO("\n".join(lines)), sep="\\s+")

        # Rename fluxdate to the configured time column
        time_col = self.config.format.time_column
        df.rename(columns={"fluxdate": time_col}, inplace=True)

        return self.sanitize_columns(df)


if __name__ == "__main__":
    processor = FluxTableProcessor()
    processor.run()
