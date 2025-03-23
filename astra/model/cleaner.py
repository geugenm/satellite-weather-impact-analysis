import logging
from pandas import DataFrame


class Cleaner:
    @staticmethod
    def drop_constant_values(dataframe: DataFrame) -> DataFrame:
        variances = dataframe.var()

        constant_cols = variances[variances < 1e-10].index.tolist()

        if constant_cols:
            logging.info(
                f"dropping constant column(s): {', '.join(constant_cols)}"
            )
            return dataframe.drop(columns=constant_cols)

        return dataframe

    @staticmethod
    def drop_non_numeric_values(dataframe: DataFrame) -> DataFrame:
        return dataframe.select_dtypes(include=["number", "datetime"])
