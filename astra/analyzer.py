import argparse
from pathlib import Path
import logging

import mlflow
import pandas as pd
from mlflow.data.pandas_dataset import PandasDataset
import hashlib

from astra.graph import create_dependency_graph
from astra.model.analysis import cross_correlate

ARTIFACTS_DIR = Path("../artifacts")
TRACKING_URI = ARTIFACTS_DIR / "mlruns"
DOWNLOAD_DIR = Path("../downloads")
SATELLITES_DIR = DOWNLOAD_DIR / "sat"
SOLAR_DIR = DOWNLOAD_DIR / "sun"
MODEL_CFG_PATH = Path("../cfg/model.yaml")
TIME_COLUMN = "time"


logging.basicConfig(level=logging.INFO)


def merge_dataframes(file_db: dict) -> pd.DataFrame:
    """
    Merge multiple DataFrames on 'time' column with mean value aggregation.

    Args:
        file_db: Dictionary from build_file_database containing parsed data

    Returns:
        Merged DataFrame with aligned time index and averaged values
    """
    merged_df = pd.DataFrame()

    for _, entry in file_db.items():
        df = entry["dataframe"]

        if merged_df.empty:
            merged_df = df
        else:
            merged_df = merged_df.merge(df, on="time")

    return merged_df


def custom_parse(file_path: Path) -> pd.DataFrame:
    df = pd.read_csv(file_path)

    df = df.rename(columns=lambda col: "time" if col.lower() == "time" else col)
    df["time"] = pd.to_datetime(df["time"]).dt.normalize()

    return df.select_dtypes(include=["number", "bool", "datetime"]).rename(
        columns=lambda col: col.translate(
            str.maketrans({c: "_" for c in " ,<>[]()#+"})
        )
    )


def build_file_database(file_list: list[Path]) -> dict:
    file_db = {}

    for file_path in file_list:
        path = file_path

        if path.is_file():
            file_hash = hashlib.md5(path.read_bytes()).hexdigest()

            try:
                df = custom_parse(path)

                file_db[path.name] = {
                    "hash": file_hash,
                    "dataframe": df,
                    "path": path.resolve().as_posix(),
                }
            except Exception as e:
                logging.exception(e)

    return file_db


def get_csv_files(
    root_dir: str | Path,
    *,
    recursive: bool = False,
    case_insensitive: bool = False,
) -> list[Path]:
    """
    Collect CSV files with Python 3.13's pathlib optimizations.

    Args:
        root_dir: Starting directory for search
        recursive: Include subdirectories when True
        case_insensitive: Match filename case insensitively

    Returns:
        List of Path objects for matched CSV files
    """
    base_path = Path(root_dir)
    pattern = "**/*.csv" if recursive else "*.csv"

    return [
        p.resolve()
        for p in base_path.glob(pattern, case_sensitive=not case_insensitive)
        if p.is_file()
    ]


def get_column_file_map(file_db: dict) -> dict[str, str]:
    """Create bidirectional column↔filename mapping from file database.

    Args:
        file_db: Output from build_file_database()

    Returns:
        Dictionary with column names as keys and source filenames as values
    """
    return {
        column: filename
        for filename, entry in file_db.items()
        for column in entry["dataframe"].columns
    }


def process_satellite_data(satellite_name: str) -> None:
    mlflow.set_tracking_uri(TRACKING_URI)
    mlflow.enable_system_metrics_logging()

    mlflow.set_experiment(satellite_name)
    artifacts_dir = (ARTIFACTS_DIR / satellite_name).absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.start_run(run_name="build_graph")

    satellite_files = get_csv_files(SATELLITES_DIR / satellite_name)
    solar_files = get_csv_files(SOLAR_DIR)

    dataset_files = satellite_files + solar_files
    dataset_files_db = build_file_database(dataset_files)

    dynamics = merge_dataframes(dataset_files_db).dropna()

    assert "time" in dynamics.columns

    dynamics_file = artifacts_dir / f"{satellite_name}.csv"

    mlflow.log_input(
        mlflow.data.from_pandas(
            dynamics,
            name="Merged satellite and solar parameters",
        )
    )
    dynamics.to_csv(dynamics_file, index=False)
    mlflow.log_artifact(str(dynamics_file), artifact_path="graph")

    graph_file = artifacts_dir / f"{satellite_name}_graph.yaml"
    cross_correlate(
        input_dataframe=dynamics,
        output_graph_file=graph_file,
        index_column=TIME_COLUMN,
        xcorr_configuration_file=MODEL_CFG_PATH,
    )

    mlflow.log_artifact(str(graph_file), artifact_path="graph")

    graph = create_dependency_graph(
        graph_file,
        get_column_file_map(dataset_files_db),
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
