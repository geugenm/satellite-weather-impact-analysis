"""Tests for retrieve
"""

import os
from datetime import datetime, timedelta

import numpy as np
import pandas as pd

import pytest
from vinvelivaanilai.storage.common import set_datetime_index
from vinvelivaanilai.storage.retrieve import (
    fetch_from_json,
    get_nearest_from_df,
)
from vinvelivaanilai.storage.store import dump_to_json

np.random.seed(42)


def test_set_datetime_index():
    """Tests for set_datetime index"""
    dates = pd.date_range(start="2020-05-04", periods=5)
    data = np.random.randn(len(dates))
    col_names = ["Date1", "Date2", "Date3"]

    # The method is present, but pylint is unable to detect
    # pylint: disable=no-member
    dates1 = dates.strftime("%Y-%m-%dT%H:%M:%SZ")
    dates2 = (dates - pd.Timestamp("1970-01-01")) // pd.Timedelta("1s")
    dates3 = dates.strftime("%Y-%m-%dT%H:%M:%S")

    test_df = pd.DataFrame(
        data=np.array([data, dates1, dates2, dates3]).T,
        columns=["Data"] + col_names,
    )

    for column in col_names:
        # Test if all three formats are working fine
        assert set_datetime_index(test_df, column).index.equals(dates)

    with pytest.raises(ValueError):
        _ = set_datetime_index(test_df, "DoesNotExist")


@pytest.mark.datafiles()
def test_json(datafiles):
    """Tests for get_nearest from df"""
    dataframe = fetch_from_json(
        os.path.join(
            os.path.dirname(os.path.realpath(__file__)), "tle_lightsail2.json"
        ),
        index_name="EPOCH",
    )
    assert isinstance(dataframe.index, pd.DatetimeIndex)

    dump_to_json(dataframe, str(datafiles / "dumped_data.json"))


def test_get_nearest_from_df():
    """Tests for get_nearest from df"""
    base_time = datetime(year=2020, month=5, day=4)
    dates = pd.date_range(start=base_time, periods=20)
    data = np.random.randn(len(dates))

    dataframe = pd.DataFrame(data=data, columns=["Data"], index=dates)

    times = [
        base_time,
        base_time + timedelta(days=3, hours=12, minutes=15, seconds=57),
        base_time - timedelta(days=1, hours=21, minutes=32),
        base_time + timedelta(days=19),
        base_time + timedelta(days=22, hours=7),
    ]

    expected_times = [
        base_time,
        base_time + timedelta(days=4),
        base_time,
        base_time + timedelta(days=19),
        base_time + timedelta(days=19),
    ]

    for expected_time, time in zip(expected_times, times):
        assert (
            get_nearest_from_df(time, dataframe)
            == dataframe.loc[expected_time].to_dict()
        )
