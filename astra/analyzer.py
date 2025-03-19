from __future__ import annotations
from pathlib import Path
import typer
from rich.console import Console
from rich.logging import RichHandler
import logging
import polars as pl
import pandas as pd
import yaml
import mlflow
from sklearn.preprocessing import StandardScaler

# fix for mlflow - https://github.com/SciTools/iris/issues/4879
import matplotlib

matplotlib.use("QtAgg")

from astra.graph import create_dependency_graph
from astra.model.cross_correlate import cross_correlate
from astra.config.data import DataConfig
from astra.paths import CONFIG_PATH

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


def load_time_series_data(data_dir: Path, time_column: str) -> pl.DataFrame:
    """Load and merge all CSV files in directory that contain the time column."""
    csv_files = list(data_dir.glob("**/*.csv"))

    if not csv_files:
        raise ValueError(f"no csv files found in {data_dir}")

    valid_dfs = []

    for file_path in csv_files:
        try:
            # Try to infer schema from first few rows
            df = pl.scan_csv(file_path, infer_schema_length=1000)

            # Check if time column exists in this file
            if time_column in df.collect().columns:
                valid_dfs.append(df)
            else:
                logging.warning(
                    f"skipping {file_path} - missing '{time_column}' column"
                )
        except Exception as e:
            logging.warning(f"error reading {file_path}: {str(e)}")

    if not valid_dfs:
        raise ValueError(
            f"no valid csv files with '{time_column}' column found"
        )

    # Collect and concatenate all valid dataframes
    try:
        combined_df = pl.concat(valid_dfs, how="diagonal_relaxed").collect()
        return combined_df
    except Exception as e:
        logging.warning(
            f"schema mismatch detected, trying with schema relaxation: {str(e)}"
        )
        combined_df = pl.concat(
            [df.collect() for df in valid_dfs], how="diagonal_relaxed"
        )
        return combined_df


def interpolate_time_series(df: pl.DataFrame, time_col: str) -> pl.DataFrame:
    """Interpolate missing values in a time series DataFrame."""
    # Convert time column to datetime
    df = df.with_columns(pl.col(time_col).str.to_datetime())

    # Group by time and calculate mean
    df = df.group_by(time_col).mean()

    # Sort by time for interpolation
    df = df.sort(time_col)

    # Interpolate missing values
    df = df.interpolate()

    # Forward and backward fill remaining nulls
    numeric_cols = [col for col in df.columns if col != time_col]
    df = df.with_columns(
        [
            pl.col(col)
            .fill_null(strategy="forward")
            .fill_null(strategy="backward")
            for col in numeric_cols
        ]
    )

    return df


def normalize_time_series(
    df: pl.DataFrame, time_col: str, exclude_cols: list
) -> pd.DataFrame:
    """Normalize numeric columns using StandardScaler."""
    # Convert to pandas for StandardScaler
    pdf = df.to_pandas()

    numeric_cols = [
        col
        for col in pdf.select_dtypes(include=["float64", "int64"]).columns
        if col not in exclude_cols
    ]

    # Apply StandardScaler
    normalized_data = StandardScaler().fit_transform(pdf[numeric_cols])

    # Create new DataFrame with normalized data
    normalized_df = pd.DataFrame(
        normalized_data, columns=numeric_cols, index=pdf.index
    )
    normalized_df[time_col] = pdf[time_col]

    return normalized_df


def process_time_series(
    df: pl.DataFrame, config: DataConfig, exclude_columns: list[str] = []
) -> pd.DataFrame:
    """Process time series data by dropping columns and normalizing."""
    # Drop excluded columns
    df = df.drop(exclude_columns)

    # Interpolate missing values
    df = interpolate_time_series(df, config.format.time_column)

    # Convert to pandas and normalize
    return normalize_time_series(df, config.format.time_column, exclude_columns)


