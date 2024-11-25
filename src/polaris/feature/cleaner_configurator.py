"""Module for CleanerConfigurator class
"""

import logging
import warnings

from src.polaris.feature.cleaner_parameters import CleanerParameters

LOGGER = logging.getLogger(__name__)
warnings.simplefilter(action="ignore", category=FutureWarning)


# pylint: disable=too-few-public-methods
class CleanerConfigurator:
    """Class for model used in cleaner"""

    def __init__(self, json_configuration=None):
        """Initialize model configuration"""
        self._json_configuration = json_configuration
        self._feature_cleaner_parameters = CleanerParameters()

    def get_configuration(self):
        """Build the configuration"""
        if self._json_configuration is not None:
            self._set_custom_configuration(**self._json_configuration)

            return self._feature_cleaner_parameters

        self._set_default_cleaner_parameters()

        return self._feature_cleaner_parameters

    def _set_default_cleaner_parameters(self):
        LOGGER.info(
            " ".join(
                ["Default thresholds used for dataset na values (col:30% row:60%)!"]
            )
        )
        self._feature_cleaner_parameters.col_max_na_percentage = 30
        self._feature_cleaner_parameters.row_max_na_percentage = 60

    def _set_custom_configuration(self, col_max_na_percentage, row_max_na_percentage):
        """
        Set all the feature_cleaner_parameters properties.

        """
        LOGGER.info(
            "Custom thresholds used for dataset na values \
                (col:%s%% row:%s%%)!",
            col_max_na_percentage,
            row_max_na_percentage,
        )
        self._feature_cleaner_parameters.col_max_na_percentage = col_max_na_percentage
        self._feature_cleaner_parameters.row_max_na_percentage = row_max_na_percentage
