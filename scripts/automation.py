import os
import time
from typing import List
from concurrent.futures import ProcessPoolExecutor
from src.analyzer import process_satellite_data

parent_directory = "../downloads"


def analyze_entry(entry: str) -> None:
    start_time = time.time()
    full_path = os.path.join(parent_directory, entry)
    if os.path.isdir(full_path):
        print(f"Analyzing '{entry}'...")
        process_satellite_data(entry)
        elapsed_time = time.time() - start_time
        print(f"Finished analyzing '{entry}'. Time taken: {elapsed_time:.2f} seconds")


def main():
    start_total_time = time.time()
    entries: List[str] = [
        entry
        for entry in os.listdir(parent_directory)
        if os.path.isdir(os.path.join(parent_directory, entry))
    ]

    with ProcessPoolExecutor() as executor:
        executor.map(analyze_entry, entries)

    total_elapsed_time = time.time() - start_total_time
    print(f"Total execution time: {total_elapsed_time:.2f} seconds")


if __name__ == "__main__":
    main()
