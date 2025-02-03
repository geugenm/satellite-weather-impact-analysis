import argparse
from pathlib import Path

import mlflow
import pandas as pd
from mlflow.data.pandas_dataset import PandasDataset

from astra.graph import create_dependency_graph
from astra.model.analysis import cross_correlate

ARTIFACTS_DIR = Path("../artifacts")
TRACKING_URI = ARTIFACTS_DIR / "mlruns"
DOWNLOAD_DIR = Path("../downloads")
SATELLITES_DIR = DOWNLOAD_DIR / "sat"
SOLAR_DIR = DOWNLOAD_DIR / "sun"
MODEL_CFG_PATH = Path("../cfg/model.yaml")
TIME_COLUMN = "Time"
OUTPUT_GRAPH_SUFFIX = "_graph.yaml"


def get_columns_and_sources(path: Path) -> dict[str, str]:
    return {
        col.translate(str.maketrans({c: "_" for c in " ,<>[]()#+"})): file.name
        for file in path.glob("*.csv")
        for col in pd.read_csv(file, usecols=lambda x: True).columns
    }


def read_csv_files(path: Path, time_column: str = TIME_COLUMN) -> pd.DataFrame:
    dataframes = [pd.read_csv(file) for file in Path(path).glob("*.csv")]
    combined_df = pd.concat(dataframes, ignore_index=True)
    combined_df[time_column] = pd.to_datetime(
        combined_df[time_column]
    ).dt.normalize()
    return (
        combined_df.select_dtypes(include=["number", "bool", "datetime"])
        .rename(
            columns=lambda col: col.translate(
                str.maketrans({c: "_" for c in " ,<>[]()#+"})
            )
        )
        .groupby(time_column)
        .mean()
    )


def parse_solar_data(solar_dir: Path) -> list[pd.DataFrame]:
    return [
        pd.read_csv(file, parse_dates=["time"]).rename(
            columns={"time": TIME_COLUMN}
        )
        for file in solar_dir.glob("*.csv")
    ]


def merge_dataframes(
    initial_frame: pd.DataFrame, dataframes_to_merge: list[pd.DataFrame]
) -> pd.DataFrame:
    for df in dataframes_to_merge:
        initial_frame = initial_frame.merge(df, how="left", on=TIME_COLUMN)
    return initial_frame


def process_satellite_data(satellite_name: str) -> None:
    mlflow.set_tracking_uri(TRACKING_URI)
    mlflow.enable_system_metrics_logging()

    mlflow.set_experiment(satellite_name)
    artifacts_dir = (ARTIFACTS_DIR / satellite_name).absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.start_run(run_name="build_graph")

    satellite_data = read_csv_files(SATELLITES_DIR / satellite_name)
    solar_dataframes = parse_solar_data(SOLAR_DIR)
    filtered_solar_data = merge_dataframes(
        solar_dataframes[0], solar_dataframes[1:]
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
    parser.add_argument(
        "satellite_name", type=str, help="Name of the satellite"
    )
    args = parser.parse_args()
    process_satellite_data(args.satellite_name)