@app.callback(invoke_without_command=True)
def analyze_time_series(
    graph_name: str = typer.Argument(
        ..., help="name for the analysis graph and experiment"
    ),
    data_dir: Path = typer.Option(
        Path("./data"), help="directory containing csv files to process"
    ),
    config_path: Path = typer.Option(
        Path(f"{CONFIG_PATH}/data.yaml"), help="path to configuration file"
    ),
    parallel: bool = typer.Option(
        False,
        "--parallel",
        "-p",
        help="enable parallel processing (graph rendering only)",
    ),
    use_mlflow: bool = typer.Option(
        True,
        "--mlflow/--no-mlflow",
        help="enable/disable logging to mlflow",
    ),
) -> None:
    """Analyze time series data from CSV files and generate correlation graphs."""
    try:
        setup_logging()
        config = load_config(config_path)

        logging.info(f"analyzing time series data for: {graph_name}")
        logging.info(f"loading csv files from {data_dir}")

        # Load and merge all CSV files using Polars
        polars_df = load_time_series_data(data_dir, config.format.time_column)

        # Process data and convert to pandas for analysis
        dynamics = process_time_series(polars_df, config)

        # Log to MLflow if enabled
        if use_mlflow:
            mlflow.set_tracking_uri("http://localhost:5000")
            mlflow.set_experiment(graph_name)

            with mlflow.start_run(run_name="build_graph"):
                # Log input data to MLflow
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
                mlflow.log_dict(graph_data, "graph/graph.yaml")

                # Create column-to-file mapping excluding time column
                map = {}
                for file_path in data_dir.glob("**/*.csv"):
                    try:
                        df = pl.scan_csv(
                            file_path, infer_schema_length=1000
                        ).collect()
                        for col in df.columns:
                            if col != config.format.time_column:
                                map[col] = {
                                    "source": file_path.name,
                                    "measurement": col,
                                }
                    except Exception as e:
                        logging.warning(
                            f"error reading {file_path} for mapping: {str(e)}"
                        )

                graph_content = create_dependency_graph(
                    graph_data, map
                ).render_embed()
                mlflow.log_text(graph_content, "graph/graph.html")
        else:
            # Process without MLflow
            graph_data = cross_correlate(
                input_dataframe=dynamics,
                index_column=config.format.time_column,
                xcorr_configuration_file=Path(f"{CONFIG_PATH}/model.yaml"),
                enable_experimental_parallelism=parallel,
            )

            # Create column-to-file mapping excluding time column
            map = {}
            for file_path in data_dir.glob("**/*.csv"):
                try:
                    df = pl.scan_csv(
                        file_path, infer_schema_length=1000
                    ).collect()
                    for col in df.columns:
                        if col != config.format.time_column:
                            map[col] = {
                                "source": file_path.name,
                                "measurement": col,
                            }
                except Exception as e:
                    logging.warning(
                        f"error reading {file_path} for mapping: {str(e)}"
                    )

            # Save graph locally
            graph_content = create_dependency_graph(
                graph_data, map
            ).render_embed()
            output_path = Path(f"./output/{graph_name}")
            output_path.mkdir(parents=True, exist_ok=True)
            with open(output_path / "graph.html", "w") as f:
                f.write(graph_content)
            with open(output_path / "graph.yaml", "w") as f:
                yaml.dump(graph_data, f)

        console.print(
            f"[green]successfully analyzed time series data: {graph_name}[/green]"
        )

    except Exception as e:
        console.print(f"[red]error analyzing time series data: {str(e)}[/red]")
        logging.exception("detailed error information:")
        raise typer.Exit(code=1)


@app.command()
def list_columns(
    data_dir: Path = typer.Argument(
        ..., help="directory containing csv files to analyze"
    ),
) -> None:
    """List all available columns across CSV files in the directory."""
    try:
        setup_logging()
        csv_files = list(data_dir.glob("**/*.csv"))

        if not csv_files:
            console.print(f"[yellow]no csv files found in {data_dir}[/yellow]")
            return

        all_columns = set()
        file_columns = {}

        for file_path in csv_files:
            try:
                df = pl.scan_csv(file_path, infer_schema_length=1000).collect()
                file_columns[file_path.name] = df.columns
                all_columns.update(df.columns)
            except Exception as e:
                console.print(
                    f"[yellow]error reading {file_path}: {str(e)}[/yellow]"
                )

        console.print("[bold]all columns found across files:[/bold]")
        for col in sorted(all_columns):
            console.print(f"  - {col}")

        console.print("\n[bold]columns by file:[/bold]")
        for filename, columns in file_columns.items():
            console.print(f"[bold]{filename}[/bold]: {', '.join(columns)}")

    except Exception as e:
        console.print(f"[red]error listing columns: {str(e)}[/red]")
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
