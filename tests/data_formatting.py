from pathlib import Path
import pandas as pd

from astra.fetch.format import DataFrameParser


def test_data_format() -> None:
    file = (
        Path(__file__).parent
        / "data/Voltages-data-as-seriestocolumns-2025-04-06 15_32_48.csv"
    )
    df = pd.read_csv(file)

    parser = DataFrameParser()
    df = parser.sanitize_columns(df)
    df = parser.parse_units(df)

    df = df.select_dtypes(include=["number", "bool", "datetime"])

    assert (
        "time" in df.columns
    ), f"'time' column missing. Columns: {df.columns.tolist()}"
    assert pd.api.types.is_datetime64_any_dtype(
        df["time"]
    ), f"'time' column is not datetime type. Dtype: {df['time'].dtype}"

    assert not df.empty, "Filtered DataFrame is empty"
