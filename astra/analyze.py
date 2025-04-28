from __future__ import annotations

import logging
from pathlib import Path

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
    data_dirs: list[Path] = typer.Option(
        None,
        "--data-dir",
        "-d",
        help="directories containing csv files (can be specified multiple times)",
    ),
    output_dir: Path = typer.Option(
        Path("out"),
        "--output",
        "-o",
        help="output directory for results (default: ./<graph_name>/out)",
    ),
    parallel: bool = typer.Option(
        False,
        "--parallel",
        "-p",
        help="enable experimental parallel processing",
    ),
    use_mlflow: bool = typer.Option(
        False, "--mlflow", help="enable mlflow tracking"
    ),
) -> None:
    # Default to graph_name directory if no data directories specified
    if not data_dirs:
        data_dirs = [Path(graph_name)]

    try:
        config = get_project_config()
        logging.info(
            f"analyzing time series data for: '{graph_name}' from {len(data_dirs)} directories"
        )

        # Load data from multiple directories
        frames = []
        for dir_path in data_dirs:
            logging.info(f"loading data from: {dir_path}")
            frames.append(
                load_time_series_data(dir_path, config.format.time_column)
            )

        # Concatenate all dataframes if multiple directories
        if len(frames) > 1:
            polars_df = pl.concat(frames, how="diagonal")
        else:
            polars_df = frames[0]

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

                # Create column mapping from all data directories
                column_map = {}
                for dir_path in data_dirs:
                    column_map.update(
                        create_column_mapping(
                            dir_path, config.format.time_column
                        )
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

            # Create column mapping from all data directories
            column_map = {}
            for dir_path in data_dirs:
                column_map.update(
                    create_column_mapping(dir_path, config.format.time_column)
                )

            graph_content = create_dependency_graph(
                graph_data, column_map
            ).render_embed()

            output_path = Path(f"./{graph_name}/{output_dir}").absolute()
            output_path.mkdir(parents=True, exist_ok=True)

            with open(output_path / "graph.html", "w") as f:
                f.write(graph_content)
                print(f"✨ graph saved to: '{output_path}/graph.html' 🌐")

            with open(output_path / "graph.yaml", "w") as f:
                yaml.dump(graph_data, f)
                print(f"📝 graph data saved to: '{output_path}/graph.yaml' 🚀")

        logging.info(f"successfully analyzed time series data: '{graph_name}'")

    except Exception as e:
        logging.error(f"error analyzing time series data: '{e}'")
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
