from pathlib import Path
from time import perf_counter
import logging
from concurrent.futures import ProcessPoolExecutor
from src.analyzer import process_satellite_data

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
)

PARENT_DIRECTORY = Path("../downloads/sat")


def analyze_entry(entry: Path) -> None:
    start_time = perf_counter()
    try:
        logging.info(f"Analyzing '{entry.name}'...")
        process_satellite_data(entry.name)
        logging.info(f"Finished '{entry.name}' in {perf_counter() - start_time:.2f}s")
    except Exception as e:
        logging.error(f"Error analyzing '{entry.name}': {e}", exc_info=True)


def fetch_directories(parent_dir: Path) -> list[Path]:
    return [entry for entry in parent_dir.iterdir() if entry.is_dir()]


def process_entries(entries: list[Path]) -> None:
    with ProcessPoolExecutor() as executor:
        results = executor.map(analyze_entry, entries)
        for entry, result in zip(
            entries, results
        ):  # Force iteration to handle exceptions
            if isinstance(result, Exception):
                logging.error(f"Error in {entry.name}: {result}")


def main() -> None:
    start_total_time = perf_counter()

    if not PARENT_DIRECTORY.is_dir():
        logging.error(f"Parent directory '{PARENT_DIRECTORY}' is invalid.")
        return

    entries = fetch_directories(PARENT_DIRECTORY)
    if not entries:
        logging.warning(f"No directories found in '{PARENT_DIRECTORY}'.")
        return

    logging.info(f"Found {len(entries)} directories to analyze.")
    process_entries(entries)

    logging.info(f"Total execution time: {perf_counter() - start_total_time:.2f}s")


if __name__ == "__main__":
    main()
