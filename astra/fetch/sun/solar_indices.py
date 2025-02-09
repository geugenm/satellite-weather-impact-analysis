import logging
import re

import numpy as np
import pandas as pd

from pathlib import Path
from datetime import datetime, timedelta

import ftplib
import logging
import os
from time import sleep

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


def set_datetime_index(dataframe, field_name="EPOCH"):
    """Converts field_name in dataframe to pd.DatetimeIndex

    Args:
        dataframe (pd.DataFrame): DataFrame with field_name column to be
            converted to timeseries
        field_name (str, optional): Name of field with timeseries data.
            Defaults to 'EPOCH'.

    Raises:
        ValueError: If field_name does not exist in dataframe's columns

    Returns:
        pd.DataFrame: Original Data with `field_name` set as pd.DatetimeIndex
    """
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


class NoSpaceWeatherForIndex(Exception):
    """Raised when we have no sw data for a specific index"""


def extract_data_regex(name, path_to_file):
    """Extracts data from path_to_file based on name

    Args:
        name (str): One of dgd, dpd, dsd
        path_to_file (str): Path to file containing data

    Raises:
        ValueError: If name is not in ("dgd", "dsd")
        ValueError: If no match is found in data

    Returns:
        pd.DataFrame: DataFrame containing all the data
    """
    date = r"^(\d{2} [a-zA-Z]{3} \d{2}|\d{4} *\d{2} *\d{2}) *"

    if name.strip().lower() == "dgd":
        column_dict = {
            "Date": "",
            "Fredericksburg A": "-1",
            "Fredericksburg K 0-3": "-1",
            "Fredericksburg K 3-6": "-1",
            "Fredericksburg K 6-9": "-1",
            "Fredericksburg K 9-12": "-1",
            "Fredericksburg K 12-15": "-1",
            "Fredericksburg K 15-18": "-1",
            "Fredericksburg K 18-21": "-1",
            "Fredericksburg K 21-24": "-1",
            "College A": "-1",
            "College K 0-3": "-1",
            "College K 3-6": "-1",
            "College K 6-9": "-1",
            "College K 9-12": "-1",
            "College K 12-15": "-1",
            "College K 15-18": "-1",
            "College K 18-21": "-1",
            "College K 21-24": "-1",
            "Planetary A": "-1",
            "Planetary K 0-3": "-1",
            "Planetary K 3-6": "-1",
            "Planetary K 6-9": "-1",
            "Planetary K 9-12": "-1",
            "Planetary K 12-15": "-1",
            "Planetary K 15-18": "-1",
            "Planetary K 18-21": "-1",
            "Planetary K 21-24": "-1",
        }
        aindices = r"(-1|\d{1,3}) *"
        kindices = r"(-1|\d{1}|\d{1}\.\d{2}) *"
        regex = date + (aindices + kindices * 8) * 3 + r"$"

    elif name.strip().lower() == "dsd":
        column_dict = {
            "Date": "",
            "Radio Flux": "-1",
            "SESC sunspot number": "*",
            "Sunspot Area": "-1",
            "New Regions": "-1",
            "Solar Mean Field": "-999",
            "X-ray Background Flux": "*",
            "X-Ray C": "-1",
            "X-Ray M": "-1",
            "X-Ray X": "-1",
            "X-Ray S": "-1",
            "Optical 1": "-1",
            "Optical 2": "-1",
            "Optical 3": "-1",
        }
        # Radio Flux, Sunspot Area, New regions, Flares
        type1 = r"(-1|\d+) *"
        # SESC sunspot number,
        sunspot = r"(\*|\d+) *"
        # X-ray bgnd flux
        xrbflux = r"(\*|[AB]\d\.\d) *"
        # Solar mean field
        smfield = r"(-999|\d+) *"
        regex = (
            date + type1 + sunspot + type1 * 2 + smfield + xrbflux + type1 * 7
        )

    else:
        raise ValueError("The data {} is not supported yet".format(name))

    data = []
    matches = None

    file_path = Path(path_to_file).resolve()

    with open(file_path) as file:
        LOGGER.info("Extracting data from %s", file_path)
        matches = re.finditer(regex, file.read(), re.MULTILINE)

        for match in matches:
            data.append(match.groups())

    if data == []:
        match_samples = [m.groups() for m in matches][
            :5
        ]  # First 5 matches for diagnostics
        raise ValueError(
            f"no valid data patterns found in '{file_path.resolve()}'\n"
            f"|→ total matches: {len(match_samples)}\n"
            f"|→ sample groups: {[g for g in match_samples if g] or '∅'}\n"
            "validate: [1] file contents  [2] pattern groups  [3] encoding"
        )

    dataframe = pd.DataFrame(data, columns=column_dict.keys())
    dataframe = set_datetime_index(dataframe, "Date")

    null_value = ""
    for column in dataframe.columns:
        null_value = column_dict[column]

        dataframe[column] = pd.to_numeric(
            dataframe[column].apply(lambda x: np.nan if x == null_value else x),
            errors="coerce",
        )

    return dataframe


def extract_data_from_multiple(name, path_to_files):
    """Extract data from multiple files

    Args:
        name (str): Name of the index in the file
        path_to_files (list): List containing paths to the files

    Returns:
        data (pd.DataFrame): Dataframe containing all the extracted data
    """
    if not name.strip().upper() in ("DGD", "DSD"):
        raise ValueError("{} not in 'DGD', 'DSD'".format(name.upper()))

    if not isinstance(path_to_files, list):
        raise ValueError(
            "Expected {} got {} for path_to_files".format(
                list, type(path_to_files)
            )
        )

    dfs = []

    for file in path_to_files:
        dfs.append(extract_data_regex(name, file))

    try:
        data = pd.concat(dfs)
    except ValueError:
        raise NoSpaceWeatherForIndex(
            "No space weather data for {} index".format(name)
        ) from None

    return data


