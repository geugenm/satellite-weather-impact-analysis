"""Module to retrieve data
"""

import json
import logging
from datetime import datetime, timedelta

import influxdb_client
import pandas as pd

from vinvelivaanilai.storage.common import IDB_BETA, set_datetime_index

LOGGER = logging.getLogger(__name__)
CH = logging.StreamHandler()
CH.setLevel(logging.DEBUG)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
FORMATTER = logging.Formatter(LOG_FORMAT)
CH.setFormatter(FORMATTER)
LOGGER.addHandler(CH)


def fetch_from_json(path, index_name="EPOCH"):
    """Fetches the timeseries from json

    Args:
        path (string): Path to json file
        index_name (string, optional): Name of the index field.
            Defaults to "EPOCH"

    Returns:
        pd.DataFrame: Contains the data from the json file
    """

    with open(path, "r") as json_file:
        local_df = pd.DataFrame.from_dict(json.loads(json_file.read()))

    LOGGER.info("That was a lot to read 📚")
    LOGGER.info("Setting index and other stuff")

    local_df = set_datetime_index(local_df, index_name)

    return local_df


# pylint: disable=too-many-arguments
def fetch_from_influxdb(
    start_time,
    end_time,
    measurement_name,
    bucket_name,
    limit=10000,
    rename_to="EPOCH",
):
    """Fetches all the TLEs from influxdb (2.0)

    Args:
        start_time (datetime.datetime): Start time in query
        end_time (datetime.datetime): Stop time in query
        measurement_name (str): Name of the measurement to fetch from
        bucket_name (str): Name of the bucket to fetch from
        limit (int, optional): The maximum number of data points required.
            Defaults to 10000.
        rename_to (str, optional): New name of _time column.
            Defaults to "EPOCH".

    Returns:
        pd.DataFrame: DataFrame containing the timeseries data from influxdb
    """
    # Initialise client and the query api
    client = influxdb_client.InfluxDBClient(
        url=IDB_BETA["host"],
        token=IDB_BETA["token"],
        org=IDB_BETA["org"],
        debug=False,
    )
    query_client = client.query_api()

    # The query selects the bucket, defines the timerange,
    # gets all measurements, pivots the table (to have field names as columns)
    # drops the unnecessary columns, sort by time (descending),
    # limits the number of outputs
    query = (
        'from(bucket: "{0}")'
        "|> range(start: {1}, stop: {2})"
        '|> filter(fn: (r) => r["_measurement"] == "{3}")'
        '|> pivot(rowKey:["_time"],columnKey:["_field"],valueColumn:"_value")'
        '|> drop(columns: ["_start", "_stop", "_measurement"])'
        '|> sort(columns: ["_time"], desc: true)'
        "|> limit(n:{4}, offset: 0)"
    ).format(
        bucket_name,
        datetime.isoformat(start_time) + "Z",
        datetime.isoformat(end_time) + "Z",
        measurement_name,
        limit,
    )

    LOGGER.info(query)

    # To select all data
    local_dataframe = query_client.query_data_frame(query)

    # Housekeeping
    query_client.__del__()
    client.close()

    if local_dataframe.empty:
        LOGGER.info("Results of the query were empty! Try a different range.")
        return None

    # Remove unnecessary columns, rename time and set the datetime index
    local_dataframe.drop(columns=["result", "table"], inplace=True)
    local_dataframe.rename(columns={"_time": rename_to}, inplace=True)
    local_dataframe = set_datetime_index(
        dataframe=local_dataframe, field_name=rename_to
    )

    LOGGER.info(
        "Bucket this and measure that, organizations and fields are mad."
        "Your results are ready."
    )

    return local_dataframe


def fetch_nearest_from_influxdb(
    epoch_time, measurement_name, bucket_name, rename_to
):
    """Fetches data from influxdb (2.0) nearest to epoch_time

    Args:
        epoch_time (datetime.datetime): Epoch time nearest
        measurement_name (str): Name of the measurement being fetched
        bucket_name (str): Name of the bucket from which data is fetched
        rename_to (str): Column to rename "_time" to

    Raises:
        TypeError: When epoch_time is not an instance of datetime.datetime

    Returns:
        pd.DataFrame: DataFrame containing the data from influxdb
    """

    if not isinstance(epoch_time, datetime):
        raise TypeError(
            "Expected {} got {} for epoch_time".format(
                datetime, type(epoch_time)
            )
        )

    local_dataframe = fetch_from_influxdb(
        start_time=epoch_time - timedelta(days=7),
        end_time=epoch_time,
        measurement_name=measurement_name,
        bucket_name=bucket_name,
        limit=1,
        rename_to=rename_to,
    )

    return local_dataframe


def get_nearest_from_df(epoch_time, dataframe):
    """Gets the data closest to epoch_time from dataframe

    Args:
        epoch_time (datetime.datetime): Time closest to which data is found
        dataframe (pd.DataFrame): Timeseries (DataFrame) with data

    Raises:
        TypeError: When epoch_time is not an instance of datetime class
        TypeError: When dataframe is not pd.DataFrame
        TypeError: When dataframe.index is not pd.DatetimeIndex

    Returns:
        dict: TLE data for DatetimeIndex closest to epoch_time
    """
    if not isinstance(epoch_time, datetime):
        raise TypeError(
            "Expected {} got {} for epoch_time".format(
                datetime, type(epoch_time)
            )
        )

    if not isinstance(dataframe, pd.DataFrame):
        raise TypeError(
            "Expected {} got {} for dataframe".format(
                pd.DataFrame, type(dataframe)
            )
        )

    if not isinstance(dataframe.index, pd.DatetimeIndex):
        raise TypeError(
            "Expected {} got {} for dataframe.index".format(
                pd.DatetimeIndex, type(dataframe.index)
            )
        )

    local_df = dataframe.copy()

    LOGGER.info(
        "Finding the nearest tle for %s", datetime.isoformat(epoch_time)
    )

    nearest_df = local_df.iloc[
        local_df.index.get_loc(epoch_time, method="nearest")
    ]

    return nearest_df.to_dict()


def get_multiple_nearest_from_df(epoch_times, dataframe, index_name="Date"):
    """Function to retrieve data closest to epoch_time in epoch_times

    Args:
        epoch_times (pd.Series): List of times for which nearest data has to
            be found
        dataframe (pd.DataFrame): Contains data. Index is an instance of
            pd.DatetimeIndex
        index_name (str, optional): Name of the index column (or time column).
            Defaults to "Date".

    Raises:
        ValueError: If the name index_name does not belong to any column

    Returns:
        pd.DataFrame: DataFrame with index epoch_times and data is from
            dataframe
    """
    local_df = dataframe.copy()

    epoch_df = pd.DataFrame(
        pd.to_datetime(epoch_times.to_list()), columns=[index_name]
    )
    if isinstance(local_df.index, pd.DatetimeIndex):
        local_df.reset_index(inplace=True)

    if index_name not in local_df.columns:
        raise ValueError(
            "Index {} not in columns of input dataframe".format(index_name)
        )

    local_df[index_name] = pd.to_datetime(local_df[index_name])

    return pd.merge_asof(epoch_df, local_df, on="Date").set_index("Date")
