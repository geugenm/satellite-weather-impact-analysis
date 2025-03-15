from __future__ import annotations
from pathlib import Path
import typer
from rich.console import Console
from rich.logging import RichHandler
import logging
import pandas as pd
import yaml
import mlflow
from sklearn.preprocessing import StandardScaler
from functools import partial

# fix for mlflow - https://github.com/SciTools/iris/issues/4879
import matplotlib

matplotlib.use("QtAgg")

from astra.graph import create_dependency_graph
from astra.model.cross_correlate import cross_correlate
from astra.config.data import DataConfig
from astra.paths import CONFIG_PATH
from astra.influxdb.pull_wrapper import PullWrapper


console = Console()
app = typer.Typer(rich_markup_mode="rich")


def setup_logging() -> None:
    logging.basicConfig(
        level=logging.INFO,
        format="%(message)s",
        handlers=[RichHandler(console=console, rich_tracebacks=True)],
    )


def load_config(path: Path) -> DataConfig:
    return DataConfig.from_yaml(path)


def interpolate_df(df: pd.DataFrame, time_col: str) -> pd.DataFrame:
    return (
        df.assign(time=lambda x: pd.to_datetime(x[time_col]))
        .groupby(time_col, as_index=False)
        .mean()
        .set_index(time_col)
        .pipe(lambda x: x.interpolate(method="time").ffill().bfill())
        .reset_index()
    )


def normalize_df(
    df: pd.DataFrame, time_col: str, exclude_cols: list
) -> pd.DataFrame:
    numeric_cols = [
        col
        for col in df.select_dtypes(include=["float64", "int64"]).columns
        if col not in exclude_cols
    ]

    return pd.DataFrame(
        StandardScaler().fit_transform(df[numeric_cols]),
        columns=numeric_cols,
        index=df.index,
    ).assign(**{time_col: df[time_col]})


def process_data(df: pd.DataFrame, config: DataConfig) -> pd.DataFrame:
    return df.drop(list(config.format.exclude_columns), axis=1).pipe(
        partial(
            normalize_df,
            time_col=config.format.time_column,
            exclude_cols=config.format.exclude_columns,
        )
    )


def load_mapping(path: Path) -> dict:
    return yaml.safe_load(path.open())


@app.command()
def process_satellite(
    satellite_name: str = typer.Argument(
        ..., help="Satellite identifier to process"
    ),
    config_path: Path = typer.Option(
        Path(f"{CONFIG_PATH}/data.yaml"), help="Path to configuration file"
    ),
) -> None:
    try:
        setup_logging()
        config = load_config(config_path)

        mlflow.set_tracking_uri("http://localhost:5000")
        mlflow.enable_system_metrics_logging()
        mlflow.set_experiment(satellite_name)

        with mlflow.start_run(run_name="build_graph"):
            influx = PullWrapper(
                url="http://localhost:8086",
                token="my_super_secret_token",
                org="org",
            )

            dynamics = (
                influx.get_bucket_df(
                    time_from="-2y",
                    time_to="now()",
                    bucket_list=["solar", satellite_name],
                )
                .reset_index()
                .pipe(process_data, config)
            )

            mlflow.log_input(
                mlflow.data.from_pandas(dynamics, name="satellite_parameters")
            )

            graph_data = cross_correlate(
                input_dataframe=dynamics,
                index_column=config.format.time_column,
                xcorr_configuration_file=Path("cfg/model.yaml"),
            )
            mlflow.log_dict(graph_data, "graph/graph.yaml")

            map = influx.get_bucket_sources(["solar", satellite_name])

            graph_content = create_dependency_graph(
                graph_data, map
            ).render_embed()
            mlflow.log_text(graph_content, "graph/graph.html")

            console.print(
                f"[green]Successfully processed {satellite_name}[/green]"
            )

    except Exception as e:
        console.print(f"[red]Error processing satellite data: {str(e)}[/red]")
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
