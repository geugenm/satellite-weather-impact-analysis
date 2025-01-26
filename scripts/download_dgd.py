import os
import pandas as pd
import datetime
import logging
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from vinvelivaanilai.space_weather.sw_file_fetch import fetch_indices
from vinvelivaanilai.space_weather.sw_extractor import extract_data_regex

DOWNLOAD_DIR = Path(
    "downloads/dgd"
).absolute()  # Directory to download DGD data
OUTPUT_DIR = Path(
    "downloads/sun"
).absolute()  # Directory to save processed data
START_DATE = datetime.datetime(
    year=2016, month=1, day=1
)  # Start date for data fetching
FINAL_DATE = datetime.datetime(
    year=2024, month=11, day=21
)  # End date for data fetching
CSV_OUTPUT_FILE = "dgd.csv"  # Output CSV file name

DOWNLOAD_DIR.mkdir(parents=True, exist_ok=True)
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


def download_and_process_data() -> None:
    logger.info(f"Downloading DGD data to '{DOWNLOAD_DIR}'...")
    os.chdir(DOWNLOAD_DIR)
    fetch_indices("DGD", START_DATE, FINAL_DATE)

    dataframes = []

    with ThreadPoolExecutor() as executor:
        futures = {
            executor.submit(process_file, filename): filename
            for filename in DOWNLOAD_DIR.glob("*.txt")
        }

        for future in as_completed(futures):
            try:
                df = future.result()
                dataframes.append(df)
            except Exception as e:
                logger.error(f"Error processing file {futures[future]}: {e}")

    if dataframes:
        merged_df = pd.concat(dataframes, ignore_index=False)
        merged_df.to_csv(OUTPUT_DIR / CSV_OUTPUT_FILE, index=True)
        logger.info(
            f"Saved final dataframe to '{OUTPUT_DIR}/{CSV_OUTPUT_FILE}'"
        )
    else:
        logger.warning("No data frames to merge.")


def process_file(filename: Path) -> pd.DataFrame:
    logger.info(f"Processing file: {filename}")
    return extract_data_regex("DGD", filename)


if __name__ == "__main__":
    try:
        download_and_process_data()
    except Exception as e:
        logger.critical(f"An error occurred: {e}", exc_info=True)
