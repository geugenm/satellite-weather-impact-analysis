import os
import re
import subprocess
import time


def extract_satellite_name(url: str) -> str:
    """Extract the satellite name from the dashboard URL."""
    # Extract name from URL pattern like /d/abEVHMIIk/veronika
    match = re.search(r"/d/[A-Za-z0-9]+/([a-zA-Z0-9-]+)", url)
    if match:
        return match.group(1)
    return "unknown"


def process_satellite_urls(
    input_file: str, time_from: str = "-4y", time_to: str = "now"
) -> None:
    """Process each satellite URL from the input file."""
    # Ensure input file exists
    if not os.path.exists(input_file):
        print(f"error: input file '{input_file}' not found")
        return

    # Read URLs from file
    with open(input_file, "r") as f:
        urls = [line.strip() for line in f if line.strip()]

    # Process each URL
    for i, url in enumerate(urls):
        sat_name = extract_satellite_name(url)
        print(f"processing {i+1}/{len(urls)}: {sat_name}")

        # Build command
        cmd = [
            "python",
            "../astra/fetch/satnogs_dashboard/main.py",
            url,
            sat_name,
            f"--from={time_from}",
            f"--to={time_to}",
        ]

        # Execute command
        try:
            # Run process and capture output
            result = subprocess.run(
                cmd, check=True, capture_output=True, text=True
            )
            print(f"success: {sat_name}")
            print(result.stdout.strip())
        except subprocess.CalledProcessError as e:
            print(f"error processing {sat_name}: {e}")
            print(f"stdout: {e.stdout}")
            print(f"stderr: {e.stderr}")
        except Exception as e:
            print(f"unexpected error processing {sat_name}: {e}")

        # Add a small delay between requests to avoid overwhelming the server
        time.sleep(1)


if __name__ == "__main__":
    # File containing satellite URLs, one per line
    input_file = "sats.txt"

    # Time range for data extraction
    time_from = "-4y"  # 4 years back
    time_to = "now"  # Current time

    # Process all satellites
    process_satellite_urls(input_file, time_from, time_to)
