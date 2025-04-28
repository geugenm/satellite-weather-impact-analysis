from pathlib import Path

import numpy as np
import pandas as pd
import yaml

from astra.model.cross_correlation import XCorr
from astra.model.data_model import SatelliteGraphData


def cross_correlate(
    xcorr_configuration_file: Path,
    input_dataframe: pd.DataFrame,
    index_column: str,
    enable_experimental_parallelism: bool = False,
    use_mlflow: bool = True,
) -> dict:
    """
    Catch linear and non-linear correlations between columns

    Args:
        xcorr_configuration_file: Path to YAML configuration file
        input_dataframe: DataFrame containing time series data
        index_column: Name of the column to use as index
        enable_experimental_parallelism: Whether to use parallel processing

    Returns:
        dict: Serialized graph data with correlation links

    Raises:
        ValueError: If input dataframe is empty
    """
    if input_dataframe.empty:
        raise ValueError("input dataframe is empty; nothing to correlate")

    with open(xcorr_configuration_file) as f:
        config: dict = yaml.safe_load(f)

    satellite_name: str = xcorr_configuration_file.stem
    xcorr: XCorr = XCorr({"satellite_name": satellite_name}, config, use_mlflow)

    df: pd.DataFrame = input_dataframe.set_index(index_column).drop(
        index_column, axis=1, errors="ignore"
    )

    if enable_experimental_parallelism:
        from multiprocessing import cpu_count

        workers_count: int = cpu_count() or 4
        xcorr.experimental_fit_parallel(df, workers_count)
    else:
        xcorr.fit(df)

    threshold: float = config["graph"]["graph_link_threshold"]
    links: list = [
        {"source": src, "target": tgt, "coefficient": float(val)}
        for src, targets in xcorr.importances_map.items()
        for tgt, val in targets.items()
        if tgt != src and not np.isnan(val) and val >= threshold
    ]

    graph_data: dict = {
        "satellite": satellite_name,
        "links": links,
        "graph_link_threshold": threshold,
    }

    return SatelliteGraphData(**graph_data).model_dump()
