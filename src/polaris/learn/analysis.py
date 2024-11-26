import logging
import os

from src.polaris.data.graph import PolarisGraph, PolarisMetadata

from src.polaris.learn.predictor.cross_correlation import XCorr
from src.polaris.learn.predictor.cross_correlation_configurator import (
    CrossCorrelationConfigurator,
)


class NoFramesInInputFile(Exception):
    pass


def cross_correlate(
    input_dataframe=None,
    output_graph_file=None,
    xcorr_configuration_file=None,
    graph_link_threshold=0.1,
    use_gridsearch=False,
    force_cpu=False,
    index_column="time",
    dropna=False,
):
    """
    Catch linear and non-linear correlations between all columns of the
    input data.
    """
    dataframe = input_dataframe

    if dataframe.empty:
        logging.error("Empty set of frames -- nothing to learn from!")
        raise NoFramesInInputFile

    xcorr_configurator = CrossCorrelationConfigurator(
        xcorr_configuration_file=xcorr_configuration_file,
        use_gridsearch=use_gridsearch,
        force_cpu=force_cpu,
    )

    # Reading input file - index is considered on first column
    metadata = PolarisMetadata(
        {"satellite_name": os.path.splitext(os.path.basename(output_graph_file))[0]}
    )
    xcorr = XCorr(metadata, xcorr_configurator.get_configuration())
    xcorr.fit(normalize_dataframe(dataframe, index_column, dropna))

    if output_graph_file is None:
        output_graph_file = "/tmp/polaris_graph_" + xcorr.regressor + ".json"
        logging.info(
            f"output_graph_file was not defined, saving graph to '{output_graph_file}'"
        )

    graph = PolarisGraph(satellite_name=metadata["satellite_name"])
    graph.from_heatmap(xcorr.importances_map, graph_link_threshold)
    with open(output_graph_file, "w") as graph_file:
        graph_file.write(graph.to_json())


def normalize_dataframe(dataframe, index_column="time", dropna=False):
    if dropna:
        dataframe.dropna()
    dataframe.index = dataframe[index_column]
    dataframe.drop(index_column, axis=1, inplace=True)

    return dataframe
