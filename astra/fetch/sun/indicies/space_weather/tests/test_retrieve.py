"""Tests for retrieve"""

import os
from datetime import datetime, timedelta

import numpy as np
import pandas as pd

import pytest
from indicies.space_weather.sw_extractor import set_datetime_index


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
    dates3 = dates.strftime("%Y-%m-%dT%H:%M:%S%z").str.replace("+0000", "Z")

    test_df = pd.DataFrame(
        data=np.array([data, dates1, dates2, dates3]).T,
        columns=["Data"] + col_names,
    )

    for column in col_names:
        # Test if all three formats are working fine
        print(set_datetime_index(test_df, column).index)
        print("vs")
        print(dates)
        assert set_datetime_index(test_df, column).index.equals(dates)

    with pytest.raises(ValueError):
        _ = set_datetime_index(test_df, "DoesNotExist")
