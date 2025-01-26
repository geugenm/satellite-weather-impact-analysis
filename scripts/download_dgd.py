from pathlib import Path
import pandas as pd
import datetime as dt
import logging
import os
from concurrent.futures import ThreadPoolExecutor
from vinvelivaanilai.space_weather.sw_file_fetch import fetch_indices
from vinvelivaanilai.space_weather.sw_extractor import extract_data_regex

DOWNLOAD_DIR = Path("downloads/dgd").absolute()
OUTPUT_DIR = Path("downloads/sun").absolute()
START_DATE = dt.datetime(2016, 1, 1)
FINAL_DATE = dt.datetime(2025, 1, 26)

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)
logger = logging.getLogger(__name__)


def _process_file(file: Path) -> pd.DataFrame:
    logger.info(f"processing file: {file}")
    return extract_data_regex("DGD", file)


def download_and_process_data() -> None:
    DOWNLOAD_DIR.mkdir(parents=True, exist_ok=True)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    logger.info(f"downloading DGD data to '{DOWNLOAD_DIR}'...")
    with Path.cwd() / DOWNLOAD_DIR as download_path:
        os.chdir(download_path)
        fetch_indices("DGD", START_DATE, FINAL_DATE)

        with ThreadPoolExecutor() as pool:
            try:
                dfs = list(pool.map(_process_file, download_path.glob("*.txt")))
                if dfs:
                    pd.concat(dfs).to_csv(OUTPUT_DIR / "dgd.csv", index=True)
                    logger.info(f"saved dataframe to '{OUTPUT_DIR}/dgd.csv'")
                else:
                    logger.warning("no data frames to merge")
            except Exception as e:
                logger.error(f"processing failed: {e}")
                raise


if __name__ == "__main__":
    try:
        download_and_process_data()
    except Exception as e:
        logger.critical(f"fatal error: {e}", exc_info=True)
        exit(1)