# pylint: disable=too-many-branches
def fetch_indices(index, start_date=None, final_date=None, directory=None):
    """Fetch files corresponding to `index` from SWPC over the date range
    `start_date` to `final_date`. The files are saved in the CWD.

    Args:
        index (str): The swpc index to fetch ('DSD', 'DPD', 'DGD')
        start_date (datetime.datetime): The start date for indices to fetch.
            Default is final_date - 1 year.
        final_date (datetime.datetime): The end date for indices to be fetched.
            Default is datetime.now().
        directory (str): Path to directory where files are stored. Default CWD

    Returns:
        pd.DataFrame: Dataframe containing all the data fetched from SWPC
    """

    index = index.upper()
    if index not in ("DSD", "DGD"):
        raise ValueError("Index {} is not currently supported".format(index))

    today = datetime.now()
    if final_date is None:
        final_date = today
        LOGGER.info(
            "No final_date specified, assuming %s", final_date.isoformat()
        )

    if not isinstance(final_date, datetime):
        raise TypeError(
            "Expected {} got {} for final_date".format(
                datetime, type(final_date)
            )
        )

    if start_date is None:
        start_date = final_date - timedelta(weeks=48)
        LOGGER.info(
            "No start_date specified, assuming %s", start_date.isoformat()
        )

    if not isinstance(start_date, datetime):
        raise TypeError(
            "Expected {} got {} for start_date".format(
                datetime, type(start_date)
            )
        )

    if start_date > final_date:
        raise ValueError("start_date greater than final_date")

    if directory is None:
        directory = os.getcwd()

    if os.path.exists(directory):
        if not os.path.isdir(directory):
            raise ValueError("{} is not a folder".format(directory))
    else:
        LOGGER.info("Path %s not found, creating", directory)
        os.makedirs(directory, exist_ok=True)

    err = ""

    for attempt in range(1, 4):
        LOGGER.info("Attempt number: %d to fetch index %s", attempt, index)
        try:
            data = _fetch_attempt(index, start_date, final_date, directory)
            break
        except (EOFError, ConnectionRefusedError) as error_name:
            err = error_name
            sleep(20)
            continue
    else:
        raise ConnectionError("Could not connect to ftp.swpc.noaa.gov", err)

    return data


def _fetch_attempt(index, start_date, final_date, directory):
    """Internal function, attempt to fetch index between start and final date

    Args:
        index (str): The swpc index to fetch ('DSD', 'DPD', 'DGD')
        start_date (datetime.datetime): The start date for indices to fetch.
        final_date (datetime.datetime): The end date for indices to be fetched.
        directory (str): Path to directory where files are stored

    Returns:
        pd.DataFrame: DataFrame containing all data fetched from swpc
    """
    root_url = "ftp.swpc.noaa.gov"
    old_indices_dir = "pub/indices/old_indices"
    file_name_list, file_base_name_list = _fetch_file_names(
        index, start_date, final_date, directory
    )

    to_fetch = []
    for file_name, file_base_name in zip(file_name_list, file_base_name_list):
        if not os.path.isfile(file_name):
            LOGGER.debug("%s does not exist", str(file_name))
            to_fetch.append((file_name, file_base_name))
        else:
            LOGGER.debug("Skipping %s, file exists", file_name)

    if to_fetch != []:
        with ftplib.FTP(root_url) as ftp:
            # Anonymous login
            LOGGER.info(ftp.login())
            ftp.cwd(old_indices_dir)

            for file_name, file_base_name in to_fetch:
                try:
                    with open(file_name, "wb") as index_file:
                        LOGGER.info("Fetching file at %s", file_name)
                        ftp.retrbinary(
                            "RETR {0}".format(file_base_name),
                            index_file.write,
                        )
                except ftplib.error_perm as error_name:
                    file_name_list.remove(
                        os.path.join(directory, file_base_name)
                    )
                    os.remove(file_name)
                    LOGGER.info(error_name)
                    continue

    return extract_data_from_multiple(index, file_name_list)


def _fetch_file_names(index, start_date, final_date, directory):
    """Fetches file names and file base names for index

    Args:
        index (str): Name of index to fetch
        start_date (datetime.datetime): The start date for indices to fetch.
        final_date (datetime.datetime): The end date for indices to be fetched.
        directory (str): Path to directory where files are stored

    Returns:
        tuple: tuple containing two lists, one with file_name, the other with
            the base name.
    """
    LOGGER.debug("Getting files list")
    file_name_list = []
    file_base_name_list = []

    start_year = start_date.year
    final_year = final_date.year

    for year in range(start_year, final_year + 1):
        if year < 2019:
            file_base_name = "{0}_{1}.txt".format(year, index)
            file_name = os.path.join(directory, file_base_name)
            file_name_list.append(str(file_name))
            file_base_name_list.append(str(file_base_name))
        else:
            for i in range(1, 5):
                if year == final_date.year and i > (
                    (final_date.month - 1) // 3 + 1
                ):
                    break
                # DPD not supported for this quarter yet
                if index == "DPD" and year == 2020 and i >= 2:
                    break

                file_base_name = "{0}Q{1}_{2}.txt".format(year, i, index)
                file_name = os.path.join(directory, file_base_name)
                file_name_list.append(str(file_name))
                file_base_name_list.append(str(file_base_name))

    LOGGER.debug("List of files %s", str(file_name_list))

    return file_name_list, file_base_name_list
