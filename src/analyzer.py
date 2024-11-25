import pandas as pd
from pathlib import Path
import glob
import argparse
import mlflow

from src.polaris.learn.analysis import cross_correlate
from src.graph import create_dependency_graph

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


def get_columns_and_sources(path: Path) -> dict[str, str]:
    all_files = glob.glob(f"{path}/*.csv")

    columns_to_source_map: dict[str, str] = {}

    for file_path in all_files:
        df = pd.read_csv(file_path)

        df.columns = [
            col.replace(" ", "_")
            .replace(",", "_")
            .replace("<", "_")
            .replace(">", "_")
            .replace("[", "_")
            .replace("]", "_")
            .replace("(", "_")
            .replace(")", "_")
            .replace("+", "_")
            .replace("#", "_")
            for col in df.columns
        ]

        for column_name in df.columns:
            if column_name not in columns_to_source_map:
                columns_to_source_map[column_name] = Path(file_path).name

    return columns_to_source_map


def read_satellite_data(path: Path, time_column: str = TIME_COLUMN) -> pd.DataFrame:
    all_files = glob.glob(f"{path}/*.csv")
    df = pd.concat((pd.read_csv(f) for f in all_files), ignore_index=True)
    df[time_column] = pd.to_datetime(df[time_column]).dt.normalize()

    df = df.select_dtypes(include=["number", "bool", "datetime"])
    df.columns = [
        col.replace(" ", "_")
        .replace(",", "_")
        .replace("<", "_")
        .replace(">", "_")
        .replace("[", "_")
        .replace("]", "_")
        .replace("(", "_")
        .replace(")", "_")
        .replace("+", "_")
        .replace("#", "_")
        for col in df.columns
    ]

    return df.groupby(time_column).mean()


def read_solar_data(file_path: Path, date_column: str):
    df = pd.read_json(file_path)
    df[date_column] = pd.to_datetime(df[date_column])
    return df


def parse_solar_data(solar_dir: Path):
    swpc_observed_ssn = read_solar_data(
        solar_dir / "swpc_observed_ssn.json", OBS_DATE_COLUMN
    ).rename(columns={OBS_DATE_COLUMN: TIME_COLUMN})

    swpc_dgd = pd.read_csv(solar_dir / "dgd.csv", parse_dates=["Date"]).rename(
        columns={"Date": TIME_COLUMN}
    )

    fluxtable = pd.read_csv(
        solar_dir / "fluxtable.txt",
        delim_whitespace=True,
        parse_dates=["fluxdate"],
    ).rename(columns={"fluxdate": TIME_COLUMN})

    daily_total_sunspot_number = pd.read_csv(
        solar_dir / "daily_total_sunspot_number.csv",
        parse_dates=[TIME_COLUMN],
    )

    daily_hemispheric_sunspot_number = pd.read_csv(
        solar_dir / "daily_hemispheric_sunspot_number.csv",
        parse_dates=[TIME_COLUMN],
    )

    return [
        swpc_observed_ssn,
        swpc_dgd,
        fluxtable,
        daily_total_sunspot_number,
        daily_hemispheric_sunspot_number,
    ]


def merge_dataframes(
    initial_frame: pd.DataFrame, dataframes_to_merge: list[pd.DataFrame]
):
    for df in dataframes_to_merge:
        initial_frame = initial_frame.merge(df, how="left", on=TIME_COLUMN)
    return initial_frame


def process_satellite_data(satellite_name: str):
    mlflow.set_experiment(f"{satellite_name}_graph")

    artifacts_dir = Path(f"{ARTIFACTS_DIR}/{satellite_name}").absolute()
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    satellites_dir = Path(SATELLITES_DIR).absolute()
    solar_dir = Path(SOLAR_DIR).absolute()
    model_cfg = Path(MODEL_CFG_PATH).absolute()

    output_graph_file = artifacts_dir / f"{satellite_name}{OUTPUT_GRAPH_SUFFIX}"

    mlflow.start_run(run_name="build_graph")

    satellite_data = read_satellite_data(satellites_dir / satellite_name)

    solar_dataframes = parse_solar_data(solar_dir)

    solar_dataframes_filtered = merge_dataframes(
        solar_dataframes[0], solar_dataframes[1:]
    ).filter(
        items=[
            "Time",
            "fluxcarrington",
            "swpc_ssn",
            "Frederickburg K 0-3",
            "SNvalue",
            "SNvalue_tot",
        ]
    )

    dynamics = merge_dataframes(satellite_data, [solar_dataframes_filtered])

    dynamics.to_csv(artifacts_dir / f"{satellite_name}", index=False)

    mlflow.log_artifact(str(artifacts_dir / f"{satellite_name}"))

    cross_correlate(
        input_dataframe=dynamics,
        output_graph_file=output_graph_file,
        index_column=TIME_COLUMN,
        xcorr_configuration_file=model_cfg,
        dropna=True,
    )

    mlflow.log_artifact(str(output_graph_file))

    create_dependency_graph(
        output_graph_file,
        artifacts_dir,
        get_columns_and_sources(satellites_dir / "cross_correlate"),
    )

    mlflow.log_artifact(str(artifacts_dir / "graph.html"))
    mlflow.end_run()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process satellite data.")
    parser.add_argument("satellite_name", type=str, help="Name of the satellite")

    args = parser.parse_args()

    process_satellite_data(args.satellite_name)
