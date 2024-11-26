import logging


class Cleaner:
    def __init__(self, metadata, cleaning_params):
        self._col_threshold = cleaning_params.col_max_na_percentage
        self._row_threshold = cleaning_params.row_max_na_percentage
        self._metadata = metadata

    def handle_missing_values(self, dataframe):
        dataframe = dataframe.loc[
            :, dataframe.isna().mean() < self._col_threshold / 100
        ]
        dataframe = dataframe.loc[
            dataframe.isna().mean(axis=1) < self._row_threshold / 100
        ]
        return dataframe.ffill().bfill()

    def drop_constant_values(self, dataframe):
        constants = [
            column
            for column, tag in self._metadata.get("analysis", {})
            .get("column_tags", {})
            .items()
            if tag == "constant"
        ]
        if constants:
            logging.info(f"Dropping constant column(s): {', '.join(constants)}")
            dataframe = dataframe.drop(columns=constants)
        return dataframe

    @staticmethod
    def drop_non_numeric_values(dataframe):
        return dataframe.select_dtypes(include=["number", "datetime"])
