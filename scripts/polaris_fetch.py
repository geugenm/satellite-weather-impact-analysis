import logging
import os
import subprocess
import sys
from typing import List

# Constants
LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"

# Set up logging to stdout
logging.basicConfig(
    level=logging.INFO, format=LOG_FORMAT, handlers=[logging.StreamHandler(sys.stdout)]
)


def get_command_path(command_name: str) -> str:
    """Return the full path to the command executable."""
    return os.popen(f"which {command_name}").read().strip()


def run_command(command: List[str]) -> None:
    """Execute a command using subprocess and log its output."""
    try:
        result = subprocess.run(command, capture_output=True, text=True)
        logging.info(f"'{command}' output: {result.stdout}")
        if result.stderr:
            logging.error(f"'{command}' error: {result.stderr}")
    except Exception as e:
        logging.error(f"Failed to run '{command}': {e}")


def run_polaris_fetch(
    sat_name: str, start_date: str, end_date: str, data_dir_path: str
) -> None:
    """Fetch satellite data using Polaris."""
    json_name = f"{sat_name.lower()}_normalized_frames.json"
    cache_dir = os.path.join(data_dir_path, sat_name.lower())
    cache_dir = os.path.abspath(cache_dir)

    command = [
        get_command_path("polaris"),
        "fetch",
        "--start_date",
        start_date,
        "--end_date",
        end_date,
        "--cache_dir",
        cache_dir,
        sat_name,
        os.path.join(cache_dir, json_name),
    ]
    run_command(command)


def run_polaris_learn(sat_name: str, data_dir_path: str) -> None:
    """Analyze satellite data using Polaris."""
    graph_name = f"{sat_name.lower()}-graph.json"
    cache_dir = os.path.join(data_dir_path, sat_name.lower())
    cache_dir = os.path.abspath(cache_dir)

    command = [
        get_command_path("polaris"),
        "learn",
        "--force_cpu",
        "--output_graph_file",
        os.path.join(cache_dir, graph_name),
        os.path.join(cache_dir, f"{sat_name.lower()}_normalized_frames.json"),
    ]
    run_command(command)


def run_polaris_behave(sat_name: str, data_dir_path: str) -> None:
    """Analyze satellite behavior using Polaris."""
    input_file = os.path.join(
        data_dir_path, sat_name.lower(), f"{sat_name.lower()}_normalized_frames.json"
    )
    output_file = os.path.join(
        data_dir_path, sat_name.lower(), f"{sat_name.lower()}-anomaly_analysis.json"
    )
    command = [
        get_command_path("polaris"),
        "behave",
        input_file,
        "--output_file",
        output_file,
    ]
    run_command(command)


def main() -> None:
    sat_name: str = "LightSail-2"
    start_date: str = "2019-07-07"
    end_date: str = "2020-11-15"
    data_dir_path: str = "../data"

    run_polaris_fetch(sat_name, start_date, end_date, data_dir_path)
    run_polaris_learn(sat_name, data_dir_path)
    run_polaris_behave(sat_name, data_dir_path)


if __name__ == "__main__":
    main()
