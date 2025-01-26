from pathlib import Path
from time import perf_counter
import logging
from concurrent.futures import ProcessPoolExecutor
from astra.analyzer import process_satellite_data

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)

PARENT_DIR = Path("../downloads/sat")


def _analyze_entry(entry: Path) -> None:
    start = perf_counter()
    try:
        logging.info(f"analyzing '{entry.name}'...")
        process_satellite_data(entry.name)
        logging.info(
            f"finished '{entry.name}' in {perf_counter() - start:.2f}s"
        )
    except Exception as e:
        logging.error(f"error analyzing '{entry.name}': {e}", exc_info=True)


def main() -> None:
    if not PARENT_DIR.is_dir():
        logging.error(f"invalid directory: {PARENT_DIR.absolute()}")
        return

    entries = [e for e in PARENT_DIR.iterdir() if e.is_dir()]
    if not entries:
        logging.warning(f"no directories in {PARENT_DIR.absolute()}")
        return

    start = perf_counter()
    logging.info(f"processing {len(entries)} directories")

    with ProcessPoolExecutor() as pool:
        list(pool.map(_analyze_entry, entries))

    logging.info(f"total time: {perf_counter() - start:.2f}s")


if __name__ == "__main__":
    main()
