from pathlib import Path
from time import perf_counter
import logging
from concurrent.futures import ProcessPoolExecutor
from argparse import ArgumentParser
from astra.analyzer import process_satellite_data

logging.basicConfig(
    level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
)


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
        raise


def process_directory(parent_dir: Path) -> None:
    if not parent_dir.is_dir():
        raise Exception(f"{parent_dir.absolute()}: no such directory")

    entries = [e for e in parent_dir.iterdir() if e.is_dir()]
    if not entries:
        raise Exception(
            f"{parent_dir.absolute()}: directory contains no subdirectories"
        )

    start = perf_counter()
    logging.info(f"processing {len(entries)} directories")

    try:
        with ProcessPoolExecutor() as pool:
            list(pool.map(_analyze_entry, entries))
    except Exception as e:
        raise Exception(f"{parent_dir.absolute()}: processing failed: {e}")

    logging.info(f"total time: {perf_counter() - start:.2f}s")


def main() -> None:
    parser = ArgumentParser(description="Process satellite data directories")
    parser.add_argument(
        "dir", type=Path, help="directory containing satellite data"
    )
    args = parser.parse_args()
    try:
        process_directory(args.dir)
    except Exception as e:
        logging.error(str(e))
        exit(1)


if __name__ == "__main__":
    main()
