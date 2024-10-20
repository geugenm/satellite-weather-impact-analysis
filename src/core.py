import pandas as pd
from pathlib import Path
import glob
import os
import json
import threading
import argparse


from pyecharts import options as opts
from pyecharts.charts import Graph
from modules.learn.analysis import cross_correlate


parser = argparse.ArgumentParser(description="Process satellite data.")
parser.add_argument("satellite_name", type=str, help="Name of the satellite")
args = parser.parse_args()

time_column: str = "Time"
satellite_name: str = args.satellite_name

artifacts_dir: Path = f"../artifacts/{satellite_name}"
os.makedirs(artifacts_dir, exist_ok=True)

satellites_dir: Path = "../data/satellites"
solar_dir: Path = "../data/solar"
model_cfg: Path = "../cfg/model.json"
output_graph_file: Path = f"{artifacts_dir}/{satellite_name}_graph.json"


def read_satellite_data(path: Path) -> pd.DataFrame:
    all_files = glob.glob(f"{path}/*.csv")
    df = (
        pd.concat((pd.read_csv(f) for f in all_files), ignore_index=True)
        .groupby(time_column, as_index=False)
        .mean()
    )
    df[time_column] = pd.to_datetime(df[time_column]).dt.normalize()
    df = df.select_dtypes(include=["number", "bool", "datetime"])

    return df


satellite_data = read_satellite_data(f"{satellites_dir}/{satellite_name}")
satellite_columns: list[str] = satellite_data.drop(time_column, axis=1).columns


def read_solar_data(file_path: Path, date_column: str) -> pd.DataFrame:
    df = pd.read_json(file_path)
    df[date_column] = pd.to_datetime(df[date_column])
    return df


swpc_observed_ssn = read_solar_data(
    f"{solar_dir}/swpc/swpc_observed_ssn.json", "Obsdate"
)

swpc_observed_solar_cycle_indicies = read_solar_data(
    f"{solar_dir}/swpc/observed-solar-cycle-indices.json", "time-tag"
)

swpc_dgd = pd.read_csv(f"{solar_dir}/swpc/dgd.csv")
swpc_dgd["Date"] = pd.to_datetime(swpc_dgd["Date"])

fluxtable = pd.read_csv(f"{solar_dir}/penticton/fluxtable.txt", delim_whitespace=True)
fluxtable["fluxdate"] = pd.to_datetime(fluxtable["fluxdate"])

dynamics = pd.merge(
    satellite_data,
    swpc_observed_ssn,
    left_on=time_column,
    right_on="Obsdate",
    how="left",
).drop(columns=["Obsdate"])

dynamics = pd.merge(
    dynamics,
    swpc_observed_solar_cycle_indicies,
    left_on=time_column,
    right_on="time-tag",
    how="left",
).drop(columns=["time-tag"])

dynamics = pd.merge(
    dynamics,
    swpc_dgd,
    left_on=time_column,
    right_on="Date",
    how="left",
).drop(columns=["Date"])

dynamics = pd.merge(
    dynamics,
    fluxtable,
    left_on=time_column,
    right_on="fluxdate",
    how="left",
).drop(columns=["fluxdate"])


def save_to_csv(df, filename):
    print(f"Starting full frame export: {filename}...")
    df.to_csv(filename, index=False)
    print(f"Exported full frame: {filename}")


thread = threading.Thread(
    target=save_to_csv,
    args=(dynamics.copy(), f"{artifacts_dir}/{satellite_name}_full.csv"),
)

thread.start()

cross_correlate(
    input_dataframe=dynamics,
    output_graph_file=output_graph_file,
    index_column=time_column,
    xcorr_configuration_file=model_cfg,
    dropna=True,
)

with open(output_graph_file, "r") as file:
    loaded_json = json.load(file)

data = loaded_json["graph"]

nodes = set()
links = []

for link in data["links"]:
    nodes.add(link["source"])
    nodes.add(link["target"])
    links.append(
        {"source": link["source"], "target": link["target"], "value": link["value"]}
    )

node_list = []
for node in nodes:
    node_list.append(
        {
            "name": node,
            "symbolSize": 20,
            "value": f"{node} - {len([link for link in links if link['source'] == node or link['target'] == node])} bound(s)",
        }
    )

graph = (
    Graph()
    .add("", node_list, links, repulsion=8000)
    .set_global_opts(
        title_opts=opts.TitleOpts(title="2D Dependency Graph"),
        tooltip_opts=opts.TooltipOpts(trigger="item", formatter="{b}: {c}"),
    )
)

graph.render(f"{artifacts_dir}/graph.html")

thread.join()
