from pathlib import Path

import numpy as np
import pandas as pd
import yaml

from astra.model.cross_correlation import XCorr
from astra.model.data_model import SatelliteGraphData


def _create_graph_data(satellite_name: str, heatmap, threshold: float) -> dict:
    """Transform heatmap matrix into optimized graph structure"""
    return {
        "satellite": satellite_name,
        "links": [
            {"source": src, "target": tgt, "coefficient": float(val)}
            for src, targets in heatmap.items()
            for tgt, val in targets.items()
            if tgt != src and not np.isnan(val) and val >= threshold
        ],
        "graph_link_threshold": threshold,
    }


def cross_correlate(
    xcorr_configuration_file: Path,
    input_dataframe: pd.DataFrame,
    index_column: str,
    enable_experimental_parallelism: bool,
) -> dict:
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

    if enable_experimental_parallelism:
        import os

        workers_count = os.cpu_count() or 4
        xcorr.experimental_fit_parallel(input_dataframe, workers_count)
    else:
        xcorr.fit(input_dataframe)

    return SatelliteGraphData(
        **_create_graph_data(
            metadata["satellite_name"],
            xcorr.importances_map,
            config["graph"]["graph_link_threshold"],
        )
    ).model_dump()
