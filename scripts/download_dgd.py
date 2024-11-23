# Must have patched by ext/vinvelivaanilai_new_dgd_support.patch installed on python 3.8 vinvelivaanilai
# https://gitlab.com/librespacefoundation/polaris/vinvelivaanilai

from vinvelivaanilai.space_weather.sw_file_fetch import fetch_indices
from vinvelivaanilai.space_weather.sw_extractor import extract_data_regex

import pandas as pd
import datetime
from pathlib import Path

import os

download_dir = (Path("downloads") / "dgd").absolute()
download_dir.mkdir(parents=True, exist_ok=True)

os.chdir(download_dir)

start_date = datetime.datetime(year=2016, month=1, day=1)
final_date = datetime.datetime(year=2024, month=11, day=21)

print(f"Downloading DGD to '{download_dir}'...")
fetch_indices("DGD", start_date, final_date)

dataframes = []

for filename in download_dir.glob("*.txt"):
    df = extract_data_regex("DGD", filename)
    dataframes.append(df)

merged_df = pd.concat(dataframes, ignore_index=False)

merged_df.to_csv(download_dir / "../dgd.csv")

print(f"Saved final dataframe to '{download_dir}/../dgd.csv'")
