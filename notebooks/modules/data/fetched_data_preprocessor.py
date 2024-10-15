"""
Tagging module
"""
import numpy as np


# pylint: disable=R0903
class FetchedDataPreProcessor:
    """Class for tagging dataset columns
    """
    def __init__(self):
        # variable that defines the limit under
        # which a column will be tagged containing status
        # or variable values
        self.__status_limit_percentage = 1
        self.__analysis = {}
        self.__analysis['feature_columns'] = None

    def tag_columns(self, dataset):
        """
            Run the columns tagging process

            :param dataset: Polaris dataset on which the tagging will
            be applied
            :return: Dictionary containing the tagging results:
            '{"column_tags": {"col 1":"variable", "col 2":"constant"}}'
        """
        self.__analysis['column_tags'] = {}
        dataframe = dataset.to_pandas_dataframe()
        total_frames = dataset.metadata['total_frames']

        for column in dataframe.columns:
            unique = dataframe[column].nunique()
            column_type = dataframe.dtypes[column]
            has_unit = False
            if column in dataset.frames[0]['fields']:
                has_unit = dataset.frames[0]['fields'][column][
                    'unit'] is not None
            tag = self.__compute_tag(unique, total_frames, has_unit,
                                     column_type)
            self.__analysis['column_tags'][column] = tag

    def add_columns_in_feature_list(self, columns_names):
        """
            Add columns as feature.

            :param columns_names: List of names to add to
            the feature list.
        """
        if not isinstance(columns_names, list):
            raise ValueError("columns_names should be a list")

        if self.__analysis['feature_columns'] is None:
            self.__analysis['feature_columns'] = columns_names
        else:
            self.__analysis['feature_columns'].extend(columns_names)

    def __compute_tag(self, unique, total_frames, has_unit, column_type):
        """
            Compute a tagging value regarding the provided parameters.

            :param unique: The number of unique values in the column.
            :total_frames: The total number of frames in the dataset.
            :has_unit: Is the column contains a unit.
            :column_type: The object type of the column.
            :return: A tag value (constant/variable/status)
        """
        if unique == 1:
            return "constant"

        if has_unit:
            return "variable"

        if (unique / total_frames * 100 <
                self.__status_limit_percentage) and column_type == np.int64:
            return "status"

        return "variable"

    @property
    def analysis(self):
        """
        Return the analysis value as dict.

        """

        return self.__analysis
