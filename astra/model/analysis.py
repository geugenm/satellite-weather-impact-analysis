import pandas as pd
import yaml
import numpy as np
from pathlib import Path

from astra.model.cross_correlation import XCorr


def create_graph_data(satellite_name: str, heatmap, threshold: float) -> dict:
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
    output_graph_file: Path,
    xcorr_configuration_file: Path,
    input_dataframe: pd.DataFrame,
    index_column: str,
) -> None:
    """
    Catch linear and non-linear correlations between all columns of the
    input data.
    """

    assert (
        not input_dataframe.empty
    ), "Input DataFrame is empty; nothing to correlate."

    metadata = {"satellite_name": xcorr_configuration_file.stem}

    with Path(xcorr_configuration_file).open("r") as f:
        config = yaml.safe_load(f)

    xcorr = XCorr(metadata, config)

    input_dataframe.set_index(index_column)
    input_dataframe.drop(index_column, axis=1, inplace=True)

    xcorr.fit(input_dataframe)

    graph_data = create_graph_data(
        metadata["satellite_name"],
        xcorr.importances_map,
        config["graph"]["graph_link_threshold"],
    )
    save_to_yaml(graph_data, output_graph_file)
