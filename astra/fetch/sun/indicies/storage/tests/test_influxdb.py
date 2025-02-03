"""Tests for influxdb
"""
# pylint: disable=redefined-outer-name
# https://stackoverflow.com/a/54045715/8890157

from datetime import datetime, timedelta

import influxdb_client
import numpy as np
import pandas as pd

import pytest
from vinvelivaanilai.storage.common import (
    IDB_BETA,
    create_docker_compose,
    start_docker_compose,
    stop_docker_compose,
)
from vinvelivaanilai.storage.retrieve import (
    fetch_from_influxdb,
    fetch_nearest_from_influxdb,
)
from vinvelivaanilai.storage.store import (
    delete_existing_bucket,
    dump_to_influxdb,
)


@pytest.fixture
@pytest.mark.datafiles()
def start_and_cleanup(datafiles):
    """Fixture to start and stop the docker container"""
    path_to_docker_compose = str(datafiles / "docker-compose.yml")
    create_docker_compose(
        path_to_docker_compose, "/tmp/pytest-vinvelivaanilai"
    )
    start_docker_compose(path_to_docker_compose)

    yield

    stop_docker_compose(path_to_docker_compose)


@pytest.mark.usefixtures("start_and_cleanup")
def test_influxdb_workflow():
    """Test for dump_to_influxdb, fetch_from_influxdb,
    delete_existing_bucket
    """
    bucket_name = "pytest_sample_instance"
    measurement_name = "sample_values"

    np.random.seed(0)

    date_range = pd.date_range("2020-02-24", periods=5)
    sample_df = pd.DataFrame(
        {"Date": date_range, "Val": np.random.randn(len(date_range))}
    )

    sample_df.set_index("Date", inplace=True)

    # Check if it can create a bucket and store
    dump_to_influxdb(sample_df, measurement_name, bucket_name)
    # To check if it can store to an already existing bucket
    dump_to_influxdb(sample_df, measurement_name, bucket_name)

    # The method is present, but pylint is unable to detect
    # pylint: disable=no-member
    date_range_arr = date_range.to_pydatetime()

    fetched_df = fetch_from_influxdb(
        start_time=date_range_arr[0],
        end_time=datetime.now(),
        measurement_name=measurement_name,
        bucket_name=bucket_name,
        rename_to="Date",
    )

    _ = fetch_from_influxdb(
        start_time=datetime.now(),
        end_time=datetime.now() + timedelta(days=1),
        measurement_name=measurement_name,
        bucket_name=bucket_name,
        rename_to="Date",
    )

    assert fetched_df.sort_index().equals(sample_df.sort_index())

    _ = fetch_nearest_from_influxdb(
        datetime.now() - timedelta(hours=1),
        measurement_name,
        bucket_name,
        "Date",
    )

    client = influxdb_client.InfluxDBClient(
        url=IDB_BETA["host"],
        token=IDB_BETA["token"],
        org=IDB_BETA["org"],
        debug=False,
    )
    # Delete an existing bucket
    delete_existing_bucket(client, bucket_name)
    # Delete a non existing bucket
    delete_existing_bucket(client, "did_not_exist_ever")
    client.close()


def test_docker_compose_sad():
    """Test sad cases for start and stop docker_compose"""
    with pytest.raises(ValueError):
        start_docker_compose("/does/not/exist.yml")

    with pytest.raises(ValueError):
        stop_docker_compose("/does/not/exist.yml")
