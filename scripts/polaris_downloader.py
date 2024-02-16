import subprocess
from typing import List


def run_polaris_fetch(sat_name: str, start_date: str, end_date: str) -> None:
    """Run the polaris fetch command with the given parameters."""
    json_name = f"{sat_name.lower()}_normalized_frames.json"

    # Define the command and its arguments
    command: List[str] = [
        "polaris", "fetch",
        "--start_date", start_date,
        "--end_date", end_date,
        "--cache_dir", f"../data/{sat_name.lower()}",
        sat_name,
        f"../data/{sat_name.lower()}/{json_name}"
    ]

    # Execute the command using subprocess
    subprocess.run(command)


def run_polaris_learn(sat_name: str) -> None:
    """Run the polaris learn command to analyze the satellite data."""
    graph_name = f"{sat_name.lower()}-graph.json"

    # Define the command and its arguments
    command: List[str] = [
        "polaris", "learn",
        "--force_cpu",
        "--output_graph_file", f"../data/{sat_name.lower()}/{graph_name}",
        f"../data/{sat_name.lower()}/{sat_name.lower()}_normalized_frames.json"
    ]

    # Execute the command using subprocess
    subprocess.run(command)


if __name__ == "__main__":
    # Define the satellite name, start date, and end date
    sat_name: str = "LightSail-2"
    start_date: str = "2020-01-21"
    end_date: str = "2020-01-28"

    # Run the polaris fetch command
    run_polaris_fetch(sat_name, start_date, end_date)
    run_polaris_learn(sat_name)
