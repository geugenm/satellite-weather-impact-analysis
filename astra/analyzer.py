from __future__ import annotations
from pathlib import Path
from typing import TypeAlias
import argparse
import logging

# fix for mlflow - https://github.com/SciTools/iris/issues/4879
import matplotlib

matplotlib.use("QtAgg")

import pandas as pd
import yaml
import mlflow
from sklearn.preprocessing import StandardScaler

from astra.graph import create_dependency_graph
from astra.model.cross_correlate import cross_correlate
from astra.config.data import DataConfig

from pydantic import ValidationError

PathLike: TypeAlias = str | Path


def setup_logging() -> None:
    """Configure logging with production-ready settings."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        handlers=[
            logging.FileHandler("processing.log"),
            logging.StreamHandler(),
        ],
    )


def load_configurations() -> DataConfig:
    """Load and validate all application configurations."""
    try:
        data_cfg = DataConfig.from_yaml(Path("cfg/data.yaml"))
        return data_cfg
    except ValidationError as e:
        logging.error(f"Configuration error: {e}")
        raise SystemExit(1) from e


def interpolate_timeseries(
    df: pd.DataFrame, data_cfg: DataConfig
) -> pd.DataFrame:
    """Handle missing values using configured time parameters."""
    fmt_cfg = data_cfg.format
    return (
        df.assign(time=lambda x: pd.to_datetime(x[fmt_cfg.time_column]))
        .groupby(fmt_cfg.time_column, as_index=False)
        .mean()
        .set_index(fmt_cfg.time_column)
        .pipe(lambda x: x.interpolate(method="time").ffill().bfill())
        .reset_index()
    )


def normalize_numeric_columns(
    df: pd.DataFrame, data_cfg: DataConfig
) -> pd.DataFrame:
    """Normalize data using configured numeric precision."""
    fmt_cfg = data_cfg.format
    numeric_cols = [
        col
        for col in df.select_dtypes(include=["float64", "int64"]).columns
        if col not in fmt_cfg.exclude_columns
    ]
    return pd.DataFrame(
        StandardScaler().fit_transform(df[numeric_cols]),
        columns=numeric_cols,
        index=df.index,
    ).assign(**{fmt_cfg.time_column: df[fmt_cfg.time_column]})


def process_satellite_data(satellite_name: str, data_cfg: DataConfig) -> None:
    """Process satellite data using validated configurations."""
    artifacts_dir = data_cfg.artifacts.dir / satellite_name
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    mlflow.set_tracking_uri(str(data_cfg.artifacts.dir / "mlruns"))
    mlflow.enable_system_metrics_logging()
    mlflow.set_experiment(satellite_name)

    with mlflow.start_run(run_name="build_graph"):
        raw_data_path = data_cfg.fetch.processed / f"{satellite_name}.csv"
        dynamics = (
            pd.read_csv(raw_data_path)
            .drop(list(data_cfg.format.exclude_columns), axis=1)
            .pipe(normalize_numeric_columns, data_cfg)
        )

        processed_path = artifacts_dir / f"{satellite_name}.csv"
        mlflow.log_input(
            mlflow.data.from_pandas(dynamics, name="satellite_parameters")
        )
        dynamics.to_csv(processed_path, index=False)
        mlflow.log_artifact(str(processed_path), artifact_path="graph")

        graph_file = artifacts_dir / f"{satellite_name}_graph.yaml"
        graph_data = cross_correlate(
            input_dataframe=dynamics,
            index_column=data_cfg.format.time_column,
            xcorr_configuration_file=Path("cfg/model.yaml"),
        )

        with graph_file.open("w") as f:
            yaml.safe_dump(graph_data, f, sort_keys=False)
        mlflow.log_artifact(str(graph_file), artifact_path="graph")

        mapping_path = (
            data_cfg.fetch.base_dir / f"cfg/{satellite_name}_mapping.yaml"
        )
        with mapping_path.open() as f:
            sat_map = yaml.safe_load(f)

        sun_mapping_path = data_cfg.fetch.base_dir / "solar_mapping.yaml"
        with sun_mapping_path.open() as f:
            sun_map = yaml.safe_load(f)

        output_path = artifacts_dir / "graph.html"
        create_dependency_graph(graph_file, sat_map | sun_map).render(
            str(output_path)
        )
        logging.info(f"Rendered dependency graph: {output_path}")
        mlflow.log_artifact(str(output_path), artifact_path="graph")


def main() -> None:
    """Main execution flow with configuration-driven processing."""
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
        "satellite_name", help="Satellite identifier to process"
    )
    args = parser.parse_args()

    setup_logging()
    data_cfg = load_configurations()

    logging.info(f"Using data directory: {data_cfg.fetch.base_dir}")

    process_satellite_data(args.satellite_name, data_cfg)


if __name__ == "__main__":
    main()
