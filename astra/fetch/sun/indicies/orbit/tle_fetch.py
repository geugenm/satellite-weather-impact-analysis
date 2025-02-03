"""Module for fetching and storing TLEs
"""

import itertools
import logging
import re
from datetime import datetime, timedelta

import pandas as pd
import requests
from astropy.time import Time
from pandas.errors import EmptyDataError, ParserError

from vinvelivaanilai.storage.common import set_datetime_index

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


class NoDataError(Exception):
    """Error when no data was found"""


def short_to_long_year(short_year):
    """Converts 2 digit year to 4 digit year (as used in TLE)

    Args:
        short_year (int): 2 digit integer year number (0-99)

    Raises:
        TypeError: When short_year is not an int
        ValueError: When short_year is not between 0 and 99 (incl.)

    Returns:
        int: Long version of the year
    """
    if not isinstance(short_year, int):
        raise TypeError(
            "Expected {} got {} for short_year".format(int, type(short_year))
        )

    if short_year < 0 or short_year > 99:
        raise ValueError(
            "Expected 99 > short_year > 0, got {}.".format(short_year)
        )

    return (2000 + short_year) if short_year < 57 else (1900 + short_year)


def convert_tle_to_format(tle, satellite_name):
    """Converts TLE to a dict with ('EPOCH', 'NORAD_CAT_ID', 'TLE_LINE0',
    'TLE_LINE1', 'TLE_LINE2') as keys

    Args:
        tle (list): Two items. First is TLE Line 1, Second is TLE Line 2
        satellite_name (string): Name of the satellite

    Raises:
        TypeError: When tle is not a list/tuple
        ValueError: If the tle[0] does not match the format (TLE_LINE1)

    Returns:
        dict: Dictionary with data in required format
    """
    # Current format
    # ('EPOCH', 'NORAD_CAT_ID', 'TLE_LINE0', 'TLE_LINE1', 'TLE_LINE2')

    if not isinstance(tle, (tuple, list)):
        raise TypeError("Expected {} got {} for tle".format(list, type(tle)))

    # Extracts NORAD_ID and date from TLE_LINE1
    segment_tle = r"(^1 ([0-9]+).*\ ([0-9]{2})([0-9]{3}\.[0-9]*)\ .*$)"
    matches = re.findall(segment_tle, tle[0])

    if matches == []:
        raise ValueError("Your TLE appears to be empty or wrong!")

    formatted = {}
    for match in matches:
        short_year = int(match[2])
        year = short_to_long_year(short_year)
        days = float(match[3]) - 1
        formatted["EPOCH"] = datetime(year=year, month=1, day=1) + timedelta(
            days=days
        )
        formatted["NORAD_CAT_ID"] = int(match[1])
        formatted["TLE_LINE0"] = "0 {}".format(satellite_name)
        formatted["TLE_LINE1"] = match[0]
        formatted["TLE_LINE2"] = tle[1]
    return formatted


def fetch_latest_omm_from_celestrak(path, group_name, mode="w"):
    """Fetches OMM data from celestrak in csv format. Read more at
    https://www.celestrak.com/NORAD/documentation/gp-data-formats.php

    Args:
        path (str): Path to csv file
        group_name (str): Name of group of satellites (or of satellite)
            for which OMMs have to be fetched
        mode (str): "w" (to overwrite) or "a" (to append)

    Raises:
        SystemExit: When there is a problem with http request
        NoDataError: When the response contains no data

    Returns:
        pd.DataFrame: DataFrame containing OMMs
    """
    query = (
        "https://www.celestrak.com/NORAD/elements/gp.php?GROUP={}"
        "&FORMAT=csv".format(group_name)
    )

    try:
        response = requests.get(query)
        response.raise_for_status()
    except requests.RequestException as err:
        LOGGER.info(
            "Uh oh, problems with the requests! Try again/fix your query"
        )
        raise SystemExit(err) from err

    if response.text == "No GP data found":
        query = (
            "https://www.celestrak.com/NORAD/elements/gp.php?NAME={}"
            "&FORMAT=csv".format(group_name)
        )
        try:
            response = requests.get(query)
        except requests.RequestException as err:
            LOGGER.info(
                "Uh oh, problems with the requests! Try again/fix your query"
            )
            raise SystemExit(err) from err

        if response.text == "No GP data found":
            raise NoDataError(response.text, query)

    with open(path, mode) as csv_file:
        csv_file.write(str(response.text))

    return fetch_from_celestrak_csv(path)


