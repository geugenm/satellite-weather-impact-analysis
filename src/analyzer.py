from functools import reduce

import pandas as pd
from pathlib import Path

import glob
import argparse
import mlflow

mlflow.set_tracking_uri("../artifacts/mlruns")

from modules.learn.analysis import cross_correlate
from src.graph import create_dependency_graph


def read_satellite_data(path, time_column="Time"):
    all_files = glob.glob(f"{path}/*.csv")
    df = pd.concat((pd.read_csv(f) for f in all_files), ignore_index=True)
    df[time_column] = pd.to_datetime(df[time_column]).dt.normalize()

    df = df.select_dtypes(include=["number", "bool", "datetime"])
    df.columns = [
        col.replace(" ", "_")
        .replace(",", "_")
        .replace("<", "_")
        .replace(">", "_")
        .replace("[", "(")
        .replace("]", ")")
        .replace("+", "_")
        .replace("#", "_")
        for col in df.columns
    ]

    return df.groupby(time_column).mean()


def read_solar_data(file_path, date_column):
    df = pd.read_json(file_path)
    df[date_column] = pd.to_datetime(df[date_column])
    return df


def process_satellite_data(satellite_name):
    time_column = "Time"

    artifacts_dir = Path(f"../artifacts/{satellite_name}")
    artifacts_dir.mkdir(parents=True, exist_ok=True)

    satellites_dir = Path("../downloads")
    solar_dir = Path("../data/solar")
    model_cfg = Path("../cfg/model.json")
    output_graph_file = artifacts_dir / f"{satellite_name}_graph.json"

    satellite_data = read_satellite_data(satellites_dir / satellite_name)

    swpc_observed_ssn = read_solar_data(
        solar_dir / "swpc/swpc_observed_ssn.json", "Obsdate"
    ).rename(columns={"Obsdate": time_column})

    swpc_observed_solar_cycle_indices = read_solar_data(
        solar_dir / "swpc/observed-solar-cycle-indices.json", "time-tag"
    ).rename(columns={"time-tag": time_column})

    swpc_dgd = pd.read_csv(solar_dir / "swpc/dgd.csv", parse_dates=["Date"]).rename(
        columns={"Date": time_column}
    )

    fluxtable = pd.read_csv(
        solar_dir / "penticton/fluxtable.txt",
        delim_whitespace=True,
        parse_dates=["fluxdate"],
    ).rename(columns={"fluxdate": time_column})

    dataframes_to_merge = [
        swpc_observed_ssn,
        swpc_observed_solar_cycle_indices,
        swpc_dgd,
        fluxtable,
    ]

    solar_dynamics = dataframes_to_merge[0]
    for df in dataframes_to_merge[1:]:
        solar_dynamics = solar_dynamics.merge(df, how="left", on=time_column)

    filter_list: list[str] = [
        time_column,  # do not forget!!!
        "smoothed_f10.7",
        "f10.7",
        "observed_swpc_ssn",
        "smoothed_ssn",
        "fluxcarrington",
        "Frederickburg K 0-3",
    ]

    dynamics = satellite_data.merge(
        solar_dynamics.filter(items=filter_list), on=time_column, how="left"
    )

    dynamics.to_csv(artifacts_dir / f"{satellite_name}_full.csv", index=False)

    cross_correlate(
        input_dataframe=dynamics,
        output_graph_file=output_graph_file,
        index_column=time_column,
        xcorr_configuration_file=model_cfg,
        dropna=True,
    )

    create_dependency_graph(output_graph_file, artifacts_dir)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process satellite data.")
    parser.add_argument("satellite_name", type=str, help="Name of the satellite")

    args = parser.parse_args()

    process_satellite_data(args.satellite_name)
