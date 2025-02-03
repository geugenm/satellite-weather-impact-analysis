"""Module for commonly used functions and constants
"""

import logging
import os
import subprocess
from datetime import datetime
from time import sleep

import numpy as np
import pandas as pd

# For InfluxDB (2.0 beta)
IDB_BETA = {
    "org": "Polaris",
    "token": "vinvelivaanilai_token",
    "host": "http://localhost:9999",
    "default_bucket": "DockerStats",
    "username": "polaris_admin",
    "password": "polaris_admin",
    "retention": 0,
}

DOCKER_COMPOSE_SKELETON = 'version: "3.0"\n\
\n\
volumes:\n\
    influxdb_beta:\n\
\n\
services:\n\
    influxdb_beta:\n\
        image: quay.io/influxdb/influxdb:2.0.0-beta\n\
\n\
        ports:\n\
            - 9999:9999\n\
\n\
        volumes:\n\
            - {path_to_storage}:/root/.influxdbv2\n\
\n\
        healthcheck:\n\
            test: influx setup -f -o {org} -t {token} \
-u {username} -p {password} -b {default_bucket} \
-r {retention}\n'

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


def _execute(command, success_codes=(0,)):
    """Run a shell command

    Args:
        command (str): Command to run
        success_codes (tuple, optional): Codes considered to be successful
            execution. Defaults to (0,).

    Raises:
        OSError: When the subprocess returns an error

    Returns:
        str: output of the command
    """
    try:
        # Run command in the shell and get output
        output = subprocess.check_output(command, stderr=subprocess.STDOUT, shell=True)

        # No errors, status=0
        status = 0
    except subprocess.CalledProcessError as error:
        # Error message, return code and status stored
        output = error.output or b""
        status = error.returncode
        command = error.cmd

    if status not in success_codes:
        raise OSError(
            'Command {} returned {}: "{}".'.format(
                command, status, output.decode("utf-8")
            )
        )

    return output


def stop_docker_compose(path_to_docker_compose):
    """Stops the docker_compose run

    Args:
        path_to_docker_compose (str): Path to the docker-compose file to run.

    Raises:
        ValueError: If the file does not exist
    """

    path_to_docker_compose = os.path.abspath(path_to_docker_compose)
    LOGGER.info("Searching for %s", path_to_docker_compose)

    if not os.path.isfile(path_to_docker_compose):
        raise ValueError("Path {} is not a file".format(path_to_docker_compose))

    try:
        cmd = "docker-compose --file {} down".format(path_to_docker_compose)
        _execute(cmd)

    except Exception as exc:
        LOGGER.error("Error in stop_docker_compose. Can't run docker-compose")
        raise exc


def start_docker_compose(path_to_docker_compose):
    """Starts the docker-compose run

    Args:
        path_to_docker_compose (str): Path to the docker-compose file to run.

    Raises:
        ValueError: If the file does not exist
    """

    path_to_docker_compose = os.path.abspath(path_to_docker_compose)
    LOGGER.info("Searching for %s", path_to_docker_compose)

    if not os.path.isfile(path_to_docker_compose):
        raise ValueError("Path {} is not a file".format(path_to_docker_compose))

    try:
        cmd = "docker-compose --file {} up -d".format(path_to_docker_compose)
        _execute(cmd)
        # Time to start a docker container from naught
        sleep(50)
    except Exception as exc:
        LOGGER.error("Error in start_docker_compose. Can't run docker-compose")
        raise exc


def create_docker_compose(path_to_docker_compose, path_to_storage="./influxdbv2"):
    """Creates docker_compose file based on configuration in IDB_BETA

    Args:
        path_to_docker_compose (str): Path to where the configuration is stored
        path_to_storage (str, optional): Path to where InfluxDB data is stored
            (if relative, it is w.r.t. path_to_docker_compose).
            Default is "./influxdb".
    """
    config = IDB_BETA
    config["path_to_storage"] = path_to_storage

    # Stuff to write in file
    docker_compose_script = DOCKER_COMPOSE_SKELETON.format_map(config)

    with open(path_to_docker_compose, "w") as docker_compose_file:
        docker_compose_file.write(docker_compose_script)


def find_org_id(client):
    """Finds organisation id

    Args:
        client (influxdb_client.client): Instance of influxdb_client

    Raises:
        ValueError: If there is no match (against IDB_BETA["org"])

    Returns:
        str: ID corresponding to IDB_BETA["org"]
    """
    org_client = client.organizations_api()
    for organization in org_client.find_organizations():
        if organization.name == IDB_BETA["org"]:
            org_id = organization.id

    if org_id is None:
        raise ValueError("No such organization: {}".format(IDB_BETA["org"]))

    return org_id
