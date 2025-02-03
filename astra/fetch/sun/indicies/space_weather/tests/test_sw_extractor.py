"""Tests for extractor"""

import os

from pathlib import Path

import pytest
from indicies.space_weather.sw_extractor import (
    NoSpaceWeatherForIndex,
    extract_data_from_multiple,
    extract_data_regex,
)

FIXTURE_DIR = Path(
    os.path.join(
        os.path.dirname(os.path.realpath(__file__)),
        "test_sw_extractor",
    )
)


def test_dgd_to_dataframe():
    """Test for dgd"""
    path_to_data_file = str(FIXTURE_DIR / "2019_DGD.txt")
    dgd_df = extract_data_regex("dgd", path_to_data_file)

    assert dgd_df.shape[0] == 365


def test_new_dgd_to_dataframe():
    """Test for dgd"""
    path_to_data_file = str(FIXTURE_DIR / "2024Q4_DGD.txt")
    dgd_df = extract_data_regex("dgd", path_to_data_file)

    assert dgd_df.shape[0] == 92  # 4th quater


def test_dsd_to_dataframe():
    """Test for dsd"""
    path_to_data_file = str(FIXTURE_DIR / "2019_DSD.txt")
    dsd_df = extract_data_regex("dSd", path_to_data_file)

    assert dsd_df.shape[0] == 365


def test_dpd_to_dataframe():
    """Test for dpd"""
    path_to_data_file = str(FIXTURE_DIR / "2019_DPD.txt")
    dpd_df = extract_data_regex("dpD ", path_to_data_file)

    assert dpd_df.shape[0] == 365


def test_extract_data_regex_sad():
    """Test sad cases for extract_data_regex"""
    path_to_data_file = str(FIXTURE_DIR / "2019_DPD.txt")

    with pytest.raises(ValueError):
        _ = extract_data_regex("dsd ", path_to_data_file)

    with pytest.raises(ValueError):
        _ = extract_data_regex("no_support", path_to_data_file)


def test_no_data_to_concatenate():
    """Test sad cases for NoSpaceWeatherForIndex"""

    with pytest.raises(NoSpaceWeatherForIndex):
        _ = extract_data_from_multiple("DPD", [])
