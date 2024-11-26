import logging
from src.polaris.feature.cleaner_parameters import CleanerParameters


class CleanerConfigurator:
    def __init__(self, json_configuration=None):
        self._json_configuration = json_configuration or {}
        self._feature_cleaner_parameters = CleanerParameters()

    def get_configuration(self):
        col_max_na_percentage = self._json_configuration.get(
            "col_max_na_percentage", 30
        )
        row_max_na_percentage = self._json_configuration.get(
            "row_max_na_percentage", 60
        )

        if self._json_configuration:
            logging.info(
                "Custom thresholds: col:%s%% row:%s%%",
                col_max_na_percentage,
                row_max_na_percentage,
            )
        else:
            logging.info("Default thresholds: col:30%% row:60%%")

        self._set_cleaner_parameters(col_max_na_percentage, row_max_na_percentage)
        return self._feature_cleaner_parameters

    def _set_cleaner_parameters(self, col_max_na_percentage, row_max_na_percentage):
        self._feature_cleaner_parameters.col_max_na_percentage = col_max_na_percentage
        self._feature_cleaner_parameters.row_max_na_percentage = row_max_na_percentage
