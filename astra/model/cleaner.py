import logging


class Cleaner:
    def __init__(self, metadata, cleaning_params):
        self._col_threshold = cleaning_params["col_max_na_percentage"] / 100
        self._row_threshold = cleaning_params["row_max_na_percentage"] / 100
        self._metadata = metadata
        self._constants = None

    def handle_missing_values(self, dataframe):
        col_na_ratio = dataframe.isna().mean()
        valid_cols = col_na_ratio < self._col_threshold

        filtered_df = dataframe.loc[:, valid_cols]

        row_na_ratio = filtered_df.isna().mean(axis=1)
        filtered_df = filtered_df.loc[row_na_ratio < self._row_threshold]

        return filtered_df.ffill().bfill()

    def drop_constant_values(self, dataframe):
        if self._constants is None:
            self._constants = [
                column
                for column, tag in self._metadata.get("analysis", {})
                .get("column_tags", {})
                .items()
                if tag == "constant"
            ]

        if self._constants:
            cols_to_drop = [
                col for col in self._constants if col in dataframe.columns
            ]
            if cols_to_drop:
                logging.info(
                    f"dropping constant column(s): {', '.join(cols_to_drop)}"
                )
                return dataframe.drop(columns=cols_to_drop)

        return dataframe

    @staticmethod
    def drop_non_numeric_values(dataframe):
        return dataframe.select_dtypes(include=["number", "datetime"])
