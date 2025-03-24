import pytest
import polars as pl
import pandas as pd
from dataclasses import dataclass
from astra.analyze import process_time_series


@dataclass
class DataFormat:
    time_column: str


@dataclass
class DataConfig:
    format: DataFormat


class TestProcessTimeSeries:
    @pytest.fixture
    def sample_data(self) -> pl.DataFrame:
        """Create sample time series data for testing."""
        data = {
            "timestamp": [
                "2023-01-01",
                "2023-01-02",
                "2023-01-03",
                "2023-01-04",
                "2023-01-05",
            ],
            "value1": [1.0, 2.0, None, 4.0, 5.0],
            "value2": [10.0, None, 30.0, 40.0, 50.0],
            "category": ["A", "B", "A", "B", "A"],
            "const": [12.0, 12.0, 12.0, 12.0, 12.0],
        }
        return pl.DataFrame(data)

    @pytest.fixture
    def config(self) -> DataConfig:
        return DataConfig(format=DataFormat(time_column="timestamp"))

    def test_basic_processing(self, sample_data, config):
        result = process_time_series(sample_data, config)

        assert isinstance(
            result, pd.DataFrame
        ), "Result should be a pandas DataFrame"

        assert (
            config.format.time_column in result.columns
        ), "Time column should be preserved in result"

    def test_exclude_columns(self, sample_data, config):
        exclude = ["category"]
        result = process_time_series(
            sample_data, config, exclude_columns=exclude
        )

        for col in exclude:
            assert (
                col not in result.columns
            ), f"Excluded column '{col}' should not be present in result"

    def test_null_handling(self, sample_data, config):
        result = process_time_series(sample_data, config)

        assert (
            not result.isnull().values.any()
        ), f"Result should not preserve null values from input data {result}"

    def test_time_column_sorting(self, sample_data, config):
        unsorted_data = sample_data.sample(fraction=1.0, seed=42)
        result = process_time_series(unsorted_data, config)

        timestamps = result[config.format.time_column].values
        assert all(
            timestamps[i] <= timestamps[i + 1]
            for i in range(len(timestamps) - 1)
        ), "Timestamps should be sorted in ascending order"

    def test_constant_columns_dropped(self, sample_data, config):
        assert (
            sample_data["const"].n_unique() == 1
        ), "Test setup error: 'const' column should have only one unique value"

        result = process_time_series(sample_data, config)

        assert (
            "const" not in result.columns
        ), "Constant columns should be dropped from the result"

        assert (
            "value1" in result.columns
        ), "Non-constant numeric columns should be preserved"
        assert (
            "value2" in result.columns
        ), "Non-constant numeric columns should be preserved"

    def test_groupby_functionality(self, config):
        data = {
            "timestamp": [
                "2023-01-01",
                "2023-01-01",
                "2023-01-02",
                "2023-01-02",
            ],
            "value1": [1.0, 3.0, 2.0, 4.0],
            "value2": [10.0, 30.0, 20.0, 40.0],
        }
        df = pl.DataFrame(data)

        result = process_time_series(df, config)

        # Check if duplicate timestamps are aggregated (should have 2 rows, not 4)
        assert (
            len(result) == 2
        ), "Duplicate timestamps should be aggregated, resulting in 2 rows"

        # First timestamp should have mean of [1.0, 3.0] and [10.0, 30.0]
        first_date = pd.to_datetime("2023-01-01")
        first_row = result[result[config.format.time_column] == first_date]

        # Since values are normalized, we can't check exact values
        # But we can verify the row exists
        assert (
            len(first_row) == 1
        ), "There should be exactly one row for the first timestamp"
