import argparse
from pathlib import Path
import logging

import yaml
import mlflow
import pandas as pd

from mlflow.data.pandas_dataset import PandasDataset
from sklearn.preprocessing import MinMaxScaler, StandardScaler

from astra.graph import create_dependency_graph
from astra.model.cross_correlate import cross_correlate

ARTIFACTS_DIR = Path("../artifacts")
TRACKING_URI = ARTIFACTS_DIR / "mlruns"
DOWNLOAD_DIR = Path("../downloads")
MODEL_CFG_PATH = Path("../cfg/model.yaml")
TIME_COLUMN = "time"


logging.basicConfig(level=logging.INFO)


def save_to_yaml(graph_data: dict, path: str | Path) -> None:
    """Atomic write of graph data with YAML safety"""
    Path(path).write_text(
        yaml.safe_dump(
            graph_data,
            sort_keys=False,
            default_flow_style=None,
            allow_unicode=True,
            width=80,
        )
    )


def advanced_interpolation(df: pd.DataFrame) -> pd.DataFrame:
    """Interpolate missing values using multiple methods, handling duplicates."""
    # Ensure time column is datetime
    df["time"] = pd.to_datetime(df["time"])

    # Remove duplicate timestamps by averaging values
    df = df.groupby("time", as_index=False).mean()

    # Set time as index for interpolation
    df = df.set_index("time")

    # Apply simpler interpolation methods that handle duplicates
    df = (
        df.interpolate(method="time")  # Time-based interpolation
        .ffill()  # Forward fill remaining gaps
        .bfill()
    )  # Backward fill edge cases

    return df.reset_index()


def process_satellite_data(satellite_name: str) -> None:
    mlflow.set_tracking_uri(TRACKING_URI)
    mlflow.enable_system_metrics_logging()

    mlflow.set_experiment(satellite_name)
    artifacts_dir = (ARTIFACTS_DIR / satellite_name).absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.start_run(run_name="build_graph")

    dynamics = pd.read_csv(DOWNLOAD_DIR / f"{satellite_name}.csv").drop(
        ["cumulative_sum", "uptime_total", "58261.mode"], axis=1
    )

    dynamics = advanced_interpolation(dynamics)

    numeric_cols = dynamics.select_dtypes(include=["float64", "int64"]).columns
    df_numeric = dynamics[numeric_cols]

    scaler = StandardScaler()
    df_normalized = pd.DataFrame(
        scaler.fit_transform(df_numeric),
        columns=numeric_cols,
        index=dynamics.index,
    )

    # Add back time column
    df_normalized["time"] = dynamics["time"]
    dynamics = df_normalized

    print(dynamics.info())

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
    graph_data = cross_correlate(
        input_dataframe=dynamics,
        index_column=TIME_COLUMN,
        xcorr_configuration_file=MODEL_CFG_PATH,
    )

    save_to_yaml(graph_data, graph_file)

    mlflow.log_artifact(str(graph_file), artifact_path="graph")

    graph = create_dependency_graph(
        graph_file,
        {},
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
