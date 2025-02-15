from data_processor import DataProcessor
import pandas as pd
import ftplib
from urllib.parse import urlparse
import re
from datetime import datetime
import numpy as np


def fetch_filtered_files_and_content(
    url: str, year_from: int, name: str
) -> pd.DataFrame:
    parsed_url = urlparse(url)

    with ftplib.FTP(parsed_url.netloc) as ftp:
        ftp.login()
        ftp.cwd(parsed_url.path)

        filtered_files = [
            file
            for file in ftp.nlst()
            if file.lower().endswith(f"_{name}.txt")
            and int(file.split("_")[0].replace("Q", "")) > year_from
        ]

        dfs = []

        for file_name in filtered_files:
            lines = []
            ftp.retrlines(f"RETR {file_name}", lines.append)
            content = "\n".join(lines)
            dfs.append(extract_data_regex(name, content))

        return pd.concat(dfs)


def set_datetime_index(dataframe, field_name="EPOCH"):
    local_df = dataframe.copy()

    # Check the field exists before using it
    if field_name not in local_df.columns:
        raise ValueError("Column {} does not exist".format(field_name))

    # If the index is already datetime index, ignore field_name
    if isinstance(local_df.index, pd.DatetimeIndex):
        return local_df

    # Check if the field is datetime or int/string
    if not isinstance(local_df[field_name], datetime):
        if isinstance(local_df[field_name][0], (int, float, np.int64)):
            # Unix epoch time of seconds format
            if local_df[field_name][0] < 10**11:
                local_df[field_name] = pd.to_datetime(
                    local_df[field_name], origin="unix", unit="s"
                )
            # Unix epoch time of milliseconds format
            else:
                local_df[field_name] = pd.to_datetime(
                    local_df[field_name], origin="unix", unit="ms"
                )

        else:
            # Unknown string format (automatic decoding)
            local_df[field_name] = pd.to_datetime(local_df[field_name])
    # Set the formatted (datetime) field as index
    local_df.set_index(field_name, inplace=True)

    return local_df


def extract_data_regex(name: str, content) -> pd.DataFrame:
    time = r"^(\d{2} [a-zA-Z]{3} \d{2}|\d{4} *\d{2} *\d{2}) *"

    column_dict = dict[str, str]

    if name.strip().lower() == "dgd":
        column_dict = {
            "time": "",
            "fredericksburg_amplitude_index": "-1",
            "fredericksburg_k_0_3": "-1",
            "fredericksburg_k_3_6": "-1",
            "fredericksburg_k_6_9": "-1",
            "fredericksburg_k_9_12": "-1",
            "fredericksburg_k_12_15": "-1",
            "fredericksburg_k_15_18": "-1",
            "fredericksburg_k_18_21": "-1",
            "fredericksburg_k_21_24": "-1",
            "college_amplitude_index": "-1",
            "college_k_0_3": "-1",
            "college_k_3_6": "-1",
            "college_k_6_9": "-1",
            "college_k_9_12": "-1",
            "college_k_12_15": "-1",
            "college_k_15_18": "-1",
            "college_k_18_21": "-1",
            "college_k_21_24": "-1",
            "planetary_amplitude_index": "-1",
            "planetary_k_0_3": "-1",
            "planetary_k_3_6": "-1",
            "planetary_k_6_9": "-1",
            "planetary_k_9_12": "-1",
            "planetary_k_12_15": "-1",
            "planetary_k_15_18": "-1",
            "planetary_k_18_21": "-1",
            "planetary_k_21_24": "-1",
        }
        amplitude_indices = r"(-1|\d{1,3}) *"
        k_indices = r"(-1|\d{1}|\d{1}\.\d{2}) *"
        regex = time + (amplitude_indices + k_indices * 8) * 3 + r"$"

    elif name.strip().lower() == "dsd":
        column_dict = {
            "time": "",
            "radio_flux_10_7cm": "-1",
            "sesc_sunspot_number": "*",
            "sunspot_area_hemisphere": "-1",
            "new_regions_count": "-1",
            "stanford_solar_mean_field": "-999",
            "goes15_xray_background_flux": "*",
            "xray_c_class_flares": "-1",
            "xray_m_class_flares": "-1",
            "xray_x_class_flares": "-1",
            "xray_s_class_flares": "-1",
            "optical_class1_flares": "-1",
            "optical_class2_flares": "-1",
            "optical_class3_flares": "-1",
        }
        type1 = r"(-1|\d+) *"
        sunspot = r"(\*|\d+) *"
        xray_background_flux = r"(\*|[AB]\d\.\d) *"
        solar_field = r"(-999|\d+) *"
        regex = (
            time
            + type1
            + sunspot
            + type1 * 2
            + solar_field
            + xray_background_flux
            + type1 * 7
        )

    else:
        raise ValueError(f"dataset '{name}' not supported")

    data = []

    matches = re.finditer(regex, content, re.MULTILINE)

    for match in matches:
        data.append(match.groups())

    if data == []:
        match_samples = [m.groups() for m in matches][
            :5
        ]  # First 5 matches for diagnostics
        raise ValueError(
            f"no valid data patterns found\n"
            f"|→ total matches: {len(match_samples)}\n"
            f"|→ sample groups: {[g for g in match_samples if g] or '∅'}\n"
            "validate: [1] file contents  [2] pattern groups  [3] encoding"
        )

    dataframe = pd.DataFrame(data, columns=column_dict.keys())
    dataframe = set_datetime_index(dataframe, "time")

    null_value = ""
    for column in dataframe.columns:
        null_value = column_dict[column]

        dataframe[column] = pd.to_numeric(
            dataframe[column].apply(lambda x: np.nan if x == null_value else x),
            errors="coerce",
        )

    return dataframe


class IndiciesProcessor(DataProcessor):
    output_prefix = "dgd"
    url = "ftp://ftp.swpc.noaa.gov/pub/indices/old_indices/"

    year_from: int = 2024

    def download(self) -> pd.DataFrame:
        merged_df = fetch_filtered_files_and_content(
            self.url, self.year_from, "dgd"
        )
        dsd = fetch_filtered_files_and_content(self.url, self.year_from, "dsd")

        merged_df = pd.merge(merged_df, dsd, on="time")

        # todo, parse this adequately
        merged_df.drop(
            columns=[
                "goes15_xray_background_flux",
                "stanford_solar_mean_field",
            ],
            inplace=True,
        )

        return merged_df

    def process(self, data: pd.DataFrame) -> pd.DataFrame:
        print(data)
        return self.sanitize_columns(data.reset_index())


if __name__ == "__main__":
    processor = IndiciesProcessor()
    processor.run()
