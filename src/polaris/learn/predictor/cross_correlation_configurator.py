import json
import logging
import warnings
from typing import Any

import GPUtil

from src.polaris.feature.cleaner_configurator import CleanerConfigurator
from src.polaris.feature.cleaner_parameters import CleanerParameters
from src.polaris.learn.predictor.cross_correlation_parameters import (
    CrossCorrelationParameters,
)

warnings.simplefilter(action="ignore", category=FutureWarning)


class CrossCorrelationConfigurator:
    MODEL_CPU_PARAMS = {
        "objective": "reg:squarederror",
        "n_estimators": 80,
        "learning_rate": 0.1,
        "n_jobs": -1,
        "tree_method": "auto",
        "max_depth": 8,
    }

    def __init__(
        self, xcorr_configuration_file=None, use_gridsearch=False, force_cpu=False
    ):
        """Initialize model configuration

        :param xcorr_configuration_file: XCorr configuration file path,
            defaults to None
        :type xcorr_configuration_file: str, optional
        :param use_gridsearch: Use grid search for the cross correlation.
            If this is set to False, then it will just use regression.
            Defaults to False
        :type use_gridsearch: bool, optional
        :param force_cpu: Force CPU for cross correlation, defaults
            to False
        :type force_cpu: bool, optional
        """
        self._xcorr_configuration_file = xcorr_configuration_file
        self._use_gridsearch = use_gridsearch
        self._force_cpu = force_cpu
        self._cross_correlation_parameters = CrossCorrelationParameters()

    def get_configuration(self):
        """Turn XCorr configuration file to XCorr parameters

        :return: If there is an XCorr configuration file, the parameters
            for the XCorr configuration are returned. Otherwise, the
            default XCorr parameters are returned
        :rtype: CrossCorrelationParameters
        """
        if self._xcorr_configuration_file is not None:
            self._get_configuration_from_file(self._xcorr_configuration_file)

            return self._cross_correlation_parameters

        self._cross_correlation_parameters.use_gridsearch = self._use_gridsearch
        self._set_default_xcorr_parameters()
        self._set_default_xcorr_model_cpu_parameters()
        self._cross_correlation_parameters.model_params = (
            self._default_xcorr_model_parameters()
        )
        feature_cleaner_configurator = CleanerConfigurator()
        self._cross_correlation_parameters.dataset_cleaning_params = (
            feature_cleaner_configurator.get_configuration()
        )

        self._cross_correlation_parameters.regressor_name = "XGBoosting"

        return self._cross_correlation_parameters

    def _set_default_xcorr_parameters(self):
        self._cross_correlation_parameters.random_state = 42
        self._cross_correlation_parameters.test_size = 0.2
        self._cross_correlation_parameters.gridsearch_scoring = "neg_mean_squared_error"
        # The split number was obtained through trial-and-error,
        # it should be reviewed in the future to adapt to
        # the targeted satellite.
        self._cross_correlation_parameters.gridsearch_n_splits = 18

    def _set_default_xcorr_model_cpu_parameters(self):
        self._cross_correlation_parameters.model_cpu_params = self.MODEL_CPU_PARAMS

    # pylint: disable-msg=too-many-branches
    def _default_xcorr_model_parameters(self):
        """Set default XCorr model params if no XCorr
        configuration file path is given. The default initial
        model parameters will adjust based on whether your use_gridsearch is True or False

        :return: XCorr model parameters
        :rtype: dict
        """
        if self._use_gridsearch:
            logging.info("Using gridsearch parameters")
            return self._set_cpu_parameters(
                {
                    "objective": ["reg:squarederror"],
                    "n_estimators": [50, 100, 300],
                    "learning_rate": [0.005, 0.05, 0.1, 0.2],
                    "max_depth": [3, 5, 8, 15],
                }
            )

        logging.info("Plain old gridsearch parameters")
        return self._set_cpu_parameters(
            {
                "objective": "reg:squarederror",
                "n_estimators": 80,
                "learning_rate": 0.1,
                "n_jobs": -1,
                "max_depth": 8,
            }
        )

    def _set_cpu_parameters(self, model_params: dict[str, any]) -> dict[str, any]:
        """
        Configure model parameters based on the chosen compute strategy (CPU/GPU).

        :param model_params: The XCorr model parameters.
        :type model_params: dict
        :return: Updated XCorr model parameters.
        :rtype: dict
        """
        if not self._force_cpu:
            try:
                gpu_ids = GPUtil.getAvailable()
                if gpu_ids:
                    logging.info(
                        "gpus detected: '%s'. Using first by default.", gpu_ids
                    )

                    gpu_params = {
                        "tree_method": (
                            "gpu_hist" if not self._use_gridsearch else ["gpu_hist"]
                        ),
                        "gpu_id": (
                            gpu_ids[0] if not self._use_gridsearch else [gpu_ids[0]]
                        ),
                    }
                    return model_params | gpu_params
            except ValueError:
                logging.warning(
                    "GPU requested but not detected. Ensure the proper drivers are installed."
                )

        logging.info("No GPU detected! Adding CPU parameters.")
        cpu_params = {
            "tree_method": "approx" if not self._use_gridsearch else ["approx"],
            "n_jobs": -1 if not self._use_gridsearch else [-1],
        }
        return model_params | cpu_params

    def _get_configuration_from_file(self, path):
        """Read custom config from file.

        :raises Exception: If the custom configuration file
            failed to load
        """
        logging.info("Using custom configuration from file: '%s'", path)
        try:
            with open(path, "r") as json_file:
                json_data = json.load(json_file)

            self._set_custom_configuration(**json_data)
        except Exception as exception_error:
            logging.exception(exception_error)
            raise exception_error

    def _set_custom_configuration(
        self,
        use_gridsearch: bool,
        random_state: int,
        test_size: float,
        gridsearch_scoring: str,
        gridsearch_n_splits: int,
        model_params: dict[str, Any],
        model_cpu_params: dict[str, Any],
        dataset_cleaning_params: CleanerParameters,
    ) -> None:
        """Set all the cross_correlation_parameters properties.

        :param use_gridsearch: Use grid search for the cross correlation
        :type use_gridsearch: bool
        :param random_state: Random number seed
        :type random_state: int
        :param test_size: How much test size split as a floating point
            number between 0.0 and 1.0
        :type test_size: float
        :param gridsearch_scoring: Scoring function for grid search.
            See scikit-learn.org/stable/src.polarismodel_evaluation.html
            for predefined values
        :type gridsearch_scoring: str
        :param gridsearch_n_splits: Number of folds for the K-Folds
            cross-validator
        :type gridsearch_n_splits: int
        :param model_params: XCorr model parameters
        :type model_params: dict
        :param model_cpu_params: XCorr model parameters (for CPU)
        :type model_cpu_params: dict
        :param dataset_cleaning_params: Dataset feature cleaning parameters
        :type dataset_cleaning_params: CleanerParameters
        :raises TypeError: If model_params is not a Python dictionary
            or if there is one value in model_params that is not a
            Python list
        """
        self._cross_correlation_parameters.use_gridsearch = use_gridsearch
        self._cross_correlation_parameters.random_state = random_state
        self._cross_correlation_parameters.test_size = test_size
        self._cross_correlation_parameters.gridsearch_scoring = gridsearch_scoring
        self._cross_correlation_parameters.gridsearch_n_splits = gridsearch_n_splits

        if not isinstance(model_params, dict):
            raise TypeError("Expected {} got {}".format(dict, type(model_params)))

        if use_gridsearch:
            for param in model_params.keys():
                if not isinstance(model_params[param], list):
                    raise TypeError(
                        "Expected {} got {} for key {}".format(
                            list, type(model_params[param]), param
                        )
                    )

        model_params = self._set_cpu_parameters(model_params)

        self._cross_correlation_parameters.model_params = model_params
        self._cross_correlation_parameters.model_cpu_params = model_cpu_params

        feature_cleaner_configurator = CleanerConfigurator(dataset_cleaning_params)

        self._cross_correlation_parameters.dataset_cleaning_params = (
            feature_cleaner_configurator.get_configuration()
        )

        self._cross_correlation_parameters.regressor_name = "XGBoosting"
