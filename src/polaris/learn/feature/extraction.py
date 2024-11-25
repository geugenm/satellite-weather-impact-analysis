"""
    Utilities to extract features.

    Selection from matrix of params and list of transformers to get the list of
    most important features.

    Flattening the features distribution using entropy augmentation
"""

import pandas as pd
from sklearn.pipeline import Pipeline

from src.polaris.learn.feature.selection import FeatureImportanceOptimization


def create_list_of_transformers(input_lags, transformer_class):
    """
    Utility function to get a list of transformers
    with one input parameters

    :param input_lags: input parameters of the transformer_class
    if fets.math.TSIntegrale is the class it takes only 1 parameter
    and a possibility is that:
        input_lags = ["0.25H", "0.5H", "1H", "3H", "6H", "12H", "24H"]
    """
    return [transformer_class(k) for k in input_lags]


def extract_best_features(
    data_file: str,
    transformers,
    features_file: str = None,
    target_column: str = None,
    time_unit: str = None,
):
    """Utility to extract best features out of a set of set of transformers.
    It is a progressive (iterative) features extraction that would select
    the best features created out of each set of transformers.

    :param data_file: File/Stream path to input data.
    index column defaults to [0]

    :param transformers: List of list of transformers. Iterable of
    Iterables. Each unit iterable is a transformation description which
    will generate a pipeline and feature importance analysis. Each unit
    iterable should be like:
     ("name", TranformerObject)
     or
     ("name", TranformerObject, "feature_column_name")

    :param target_column: Colmun name for which to analyze features
    importance.

    :param features_file: Before having a proper feature store, previous
    features might be given from a file. If the form:
     ("name", TranformerObject, "feature_column_name")
    is given then the "feature_column_name" will be used to directly get
    the associated column in that file.

    :param time_unit: Unit of the given time index. For instance "ms". No
    transformation will be made if None.

    :return: a list of the best features.
    """
    # Loading master file with sensory/telemetry data
    data = pd.read_csv(data_file, index_col=[0])

    if time_unit is not None:
        data.index = pd.to_datetime(data.index, unit=time_unit)

    target = data.pop(target_column) if target_column else data.iloc[:, 0]

    # Load additional feature data if provided
    features = pd.read_csv(features_file, index_col=0) if features_file else None
    if features is not None:
        features.index = pd.to_datetime(features.index, unit=time_unit)
        data = pd.concat([data, features], axis=1)

    # Initialize feature importance selector and pipeline
    selector = FeatureImportanceOptimization(transformers)
    pipeline = Pipeline([("FeatureImportances", selector)], memory=None)

    # Fit pipeline and return feature importances
    return pipeline.fit(data, target)
