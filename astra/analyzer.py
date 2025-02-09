from __future__ import annotations
from dataclasses import dataclass
from pathlib import Path
from typing import Final, TypeAlias
import argparse
import logging

import pandas as pd
import yaml
import mlflow
from sklearn.preprocessing import StandardScaler

from astra.graph import create_dependency_graph
from astra.model.cross_correlate import cross_correlate

PathLike: TypeAlias = str | Path


@dataclass(frozen=True)
class Config:
    ARTIFACTS_DIR: Final[Path] = Path("../artifacts")
    TRACKING_URI: Final[Path] = ARTIFACTS_DIR / "mlruns"
    DOWNLOAD_DIR: Final[Path] = Path("../downloads")
    MODEL_CFG_PATH: Final[Path] = Path("../cfg/model.yaml")
    TIME_COLUMN: Final[str] = "time"
    COLUMNS_TO_DROP: Final[tuple[str, ...]] = ()


def setup_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )


def save_to_yaml(data: dict, path: PathLike) -> None:
    """Atomically write data to YAML file with safety guarantees."""
    Path(path).write_text(
        yaml.safe_dump(data, sort_keys=False, allow_unicode=True, width=80)
    )


def interpolate_timeseries(df: pd.DataFrame) -> pd.DataFrame:
    """Handle missing values in time series data using multiple interpolation methods."""
    return (
        df.assign(time=lambda x: pd.to_datetime(x[Config.TIME_COLUMN]))
        .groupby(Config.TIME_COLUMN, as_index=False)
        .mean()
        .set_index(Config.TIME_COLUMN)
        .pipe(lambda x: x.interpolate(method="time").ffill().bfill())
        .reset_index()
    )


def normalize_numeric_columns(df: pd.DataFrame) -> pd.DataFrame:
    """Normalize numeric columns while preserving time column."""
    numeric_cols = df.select_dtypes(include=["float64", "int64"]).columns
    return pd.DataFrame(
        StandardScaler().fit_transform(df[numeric_cols]),
        columns=numeric_cols,
        index=df.index,
    ).assign(time=df[Config.TIME_COLUMN])


def process_satellite_data(satellite_name: str) -> None:
    """Process satellite data and generate dependency graphs."""
    artifacts_dir = (Config.ARTIFACTS_DIR / satellite_name).absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.set_tracking_uri(Config.TRACKING_URI)
    mlflow.enable_system_metrics_logging()
    mlflow.set_experiment(satellite_name)

    with mlflow.start_run(run_name="build_graph"):
        dynamics = (
            pd.read_csv(Config.DOWNLOAD_DIR / f"{satellite_name}.csv")
            .drop(list(Config.COLUMNS_TO_DROP), axis=1)
            .pipe(interpolate_timeseries)
            .pipe(normalize_numeric_columns)
        )

        dynamics_file = artifacts_dir / f"{satellite_name}.csv"
        mlflow.log_input(
            mlflow.data.from_pandas(dynamics, name="satellite_parameters")
        )
        dynamics.to_csv(dynamics_file, index=False)
        mlflow.log_artifact(str(dynamics_file), artifact_path="graph")

        graph_file = artifacts_dir / f"{satellite_name}_graph.yaml"
        graph_data = cross_correlate(
            input_dataframe=dynamics,
            index_column=Config.TIME_COLUMN,
            xcorr_configuration_file=Config.MODEL_CFG_PATH,
        )

        save_to_yaml(graph_data, graph_file)
        mlflow.log_artifact(str(graph_file), artifact_path="graph")

        output_path = artifacts_dir / "graph.html"
        create_dependency_graph(graph_file, {}).render(str(output_path))
        logging.info(f"graph rendered: {output_path}")
        mlflow.log_artifact(str(output_path), artifact_path="graph")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Satellite data processor and dependency graph generator",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    %(prog)s satellite-a     # Process data for satellite-a
    %(prog)s satellite-b     # Process data for satellite-b
        """,
    )
    parser.add_argument(
        "satellite_name", help="satellite identifier to process"
    )
    args = parser.parse_args()

    setup_logging()
    process_satellite_data(args.satellite_name)


if __name__ == "__main__":
    main()
