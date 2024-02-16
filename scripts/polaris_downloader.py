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


if __name__ == "__main__":
    # Define the satellite name, start date, and end date
    sat_name = "LightSail-2"
    start_date = "2020-01-21"
    end_date = "2020-01-28"

    # Run the polaris fetch command
    run_polaris_fetch(sat_name, start_date, end_date)