def fetch_from_celestrak_csv(path):
    """Fetches data from celestrak csv (OMM format)

    Args:
        path (str): Path to csv file fetched

    Returns:
        pd.DataFrame: DataFrame containing OMMs
    """
    try:
        omm_df = pd.read_csv(path)
    except (OSError, FileNotFoundError, EmptyDataError, ParserError) as err:
        LOGGER.error("Problem with file at %s", path)
        LOGGER.info("Check the file name, permissions and data")
        raise err

    omm_df["EPOCH"] = omm_df["EPOCH"].apply(
        lambda x: Time(x, format="isot", scale="utc").tt.datetime
    )
    omm_df = set_datetime_index(omm_df, "EPOCH")

    return omm_df


def fetch_from_celestrak_txt(path, satellite_name):
    """Fetches data from downloaded celestrak txt files

    Args:
        path (str): Path to text file downloaded from celestrak
        satellite_name (str): Name of the satellite

    Returns:
        pd.DataFrame: TLE data from the file in required format
    """
    formatted_tles = []

    with open(path) as file:
        for tle_line1, tle_line2 in itertools.zip_longest(*[file] * 2):
            formatted_tles.append(
                convert_tle_to_format((tle_line1, tle_line2), satellite_name)
            )

    formatted_tles_df = pd.DataFrame(formatted_tles)
    formatted_tle_df = set_datetime_index(formatted_tles_df)

    return formatted_tle_df


def fetch_latest_tle_from_celestrak(norad):
    """Fetches the latest TLE from celestrak for given satellite

    Args:
        norad (int): norad id of satellite

    Raises:
        TypeError: When norad id is not integer

    Returns:
        dict: TLE data in required format
    """
    if not isinstance(norad, int):
        raise TypeError(
            "Expected {} got {} for norad".format(int, type(norad))
        )

    try:
        response = requests.get(
            "https://www.celestrak.com/satcat/tle.php?CATNR={}".format(norad)
        )
        response.raise_for_status()
    except requests.RequestException as err:
        LOGGER.info(
            "Uh oh, problems with the requests! Try again/fix your query"
        )
        raise SystemExit(err) from err

    tle_lines = response.text
    LOGGER.info("tle_lines: %s", tle_lines)

    tle = tle_lines.split("\n")
    tle = [line.strip() for line in tle]

    formatted_tle = convert_tle_to_format(tle[1:3], tle[0])
    return formatted_tle


def fetch_multiple_satellites_tle_from_celestrak(norad_ids):
    """Fetches the latest TLE from celestrak for multiple satellite

    Args:
        norad_ids (list): List of norad ids in integer format

    Raises:
        TypeError: When norad_ids is not a list
        TypeError: When items in norad_ids is not integers

    Returns:
        dict: Dictionary with tle data in required format
    """
    if not isinstance(norad_ids, list):
        raise TypeError(
            "Expected {} got {} for norad_ids".format(list, type(norad_ids))
        )

    if not all(isinstance(x, int) for x in norad_ids):
        raise TypeError("Expected {} for all items in norad_ids".format(int))

    formatted_tle_for_norad_id = {}

    for norad_id in norad_ids:
        formatted_tle_for_norad_id[norad_id] = fetch_latest_tle_from_celestrak(
            norad_id
        )

    return formatted_tle_for_norad_id
