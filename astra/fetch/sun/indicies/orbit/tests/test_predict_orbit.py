"""Tests for predict_orbit
"""

import os
from datetime import datetime

import astropy.units as u
import pandas as pd

import pytest
from vinvelivaanilai.orbit.predict_orbit import (
    get_orbit_from_df,
    get_position_velocity_from_omm,
    get_position_velocity_from_tle,
    get_position_velocity_multiple_from_tle,
)
from vinvelivaanilai.orbit.tle_fetch import (
    fetch_from_celestrak_csv,
    fetch_from_celestrak_txt,
)

FIXTURE_DIR = os.path.join(
    os.path.dirname(os.path.realpath(__file__)),
    "test_tle_fetch",
)

OMM_DATA = fetch_from_celestrak_csv(
    str(os.path.join(FIXTURE_DIR, "lightsail.csv"))
)

TLE_DATA = fetch_from_celestrak_txt(
    str(os.path.join(FIXTURE_DIR, "sat44420.txt")), "lightsail"
)


def test_get_orbit_from_df():
    """Test for get_orbit_from_df"""
    _ = get_orbit_from_df(OMM_DATA.reset_index().iloc[0].to_dict())


def test_get_position_velocity_from_omm():
    """Test for get_position_velocity_from_omm"""
    epoch_time = datetime(year=2020, month=6, day=27, hour=11)
    predicted_rv = get_position_velocity_from_omm(
        epoch_time, OMM_DATA.reset_index()
    )
    expected_rv = {
        "t": datetime(2020, 6, 27, 11, 0),
        "r": [6692.15417937, -191.03385587, -2300.85734606] * u.km,
        "v": [0.85382918, 7.22967398, 1.83154222] * (u.km / u.s),
    }

    assert isinstance(predicted_rv, dict)
    assert predicted_rv["t"] == expected_rv["t"]


def test_get_position_velocity_from_tle():
    """Test for get_position_velocity_from_tle"""
    epoch_time = datetime(year=2019, month=7, day=9, hour=5, minute=30)
    predicted_rv = get_position_velocity_from_tle(epoch_time, TLE_DATA.iloc[0])
    expected_rv = {
        "t": datetime(2019, 7, 9, 5, 30),
        "r": [-2562.73711494, -6326.84467679, 1944.53145904] * u.km,
        "v": [6.35491576, -3.27453701, -2.25212927] * (u.km / u.s),
    }

    assert predicted_rv["t"] == expected_rv["t"]

    for key, predicted_items in predicted_rv.items():
        if key != "t":
            for predicted_item, expected_item in zip(
                predicted_items, expected_rv[key]
            ):
                assert expected_item.value == pytest.approx(
                    predicted_item.value
                )


def test_get_position_velocity_multiple_from_tle():
    """Test for get_position_velocity_multiple_from_tle"""
    epoch_time_1 = datetime(year=2019, month=7, day=9, hour=5, minute=30)
    epoch_time_2 = datetime(year=2019, month=7, day=10, hour=5, minute=30)
    predicted_rvs = get_position_velocity_multiple_from_tle(
        [epoch_time_1, epoch_time_2], TLE_DATA
    )
    assert isinstance(predicted_rvs, pd.DataFrame)
    assert isinstance(predicted_rvs.index, pd.DatetimeIndex)
