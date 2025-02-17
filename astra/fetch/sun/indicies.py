from astra.fetch.sun.data_processor import DataProcessor
import pandas as pd
import ftplib
from urllib.parse import urlparse
import re
import numpy as np
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


def fetch_filtered_files_and_content(
    url: str, year_from: int, name: str
) -> pd.DataFrame:
    parsed_url = urlparse(url)
    dfs: list[pd.DataFrame] = []

    with ftplib.FTP(parsed_url.netloc) as ftp:
        logging.info(f"Connecting to FTP server: {parsed_url.netloc}")
        ftp.login()
        ftp.cwd(parsed_url.path)
        logging.info(f"Changed directory to: {parsed_url.path}")

        files: list[str] = [
            file
            for file in ftp.nlst()
            if (
                file.lower().endswith(f"_{name}.txt")
                and int(file.split("_")[0].split("Q")[0]) >= year_from
            )
        ]
        logging.info(f"Filtered files: {files}")

        for file in files:
            lines: list[str] = []
            ftp.retrlines(f"RETR {file}", lines.append)
            dfs.append(extract_data_regex(name, "\n".join(lines)))

    return pd.concat(dfs)


def set_datetime_index(
    dataframe: pd.DataFrame, field_name: str = "EPOCH"
) -> pd.DataFrame:
    if isinstance(dataframe.index, pd.DatetimeIndex):
        return dataframe

    if field_name not in dataframe.columns:
        raise ValueError(f"column '{field_name}' does not exist")

    field = dataframe[field_name]

    if not pd.api.types.is_datetime64_any_dtype(field):
        if pd.api.types.is_numeric_dtype(field):
            unit = "s" if field.iloc[0] < 10**11 else "ms"
            dataframe[field_name] = pd.to_datetime(
                field, origin="unix", unit=unit
            )
        else:
            dataframe[field_name] = pd.to_datetime(field)

    return dataframe.set_index(field_name)


def extract_data_regex(name: str, content: str) -> pd.DataFrame:
    time: str = r"^(\d{2} [a-zA-Z]{3} \d{2}|\d{4} *\d{2} *\d{2}) *"

    column_dict: dict[str, str]
    name = name.strip().lower()

    match name:
        case "dgd":
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

        case "dsd":
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

        case _:
            raise ValueError(f"dataset '{name}' not supported")

    data: list[tuple] = []
    matches = re.finditer(regex, content, re.MULTILINE)

    for match in matches:
        data.append(match.groups())

    if not data:
        match_samples = [m.groups() for m in matches][:5]
        raise ValueError(
            f"no valid data patterns found\n"
            f"|→ total matches: {len(match_samples)}\n"
            f"|→ sample groups: {[g for g in match_samples if g] or '∅'}\n"
            "validate: [1] file contents  [2] pattern groups  [3] encoding"
        )

    dataframe = pd.DataFrame(data, columns=column_dict.keys())
    dataframe = set_datetime_index(dataframe, "time")

    null_value: str
    for column in dataframe.columns:
        null_value = column_dict[column]

        dataframe[column] = pd.to_numeric(
            dataframe[column].apply(lambda x: np.nan if x == null_value else x),
            errors="coerce",
        )

    return dataframe


class IndiciesProcessor(DataProcessor):
    output_prefix = "swpc_noaa_dgd_dsd_indicies"
    url = "ftp://ftp.swpc.noaa.gov/pub/indices/old_indices/"

    year_from: int = 2014

    def download(self) -> pd.DataFrame:
        dgd_df: pd.DataFrame = fetch_filtered_files_and_content(
            self.url, self.year_from, "dgd"
        )
        logging.info("Fetched DGD data")

        dsd_df: pd.DataFrame = fetch_filtered_files_and_content(
            self.url, self.year_from, "dsd"
        )
        logging.info("Fetched DSD data")

        return pd.merge(dgd_df, dsd_df, on="time").drop(
            columns=["goes15_xray_background_flux", "stanford_solar_mean_field"]
        )

    def process(self, data: pd.DataFrame) -> pd.DataFrame:
        return self.sanitize_columns(data.reset_index())


if __name__ == "__main__":
    processor = IndiciesProcessor()
    processor.run()
