"""
Helpers to incorporate data from different sources.

General input standard format for functions in polaris learn are Pandas
Dataframe.
"""

import json
import logging
import os

import pandas as pd

from src.polarisdataset.dataset import PolarisDataset
from src.polarisdataset.metadata import PolarisMetadata

LOGGER = logging.getLogger(__name__)


class PolarisUnknownFileFormatError(Exception):
    pass


def read_polaris_data(path, csv_sep=","):
    """Read a JSON or CSV file and creates a pandas dataframe out of it.

    :param path: File path for the input file.
    :param csv_sep: The csv separator used for the input csv file.
    :return: Pandas dataframe with all frames fields values and
    the data source name.
    """
    metadata = None
    dataframe = None

    if path.lower().endswith(".csv"):
        metadata, dataframe = read_polaris_data_from_csv(path, csv_sep)

    elif path.lower().endswith(".json"):
        metadata, dataframe = read_polaris_data_from_json(path)

    else:
        LOGGER.critical("Don't know how to load from file %s ", path)
        raise PolarisUnknownFileFormatError

    return metadata, dataframe


def read_polaris_data_from_csv(path, csv_sep=","):
    """Read Polaris data from CSV

    :param path: File path for the input file.
    :param csv_sep: The csv separator used for the input csv file.
    :return: Pandas dataframe with all frames fields values and
    the data source name.
    """
    try:
        dataframe = pd.read_csv(path, sep=csv_sep)
        source = os.path.splitext(path)[0]
        metadata = PolarisMetadata({"satellite_name": source})
        return metadata, dataframe

    except FileNotFoundError as exception_error:
        LOGGER.critical(exception_error)
        raise exception_error


def read_polaris_data_from_json(path):
    """Read Polaris data from JSON

    :param path: File path for the input file.
    :return: Pandas dataframe with all frames fields values and
    the data source name.
    """
    try:
        with open(path, "r") as json_file:
            json_data = json.load(json_file)
    except Exception as exception_error:
        LOGGER.critical(exception_error)
        raise exception_error

    dataset = PolarisDataset(metadata=json_data["metadata"], frames=json_data["frames"])
    dataframe = dataset.to_pandas_dataframe()
    return dataset.metadata, dataframe
