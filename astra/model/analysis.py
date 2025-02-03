import logging
import os

import pandas as pd
import yaml
import numpy as np
from pathlib import Path

from astra.model.cross_correlation import XCorr


class NoFramesInInputFile(Exception):
    pass


def create_graph_data(
    satellite_name: str, heatmap, threshold: float = 0.1  # pandas DataFrame
) -> dict:
    """Transform heatmap matrix into optimized graph structure"""
    return {
        "satellite": satellite_name,
        "links": [
            {"source": src, "target": tgt, "coefficient": float(val)}
            for src, targets in heatmap.items()
            for tgt, val in targets.items()
            if tgt != src and not np.isnan(val) and val >= threshold
        ],
    }


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


def cross_correlate(
    input_dataframe: pd.DataFrame,
    output_graph_file: str | None = None,
    xcorr_configuration_file: str | None = None,
    index_column: str = "time",
    dropna: bool = False,
) -> None:
    """
    Catch linear and non-linear correlations between all columns of the
    input data.
    """

    if input_dataframe.empty:
        logging.error("Input DataFrame is empty; nothing to correlate.")
        raise NoFramesInInputFile

    metadata = {
        "satellite_name": os.path.splitext(os.path.basename(output_graph_file))[
            0
        ]
    }
    config = None
    with Path(xcorr_configuration_file).open("r") as f:
        config = yaml.safe_load(f)

    xcorr = XCorr(metadata, config)
    xcorr.fit(normalize_dataframe(input_dataframe, index_column, dropna))

    output_graph_file = (
        output_graph_file or f"/tmp/polaris_graph_{xcorr.regressor}.yaml"
    )

    graph_data = create_graph_data(
        metadata["satellite_name"],
        xcorr.importances_map,
        config["graph"]["graph_link_threshold"],
    )
    save_to_yaml(graph_data, output_graph_file)


def normalize_dataframe(dataframe, index_column="time", dropna=False):
    if dropna:
        dataframe.dropna()
    dataframe.set_index(index_column)
    dataframe.drop(index_column, axis=1, inplace=True)

    return dataframe
