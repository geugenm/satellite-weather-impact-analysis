"""Module for cleaning data
"""

import logging

LOGGER = logging.getLogger(__name__)


# pylint: disable=R0903
class Cleaner:
    """Class for cleaning features.
    """
    def __init__(self, metadata, cleaning_params):
        # in percent, maximum na rows in a column
        self._col_threshold = cleaning_params.col_max_na_percentage
        # in percent, maximum na columns in a row
        self._row_threshold = cleaning_params.row_max_na_percentage
        self._metadata = metadata

    def handle_missing_values(self, dataframe):
        """Preprocess data to remove unnecessary rows and columns (filled with
        nan)

        :param dataframe: Dataframe that needs to be preprocessed
        :type dataframe: pd.DataFrame
        :return: Preprocessed Dataframe
        :rtype: pd.DataFrame
        """
        initial_shape = dataframe.shape

        # Dropping columns first so that frames without necessary columns
        # of data are removed.
        # Remove columns not satisfying criteria
        count_na_col = dataframe.isna().sum()
        count_na_col = count_na_col * (100 / dataframe.shape[0])
        dataframe = dataframe.loc[:, count_na_col < self._col_threshold]

        # Remove rows not satisfying criteria
        count_na_row = dataframe.isna().sum(axis=1)
        count_na_row = count_na_row * (100 / dataframe.shape[1])
        dataframe = dataframe.loc[count_na_row < self._row_threshold, :]

        # ffill will fill all but the first set of nans
        # bfill will fill the first set of nans
        # (if nans are present in the first few rows)
        # Fill nans with nearest value
        dataframe = dataframe.fillna(method="ffill")
        dataframe = dataframe.fillna(method="bfill")

        final_shape = dataframe.shape

        LOGGER.debug("Initial Shape: %s, Final Shape: %s", initial_shape,
                     final_shape)

        return dataframe

    def drop_constant_values(self, dataframe):
        """Preprocess data to remove columns with
        constant values

        :param dataframe: Dataframe that needs to be preprocessed
        :type dataframe: pd.DataFrame
        :return: Preprocessed Dataframe
        :rtype: pd.DataFrame
        """
        if 'analysis' in self._metadata:
            constants = [
                column for column, tag in self._metadata['analysis']
                ['column_tags'].items() if tag == "constant"
            ]

            LOGGER.info('Dropping constant column(s) : %s',
                        ','.join(constants))

            return dataframe.drop(constants, axis=1)

        return dataframe

    @staticmethod
    def drop_non_numeric_values(dataframe):
        """Preprocess data to remove non numeric columns

        :param dataframe: Dataframe that needs to be preprocessed
        :type dataframe: pd.DataFrame
        :return: Preprocessed Dataframe
        :rtype: pd.DataFrame
        """

        return dataframe.select_dtypes(include=['number', 'datetime'])
