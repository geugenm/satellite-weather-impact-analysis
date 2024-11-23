import os
import time
import logging
from typing import List
from concurrent.futures import ProcessPoolExecutor, as_completed

from src.analyzer import process_satellite_data

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

parent_directory = "../downloads/sat"


def analyze_entry(entry: str) -> None:
    start_time = time.time()
    full_path = os.path.join(parent_directory, entry)

    if os.path.isdir(full_path):
        logging.info(f"Analyzing '{entry}'...")
        try:
            process_satellite_data(entry)
            elapsed_time = time.time() - start_time
            logging.info(
                f"Finished analyzing '{entry}'. Time taken: {elapsed_time:.2f} seconds"
            )
        except Exception as e:
            logging.error(f"Error analyzing '{entry}': {e}")


def main() -> None:
    start_total_time = time.time()

    entries: List[str] = [
        entry
        for entry in os.listdir(parent_directory)
        if os.path.isdir(os.path.join(parent_directory, entry))
    ]

    with ProcessPoolExecutor() as executor:
        futures = {executor.submit(analyze_entry, entry): entry for entry in entries}

        for future in as_completed(futures):
            entry = futures[future]
            try:
                future.result()
            except Exception as e:
                logging.error(f"An error occurred while processing '{entry}': {e}")

    total_elapsed_time = time.time() - start_total_time
    logging.info(f"Total execution time: {total_elapsed_time:.2f} seconds")


if __name__ == "__main__":
    main()
