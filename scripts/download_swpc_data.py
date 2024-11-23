import os
from pathlib import Path
import requests
import pandas as pd

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
        response = requests.get(url)
        response.raise_for_status()

        with open(file_path, "wb") as file:
            file.write(response.content)

        print(f"Downloaded file to: {file_path}")

        if file_name == "sndtotcsv.php":
            convert_to_csv(
                file_path,
                [
                    "year",
                    "month",
                    "day",
                    "decimal_year",
                    "SNvalue",
                    "SNerror",
                    "Nb_observations",
                ],
                "daily_total_sunspot_number.csv",
            )

        elif file_name == "sndhemcsv.php":
            convert_to_csv(
                file_path,
                [
                    "year",
                    "month",
                    "day",
                    "decimal_year",
                    "SNvalue_tot",
                    "SNvalue_N",
                    "SNvalue_S",
                    "SNerror_tot",
                    "SNerror_N",
                    "SNerror_S",
                    "Nb_observations",
                ],
                "daily_hemispheric_sunspot_number.csv",
            )

    except requests.RequestException as e:
        print(f"Failed to download {url}: {e}")


def convert_to_csv(file_path: Path, column_names: list[str], output_file: str) -> None:
    df = pd.read_csv(file_path, delimiter=";", header=None)

    if len(column_names) < df.shape[1]:
        df = df.iloc[:, : len(column_names)]
        print(f"Dropped excess columns. New shape: {df.columns}")

    df.columns = column_names

    df.drop(columns=["decimal_year"], inplace=True)

    df["Time"] = pd.to_datetime(df[["year", "month", "day"]])

    df.drop(columns=["year", "month", "day"], inplace=True)

    output_path = TARGET_DIR / output_file
    df.to_csv(output_path, index=False)
    print(f"Saved processed data to: {output_path}")

    os.remove(file_path)


if __name__ == "__main__":
    for url in URLS:
        download_and_process(url)
