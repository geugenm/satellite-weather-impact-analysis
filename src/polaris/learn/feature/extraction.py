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
    data_file, transformers, features_file=None, target_column=None, time_unit=None
):
    """Utility to extract best features out of a set of set of transformers.
    It is a progressive (iterative) features extraction that would select
    the best features created out of each set of transformers.

    :param datafile: File/Stream path to input data.
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

    # Selecting target data and preparing the predictors
    data_target = None
    if target_column is not None:
        data_target = data[target_column]
        data = data.drop(target_column, axis=1)
    else:
        data_target = data[data.columns[0]]
        data = data.drop(data.columns[0], axis=1)

    # Loading an additional files of features
    data_features = None
    if features_file is not None:
        data_features = pd.read_csv(features_file, index_col=[0])
        data_features.index = pd.to_datetime(
            data_features.index, unit=time_unit)

    # Joining all features related data
    if data_features is None:
        data_features = data
    else:
        data_features = pd.concat([data, data_features], axis=1)

    # Preparing pipeline for extractiong of best features
    selector = FeatureImportanceOptimization(transformers)
    pipeline = Pipeline([("FeatureImportances", selector)])

    # Running the pipeline
    # NB: the method for best features selection is the default one.
    features_importances = pipeline.fit(data_features, data_target)

    return features_importances
