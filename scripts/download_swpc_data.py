import os
from pathlib import Path
import requests
import pandas as pd
from concurrent.futures import ThreadPoolExecutor, as_completed

URLS = [
    "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json",
    "https://www.sidc.be/SILSO/INFO/sndtotcsv.php",
    "https://www.sidc.be/SILSO/INFO/sndhemcsv.php",
    "https://spaceweather.gc.ca/solar_flux_data/daily_flux_values/fluxtable.txt",
]

TARGET_DIR = Path("../downloads/sun").absolute()
TARGET_DIR.mkdir(parents=True, exist_ok=True)


def download_and_process(url: str) -> None:
    file_name = url.split("/")[-1]
    file_path = TARGET_DIR / file_name

    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        with open(file_path, "wb") as file:
            file.write(response.content)

        print(f"Downloaded {file_name}")

        if file_name == "sndtotcsv.php":
            convert_to_csv(file_path, "daily_total_sunspot_number.csv")
        elif file_name == "sndhemcsv.php":
            convert_to_csv(file_path, "daily_hemispheric_sunspot_number.csv")
        elif file_name == "fluxtable.txt":
            remove_dashes_from_second_line(file_path)

    except requests.RequestException as e:
        print(f"Failed to download {url}: {e}")


def convert_to_csv(file_path: Path, output_file: str) -> None:
    try:
        df = pd.read_csv(
            file_path, delimiter=";", header=None, usecols=[0, 1, 2, 3, 4, 5, 6]
        )

        df.columns = [
            "year",
            "month",
            "day",
            "decimal_year",
            "SNvalue",
            "SNerror",
            "Nb_observations",
        ]

        df["Time"] = pd.to_datetime(df[["year", "month", "day"]])
        df.drop(columns=["year", "month", "day", "decimal_year"], inplace=True)

        output_path = TARGET_DIR / output_file
        df.to_csv(output_path, index=False)

        print(f"Processed and saved to {output_path}")
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
    finally:
        os.remove(file_path)


def remove_dashes_from_second_line(file_path: Path) -> None:
    with open(file_path, "r") as file:
        lines = file.readlines()

    lines.pop(1)

    with open(file_path, "w") as file:
        file.writelines(lines)

    print(f"Cleaned the second line from {file_path}")


def main() -> None:
    with ThreadPoolExecutor() as executor:
        futures = {
            executor.submit(download_and_process, url): url for url in URLS
        }

        for future in as_completed(futures):
            url = futures[future]
            try:
                future.result()
            except Exception as e:
                print(f"Error processing {url}: {e}")


if __name__ == "__main__":
    main()
