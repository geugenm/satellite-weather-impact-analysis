import requests
from pathlib import Path
import pandas as pd

# fixme: download csv instead of .php data
urls = [
    "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json",  # JSON file
    "https://www.sidc.be/SILSO/INFO/sndtotcsv.php",  # Daily total sunspot number CSV
    "https://www.sidc.be/SILSO/INFO/sndhemcsv.php",  # Daily hemispheric sunspot number CSV
    "https://spaceweather.gc.ca/solar_flux_data/daily_flux_values/fluxtable.txt",  # Daily flux values
]

# fixme: format is incorrect
# Daily hemispheric sunspot number (1992-now):
# sndhemcsv.php (CSV format)
# Contents: year, month, day, decimal year, SNvalue(tot), SNvalue(N), SNvalue(S), SNerror(tot), SNerror(N), SNerror(S), Nb observations
# Comment: The yearly files are replaced by a single file. Total numbers are included next to the North and South numbers.

# Daily total sunspot number (1818-now):
# sndtotcsv.php (CSV format)
# Contents: year, month, day, decimal year, SNvalue , SNerror, Nb observations

target_dir = Path("downloads").absolute()
target_dir.mkdir(parents=True, exist_ok=True)

for url in urls:
    file_name = url.split("/")[-1]
    file_path = target_dir / file_name

    try:
        response = requests.get(url)
        response.raise_for_status()

        with open(file_path, "wb") as file:
            file.write(response.content)

        print(f"Downloaded file to: {file_path}")

        if file_name == "sndtotcsv.php":
            df_total = pd.read_csv(file_path, delimiter=";", header=None)
            df_total.columns = [
                "year",
                "month",
                "day",
                "decimal_year",
                "SNvalue",
                "SNerror",
                "Nb_observations",
                "???",
            ]
            print(df_total.head())

            total_csv_path = target_dir / "daily_total_sunspot_number.csv"
            df_total.to_csv(total_csv_path, index=False)
            print(f"Saved processed data to: {total_csv_path}")

        elif file_name == "sndhemcsv.php":
            df_hemispheric = pd.read_csv(file_path, delimiter=";", header=None)
            df_hemispheric.columns = [
                "year",
                "month",
                "day",
                "decimal_year",
                "SNvalue_tot",
                "SNvalue_N",
                "tot??",
                "SNvalue_S",
                "tot??",
                "SNerror_tot",
                "SNerror_N",
                "tot??",
                "SNerror_S",
                "Nb_observations",
            ]
            print(df_hemispheric.head())

            hemispheric_csv_path = target_dir / "daily_hemispheric_sunspot_number.csv"
            df_hemispheric.to_csv(hemispheric_csv_path, index=False)
            print(f"Saved processed data to: {hemispheric_csv_path}")

    except requests.RequestException as e:
        print(f"Failed to download {url}: {e}")
