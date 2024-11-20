import requests
from pathlib import Path

urls = [
    "https://services.swpc.noaa.gov/json/solar-cycle/swpc_observed_ssn.json",  # JSON file
    "https://www.sidc.be/SILSO/INFO/sndtotcsv.php",  # Daily total sunspot number CSV
    "https://www.sidc.be/SILSO/INFO/sndhemcsv.php",  # Daily hemispheric sunspot number CSV
    "https://spaceweather.gc.ca/solar_flux_data/daily_flux_values/fluxtable.txt",  # Daily flux values
]

# Daily hemispheric sunspot number (1992-now):
# SN_d_hem_V2.0.txt (column format), SN_d_hem_V2.0.csv (CSV format)
# Contents: year, month, day, decimal year, SNvalue(tot), SNvalue(N), SNvalue(S), SNerror(tot), SNerror(N), SNerror(S), Nb observations
# Comment: The yearly files are replaced by a single file. Total numbers are included next to the North and South numbers.

# Daily total sunspot number (1818-now):
# SN_d_tot_V2.0.txt (column format), SN_d_tot_V2.0.csv (CSV format)
# Contents: year, month, day, decimal year, SNvalue , SNerror, Nb observations

# fixme: so open with pandas sndtotcsv (hemispheric) sndhemcsv (sunshots) and give them name Row, like column names

target_dir = Path("downloads").absolute()
target_dir.mkdir(parents=True, exist_ok=True)

# FIXME: by going to php link im not downloading php, i must just go to that link and it will give me a file
for url in urls:
    file_name = url.split("/")[-1]
    file_path = target_dir / file_name

    try:
        response = requests.get(url)
        response.raise_for_status()

        with open(file_path, "wb") as file:
            file.write(response.content)

        print(f"Downloaded file to: {file_path}")

    except requests.RequestException as e:
        print(f"Failed to download {url}: {e}")
