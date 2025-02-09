"""Tests for extractor"""

import os

from pathlib import Path
import pandas as pd


import pytest
from astra.fetch.sun.solar_indices import (
    NoSpaceWeatherForIndex,
    extract_data_from_multiple,
    extract_data_regex,
    set_datetime_index,
)


FIXTURE_DIR = Path(
    os.path.join(
        os.path.dirname(os.path.realpath(__file__)),
        "sources",
    )
)


def test_set_datetime_index_string_dates():
    """Test conversion of string dates to datetime index"""
    df = pd.DataFrame(
        {
            "EPOCH": ["2023-01-01", "2023-02-01", "2023-03-01"],
            "Value": [1, 2, 3],
        }
    )

    result = set_datetime_index(df)

    assert isinstance(result.index, pd.DatetimeIndex)
    expected_dates = pd.DatetimeIndex(
        [
            pd.Timestamp("2023-01-01"),
            pd.Timestamp("2023-02-01"),
            pd.Timestamp("2023-03-01"),
        ]
    )
    result.index.name = None
    pd.testing.assert_index_equal(result.index, expected_dates)


def test_set_datetime_index_error_handling():
    """Test error conditions"""
    df = pd.DataFrame({"data": [1, 2, 3]})

    with pytest.raises(ValueError) as excinfo:
        set_datetime_index(df, "missing_col")
    assert "Column missing_col does not exist" in str(excinfo.value)


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


def test_extract_data_regex_sad():
    """Test sad cases for extract_data_regex"""
    path_to_data_file = str(FIXTURE_DIR / "2019_DGD.txt")

    with pytest.raises(ValueError):
        _ = extract_data_regex("dsd ", path_to_data_file)

    with pytest.raises(ValueError):
        _ = extract_data_regex("no_support", path_to_data_file)


def test_process_and_save_txt_files() -> None:
    """Process all txt files in directory and save merged results to csv"""
    output_filename: str = "merged_data.csv"
    dfs = []
    directory = FIXTURE_DIR

    for file in directory.glob("*.txt"):
        index = file.stem[-3:]
        df = extract_data_regex(index, str(file))
        if isinstance(df, pd.DataFrame) and not df.empty:
            dfs.append(df)

    if not dfs:
        raise ValueError("no valid dataframes extracted from txt files")

    merged_df = pd.concat(dfs)
    merged_df.rename(columns={"Date": "time"}, inplace=True)
    merged_df.to_csv(directory / output_filename)
