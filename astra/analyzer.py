import argparse
from pathlib import Path

import mlflow
import pandas as pd
from mlflow.data.pandas_dataset import PandasDataset

from src.graph import create_dependency_graph
from src.polaris.learn.analysis import cross_correlate

ARTIFACTS_DIR = Path("../artifacts")
TRACKING_URI = ARTIFACTS_DIR / "mlruns"
DOWNLOAD_DIR = Path("../downloads")
SATELLITES_DIR = DOWNLOAD_DIR / "sat"
SOLAR_DIR = DOWNLOAD_DIR / "sun"
MODEL_CFG_PATH = Path("../cfg/model.json")
TIME_COLUMN = "Time"
OBS_DATE_COLUMN = "Obsdate"
OUTPUT_GRAPH_SUFFIX = "_graph.json"

mlflow.set_tracking_uri(TRACKING_URI)
mlflow.enable_system_metrics_logging()


def clean_column_names(columns: list[str]) -> list[str]:
    return [
        col.translate(
            str.maketrans(
                {
                    " ": "_",
                    ",": "_",
                    "<": "_",
                    ">": "_",
                    "[": "_",
                    "]": "_",
                    "(": "_",
                    ")": "_",
                    "+": "_",
                    "#": "_",
                }
            )
        )
        for col in columns
    ]


def get_columns_and_sources(path: Path) -> dict[str, str]:
    columns_to_source_map = {}
    for file_path in Path(path).glob("*.csv"):
        df = pd.read_csv(file_path)
        df.columns = clean_column_names(df.columns)
        for column_name in df.columns:
            columns_to_source_map.setdefault(column_name, file_path.name)
    return columns_to_source_map


def read_csv_files(path: Path, time_column: str = TIME_COLUMN) -> pd.DataFrame:
    dataframes = [pd.read_csv(file) for file in Path(path).glob("*.csv")]
    combined_df = pd.concat(dataframes, ignore_index=True)
    combined_df[time_column] = pd.to_datetime(combined_df[time_column]).dt.normalize()
    combined_df = combined_df.select_dtypes(include=["number", "bool", "datetime"])
    combined_df.columns = clean_column_names(combined_df.columns)
    return combined_df.groupby(time_column).mean()


def read_solar_data(file_path: Path, date_column: str) -> pd.DataFrame:
    df = pd.read_json(file_path)
    df[date_column] = pd.to_datetime(df[date_column])
    return df


def parse_solar_data(solar_dir: Path) -> list[pd.DataFrame]:
    return [
        read_solar_data(solar_dir / "swpc_observed_ssn.json", OBS_DATE_COLUMN).rename(
            columns={OBS_DATE_COLUMN: TIME_COLUMN}
        ),
        pd.read_csv(solar_dir / "dgd.csv", parse_dates=["Date"]).rename(
            columns={"Date": TIME_COLUMN}
        ),
        pd.read_csv(
            solar_dir / "fluxtable.txt", sep="\s+", parse_dates=["fluxdate"]
        ).rename(columns={"fluxdate": TIME_COLUMN}),
        pd.read_csv(
            solar_dir / "daily_total_sunspot_number.csv", parse_dates=[TIME_COLUMN]
        ),
        pd.read_csv(
            solar_dir / "daily_hemispheric_sunspot_number.csv",
            parse_dates=[TIME_COLUMN],
        ),
    ]


def merge_dataframes(
    initial_frame: pd.DataFrame, dataframes_to_merge: list[pd.DataFrame]
) -> pd.DataFrame:
    for df in dataframes_to_merge:
        initial_frame = initial_frame.merge(df, how="left", on=TIME_COLUMN)
    return initial_frame


def process_satellite_data(satellite_name: str) -> None:
    mlflow.set_experiment(f"{satellite_name}")
    artifacts_dir = (ARTIFACTS_DIR / satellite_name).absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.start_run(run_name="build_graph")

    satellite_data = read_csv_files(SATELLITES_DIR / satellite_name)
    solar_dataframes = parse_solar_data(SOLAR_DIR)
    filtered_solar_data = merge_dataframes(
        solar_dataframes[0], solar_dataframes[1:]
    ).filter(
        items=[
            TIME_COLUMN,
            "fluxcarrington",
            "swpc_ssn",
            "Frederickburg K 0-3",
            "SNvalue",
            "SNvalue_tot",
        ]
    )
    dynamics = merge_dataframes(satellite_data, [filtered_solar_data])
    dynamics_file = artifacts_dir / f"{satellite_name}.csv"

    mlflow.log_input(
        mlflow.data.from_pandas(
            dynamics,
            name="Merged satellite and solar parameters",
        )
    )
    dynamics.to_csv(dynamics_file, index=False)
    mlflow.log_artifact(str(dynamics_file), artifact_path="graph")

    graph_file = artifacts_dir / f"{satellite_name}{OUTPUT_GRAPH_SUFFIX}"
    cross_correlate(
        input_dataframe=dynamics,
        output_graph_file=str(graph_file),
        index_column=TIME_COLUMN,
        xcorr_configuration_file=str(MODEL_CFG_PATH),
        dropna=True,
    )

    mlflow.log_artifact(str(graph_file), artifact_path="graph")

    graph = create_dependency_graph(
        graph_file,
        get_columns_and_sources(SATELLITES_DIR / satellite_name),
    )
    output_path = str(artifacts_dir / "graph.html")
    graph.render(output_path)
    print(f"Graph rendered successfully at {output_path}")

    mlflow.log_artifact(output_path, artifact_path="graph")
    mlflow.end_run()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process satellite data.")
    parser.add_argument("satellite_name", type=str, help="Name of the satellite")
    args = parser.parse_args()
    process_satellite_data(args.satellite_name)
