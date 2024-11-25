import logging
import warnings
from src.polaris.feature.cleaner_parameters import CleanerParameters

LOGGER = logging.getLogger(__name__)
warnings.simplefilter(action="ignore", category=FutureWarning)


class CleanerConfigurator:
    def __init__(self, json_configuration=None):
        self._json_configuration = json_configuration
        self._feature_cleaner_parameters = CleanerParameters()

    def get_configuration(self):
        if self._json_configuration:
            self._set_custom_configuration(**self._json_configuration)
        else:
            self._set_default_cleaner_parameters()
        return self._feature_cleaner_parameters

    def _set_default_cleaner_parameters(self):
        LOGGER.info(
            "Default thresholds used for dataset na values (col:30%% row:60%%)!"
        )
        self._set_cleaner_parameters(30, 60)

    def _set_custom_configuration(self, col_max_na_percentage, row_max_na_percentage):
        LOGGER.info(
            "Custom thresholds used for dataset na values (col:%s%% row:%s%%)!",
            col_max_na_percentage,
            row_max_na_percentage,
        )
        self._set_cleaner_parameters(col_max_na_percentage, row_max_na_percentage)

    def _set_cleaner_parameters(self, col_max_na_percentage, row_max_na_percentage):
        self._feature_cleaner_parameters.col_max_na_percentage = col_max_na_percentage
        self._feature_cleaner_parameters.row_max_na_percentage = row_max_na_percentage
