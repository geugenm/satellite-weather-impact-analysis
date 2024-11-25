import logging
import os

from fets.math import TSIntegrale
from mlflow import set_experiment

from src.polaris.data.graph import PolarisGraph
from src.polaris.dataset.metadata import PolarisMetadata
from src.polaris.learn.feature.extraction import (
    create_list_of_transformers,
    extract_best_features,
)
from src.polaris.learn.predictor.cross_correlation import XCorr
from src.polaris.learn.predictor.cross_correlation_configurator import (
    CrossCorrelationConfigurator,
)

LOGGER = logging.getLogger(__name__)


class NoFramesInInputFile(Exception):
    pass


def feature_extraction(input_file, param_col):
    """
    Start feature extraction using the given settings.

        :param input_file: Path of a CSV file that will be
            converted to a dataframe
        :type input_file: str
        :param param_col: Target column name
        :type param_col: str
    """
    # Create a small list of two transformers which will generate two
    # different pipelines
    transformers = create_list_of_transformers(["5min", "15min"], TSIntegrale)

    # Extract the best features of the two pipelines
    out = extract_best_features(
        input_file, transformers, target_column=param_col, time_unit="ms"
    )

    # out[0] is the FeatureImportanceOptimization object
    # from polaris.learn.feature.selection
    # pylint: disable=E1101
    print(out[0].best_features)


# pylint: disable-msg=too-many-arguments
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

        :param input_file: CSV or JSON file path that will be
            converted to a dataframe
        :type input_file: str
        :param index_column: column to set as index of the dataframe
            and then drop it.
        :type index_column: str, optional
        :param output_graph_file: Output file path for the generated graph.
            It will overwrite if the file already exists. Defaults to None,
            which is'/tmp/polaris_graph.json'
        :type output_graph_file: str, optional
        :param dropna: this function will perform a "drop NaN" action
            that will remove rows with NaN values from the dataframe.
        :type dropna: bool, optional
        :param xcorr_configuration_file: XCorr configuration file path,
            defaults to None. Refer to CrossCorrelationConfigurator for
            the default parameters
        :type xcorr_configuration_file: str, optional
        :param graph_link_threshold: Minimum link value to be considered
            as a link between two nodes
        :type graph_link_threshold: float, optional
        :param use_gridsearch: Use grid search for the cross correlation.
            If this is set to False, then it will just use regression.
            Defaults to False
        :type use_gridsearch: bool, optional
        :param force_cpu: Force CPU for cross corelation, defaults to False
        :type force_cpu: bool, optional
        :raises NoFramesInInputFile: If there are no frames in the converted
            dataframe
    """
    # Reading input file - index is considered on first column
    metadata = PolarisMetadata(
        {"satellite_name": os.path.splitext(
            os.path.basename(output_graph_file))[0]}
    )
    dataframe = input_dataframe

    if dataframe.empty:
        LOGGER.error("Empty set of frames -- nothing to learn from!")
        raise NoFramesInInputFile

    set_experiment(experiment_name=metadata["satellite_name"])

    xcorr_configurator = CrossCorrelationConfigurator(
        xcorr_configuration_file=xcorr_configuration_file,
        use_gridsearch=use_gridsearch,
        force_cpu=force_cpu,
    )

    # Creating and fitting cross-correlator
    xcorr = XCorr(metadata, xcorr_configurator.get_configuration())
    xcorr.fit(normalize_dataframe(dataframe, index_column, dropna))

    if output_graph_file is None:
        output_graph_file = "/tmp/polaris_graph_" + xcorr.regressor + ".json"

    graph = PolarisGraph(
        metadata=PolarisMetadata(
            {"satellite_name": metadata["satellite_name"]})
    )
    graph.from_heatmap(xcorr.importances_map, graph_link_threshold)
    with open(output_graph_file, "w") as graph_file:
        graph_file.write(graph.to_json())


def normalize_dataframe(dataframe, index_column="time", dropna=False):
    """
    Apply dataframe modification so it's compatible
    with the learn module. The index_column is first
    set as the index of the dataframe. Then, we drop
    the index_column.

    :param dataframe: The pandas dataframe to normalize
    :type dataframe: pd.DataFrame
    :param index_column: column to set as index of the dataframe
        and then drop it.
    :type index_column: str, optional
    :return: Pandas dataframe normalized
    :rtype: pd.DataFrame
    :param dropna: this function will perform a "drop NaN"
        action that will remove rows with NaN values from the dataframe.
    :type dropna: bool, optional
    """
    if dropna:
        dataframe.dropna()
    dataframe.index = dataframe[index_column]
    dataframe.drop(index_column, axis=1, inplace=True)

    return dataframe
