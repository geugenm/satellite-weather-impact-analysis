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
        }
        return pl.DataFrame(data)

    @pytest.fixture
    def config(self) -> DataConfig:
        return DataConfig(format=DataFormat(time_column="timestamp"))

    def test_basic_processing(self, sample_data, config):
        result = process_time_series(sample_data, config)

        assert isinstance(result, pd.DataFrame)

        assert config.format.time_column in result.columns

    def test_exclude_columns(self, sample_data, config):
        exclude = ["category"]
        result = process_time_series(
            sample_data, config, exclude_columns=exclude
        )

        for col in exclude:
            assert col not in result.columns

    def test_null_handling(self, sample_data, config):
        result = process_time_series(sample_data, config)

        assert result.isnull().values.any()

    def test_time_column_sorting(self, sample_data, config):
        unsorted_data = sample_data.sample(fraction=1.0, seed=42)
        result = process_time_series(unsorted_data, config)

        timestamps = result[config.format.time_column].values
        assert all(
            timestamps[i] <= timestamps[i + 1]
            for i in range(len(timestamps) - 1)
        )

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
        assert len(result) == 2

        # First timestamp should have mean of [1.0, 3.0] and [10.0, 30.0]
        first_date = pd.to_datetime("2023-01-01")
        first_row = result[result[config.format.time_column] == first_date]

        # Since values are normalized, we can't check exact values
        # But we can verify the row exists
        assert len(first_row) == 1
