"""Module for fetching files from SWPC"""

import datetime
import ftplib
import logging
import os
from time import sleep

from space_weather import sw_extractor

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


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
    if index not in ("DSD", "DPD", "DGD"):
        raise ValueError("Index {} is not currently supported".format(index))

    today = datetime.datetime.now()
    if final_date is None:
        final_date = today
        LOGGER.info(
            "No final_date specified, assuming %s", final_date.isoformat()
        )

    if not isinstance(final_date, datetime.datetime):
        raise TypeError(
            "Expected {} got {} for final_date".format(
                datetime.datetime, type(final_date)
            )
        )

    if start_date is None:
        start_date = final_date - datetime.timedelta(weeks=48)
        LOGGER.info(
            "No start_date specified, assuming %s", start_date.isoformat()
        )

    if not isinstance(start_date, datetime.datetime):
        raise TypeError(
            "Expected {} got {} for start_date".format(
                datetime.datetime, type(start_date)
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

    return sw_extractor.extract_data_from_multiple(index, file_name_list)


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
