from __future__ import annotations

import logging
from pathlib import Path
from typing import Optional

import pandas as pd
import polars as pl
import typer
import yaml

from astra.config.data import get_project_config, DataConfig
from astra.model.cross_correlate import cross_correlate
from astra.model.csv import create_column_mapping, load_time_series_data
from astra.out.graph import create_dependency_graph
from astra.paths import CONFIG_PATH

import polars.selectors as cs

app = typer.Typer()

logging = logging.getLogger(__name__)


def process_time_series(
    df: pl.DataFrame, config: DataConfig, exclude_columns: list[str] = []
) -> pd.DataFrame:
    df = df.drop(exclude_columns)
    time_col = config.format.time_column

    df = df.with_columns(pl.col(time_col).str.to_datetime())
    df = df.group_by(time_col).mean().sort(time_col)

    # drop consts
    df = df[[s.name for s in df if s.n_unique() > 1]]

    numeric_cols = [
        col for col in df.select(cs.numeric()).columns if col != time_col
    ]
    df = df.with_columns(
        [
            pl.col(col)
            .fill_null(strategy="forward")
            .fill_null(strategy="backward")
            for col in numeric_cols
        ]
    )
    numeric_df = df.select(numeric_cols)
    means = numeric_df.mean()
    stds = numeric_df.std()

    # Create normalized columns
    normalized_exprs = [
        ((pl.col(col) - means[col]) / stds[col]).alias(col)
        for col in numeric_cols
    ]

    # Create the normalized dataframe with the time column
    df = df.select(normalized_exprs + [pl.col(time_col)])

    return df.to_pandas()


def setup_mlflow(experiment_name: str) -> bool:
    try:
        import mlflow

        mlflow.set_tracking_uri("http://localhost:5000")
        mlflow.set_experiment(experiment_name)
        logging.info(
            f"mlflow tracking enabled for experiment: '{experiment_name}'"
        )
        return True
    except ImportError:
        logging.warning("mlflow not installed, skipping mlflow tracking")
        return False
    except Exception as e:
        logging.warning(f"failed to setup mlflow: '{e}'")
        return False


@app.callback(invoke_without_command=True)
def analyze_time_series(
    graph_name: str = typer.Argument(help="name for the analysis graph"),
    data_dir: Optional[Path] = typer.Option(
        None,
        help="directory containing csv files (Using graph_name by default)",
    ),
    parallel: bool = typer.Option(
        False,
        "--parallel",
        "-p",
        help="enable experimental parallel processing (simple mlflow logs only)",
    ),
    use_mlflow: bool = typer.Option(
        False, "--mlflow", help="Enable mlflow tracking"
    ),
) -> None:
    if not data_dir:
        data_dir = Path(graph_name)

    try:
        config = get_project_config()
        logging.info(f"analyzing time series data for: '{graph_name}'")

        polars_df = load_time_series_data(data_dir, config.format.time_column)
        dynamics = process_time_series(polars_df, config)

        mlflow_enabled = use_mlflow and setup_mlflow(graph_name)

        if mlflow_enabled:
            import mlflow

            with mlflow.start_run(run_name="build_graph"):
                mlflow.log_input(
                    mlflow.data.from_pandas(
                        dynamics, name="time_series_parameters"
                    )
                )

                graph_data = cross_correlate(
                    input_dataframe=dynamics,
                    index_column=config.format.time_column,
                    xcorr_configuration_file=Path(f"{CONFIG_PATH}/model.yaml"),
                    enable_experimental_parallelism=parallel,
                )

                column_map = create_column_mapping(
                    data_dir, config.format.time_column
                )
                graph_content = create_dependency_graph(
                    graph_data, column_map
                ).render_embed()

                mlflow.log_dict(graph_data, "graph/graph.yaml")
                mlflow.log_text(graph_content, "graph/graph.html")
        else:
            graph_data = cross_correlate(
                input_dataframe=dynamics,
                index_column=config.format.time_column,
                xcorr_configuration_file=Path(f"{CONFIG_PATH}/model.yaml"),
                enable_experimental_parallelism=parallel,
                use_mlflow=mlflow_enabled,
            )

            column_map = create_column_mapping(
                data_dir, config.format.time_column
            )
            graph_content = create_dependency_graph(
                graph_data, column_map
            ).render_embed()

            output_path = Path(f"./output/{graph_name}")
            output_path.mkdir(parents=True, exist_ok=True)

            with open(output_path / "graph.html", "w") as f:
                f.write(graph_content)
            with open(output_path / "graph.yaml", "w") as f:
                yaml.dump(graph_data, f)

        logging.info(f"successfully analyzed time series data: '{graph_name}'")

    except Exception as e:
        logging.error(f"error analyzing time series data: '{e}'")
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
