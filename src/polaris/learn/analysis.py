import logging
import os

import pandas as pd

from src.polaris.data.graph import PolarisGraph, PolarisMetadata

from src.polaris.learn.predictor.cross_correlation import XCorr
from src.polaris.learn.predictor.cross_correlation_configurator import (
    CrossCorrelationConfigurator,
)


class NoFramesInInputFile(Exception):
    pass


def cross_correlate(
    input_dataframe: pd.DataFrame,
    output_graph_file: str | None = None,
    xcorr_configuration_file: str | None = None,
    graph_link_threshold: float = 0.1,
    use_gridsearch: bool = False,
    force_cpu: bool = False,
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

    configurator = CrossCorrelationConfigurator(
        xcorr_configuration_file,
        use_gridsearch,
        force_cpu,
    )

    metadata = PolarisMetadata(
        {"satellite_name": os.path.splitext(os.path.basename(output_graph_file))[0]}
    )
    xcorr = XCorr(metadata, configurator.get_configuration())
    xcorr.fit(normalize_dataframe(input_dataframe, index_column, dropna))

    output_graph_file = (
        output_graph_file or f"/tmp/polaris_graph_{xcorr.regressor}.json"
    )

    graph = PolarisGraph(satellite_name=metadata["satellite_name"])
    graph.from_heatmap(xcorr.importances_map, graph_link_threshold)

    with open(output_graph_file, "w") as graph_file:
        graph_file.write(graph.to_json())


def normalize_dataframe(dataframe, index_column="time", dropna=False):
    if dropna:
        dataframe.dropna()
    dataframe.set_index(index_column)
    dataframe.drop(index_column, axis=1, inplace=True)

    return dataframe
