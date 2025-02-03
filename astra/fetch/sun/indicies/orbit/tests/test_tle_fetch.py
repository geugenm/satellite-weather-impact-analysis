"""Tests for tle_fetch
"""

import os

import pandas as pd

import pytest
from vinvelivaanilai.orbit.tle_fetch import (
    NoDataError,
    convert_tle_to_format,
    fetch_from_celestrak_csv,
    fetch_from_celestrak_txt,
    fetch_latest_omm_from_celestrak,
    fetch_latest_tle_from_celestrak,
    fetch_multiple_satellites_tle_from_celestrak,
    short_to_long_year,
)

FIXTURE_DIR = os.path.join(
    os.path.dirname(os.path.realpath(__file__)),
    "test_tle_fetch",
)


def test_short_to_long_year():
    """Tests for short_to_long_year"""
    year1 = short_to_long_year(20)
    year2 = short_to_long_year(71)
    year3 = short_to_long_year(57)
    assert year1 == 2020
    assert year2 == 1971
    assert year3 == 1957

    with pytest.raises(TypeError):
        _ = short_to_long_year(1.2)

    with pytest.raises(ValueError):
        _ = short_to_long_year(-1)


def test_convert_tle_to_format():
    """Tests for convert_tle_to_format"""
    tle = [
        "1 44420U 19036AC  19189.19929602 .00000238  00000-0  66072-5 0  9998",
        "2 44420  24.0039 123.5944 0010951 339.2037 161.8097 14.52524232   18",
    ]

    tle_dict = convert_tle_to_format(tle, "LightSail2")

    assert tle_dict["NORAD_CAT_ID"] == 44420
    assert tle_dict["TLE_LINE0"] == "0 LightSail2"
    assert tle_dict["TLE_LINE1"] == tle[0]
    assert tle_dict["TLE_LINE2"] == tle[1]


@pytest.mark.datafiles()
def test_fetch_latest_omm_from_celestrak(datafiles):
    """Tests for fetch_latest_omm_from_celestrak"""
    tles = fetch_latest_omm_from_celestrak(
        str(datafiles / "cubesats.csv"), "cubesat", "w"
    )
    assert isinstance(tles, pd.DataFrame)
    assert isinstance(tles.index, pd.DatetimeIndex)

    with pytest.raises(NoDataError):
        _ = fetch_latest_omm_from_celestrak(
            str(datafiles / "nope.csv"), "abcd", "w"
        )


@pytest.mark.datafiles(os.path.join(FIXTURE_DIR, "sat44420.txt"))
def test_fetch_from_celestrak_txt(datafiles):
    """Tests for fetch_from_celestrak_txt"""
    tles = fetch_from_celestrak_txt(str(datafiles.listdir()[0]), "LightSail2")

    assert isinstance(tles, pd.DataFrame)
    assert isinstance(tles.index, pd.DatetimeIndex)


def test_fetch_latest_tle_from_celestrak():
    """Tests for fetch_latest_tle_from_celestrak"""
    tle = fetch_latest_tle_from_celestrak(44420)
    assert tle["NORAD_CAT_ID"] == 44420

    with pytest.raises(TypeError):
        _ = fetch_latest_tle_from_celestrak("abcd")


def test_fetch_multiple_satellites_tle_from_celestrak():
    """Tests for fetch_multiple_satellites_tle_from_celestrak"""
    tle = fetch_multiple_satellites_tle_from_celestrak([44420, 44369])
    for key in tle:
        assert key in (44420, 44369)

    with pytest.raises(TypeError):
        _ = fetch_multiple_satellites_tle_from_celestrak("abcd")

    with pytest.raises(TypeError):
        _ = fetch_multiple_satellites_tle_from_celestrak([44420, "abcd"])


@pytest.mark.datafiles(os.path.join(FIXTURE_DIR, "lightsail.csv"))
def test_fetch_from_celestrak_csv(datafiles):
    """Test for fetch_from_celestrak_csv"""
    tles = fetch_from_celestrak_csv(datafiles.listdir()[0])
    assert isinstance(tles, pd.DataFrame)
    assert isinstance(tles.index, pd.DatetimeIndex)
