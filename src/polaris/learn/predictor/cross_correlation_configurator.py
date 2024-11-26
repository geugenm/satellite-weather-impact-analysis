import json
import logging
from typing import Any, Dict
import GPUtil
from src.polaris.feature.cleaner_configurator import CleanerConfigurator
from src.polaris.feature.cleaner_parameters import CleanerParameters
from src.polaris.learn.predictor.cross_correlation_parameters import (
    CrossCorrelationParameters,
)

logging.basicConfig(level=logging.INFO)


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
        self,
        xcorr_configuration_file: str = None,
        use_gridsearch: bool = False,
        force_cpu: bool = False,
    ):
        self._xcorr_configuration_file = xcorr_configuration_file
        self._use_gridsearch = use_gridsearch
        self._force_cpu = force_cpu
        self._cross_correlation_parameters = CrossCorrelationParameters()

    def get_configuration(self) -> CrossCorrelationParameters:
        if self._xcorr_configuration_file:
            self._load_configuration_from_file(self._xcorr_configuration_file)
        else:
            self._set_default_parameters()
        return self._cross_correlation_parameters

    def _set_default_parameters(self):
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

    def _set_default_xcorr_parameters(self):
        self._cross_correlation_parameters.random_state = 42
        self._cross_correlation_parameters.test_size = 0.2
        self._cross_correlation_parameters.gridsearch_scoring = "neg_mean_squared_error"
        self._cross_correlation_parameters.gridsearch_n_splits = 18

    def _set_default_xcorr_model_cpu_parameters(self):
        self._cross_correlation_parameters.model_cpu_params = self.MODEL_CPU_PARAMS

    def _default_xcorr_model_parameters(self) -> Dict[str, Any]:
        params = {
            "objective": "reg:squarederror",
            "n_estimators": 80,
            "learning_rate": 0.1,
            "n_jobs": -1,
            "max_depth": 8,
        }
        if self._use_gridsearch:
            params.update(
                {
                    "objective": ["reg:squarederror"],
                    "n_estimators": [50, 100, 300],
                    "learning_rate": [0.005, 0.05, 0.1, 0.2],
                    "max_depth": [3, 5, 8, 15],
                }
            )
        return self._set_cpu_parameters(params)

    def _set_cpu_parameters(self, model_params: Dict[str, Any]) -> Dict[str, Any]:
        if not self._force_cpu:
            try:
                gpu_ids = GPUtil.getAvailable()
                if gpu_ids:
                    logging.info(f"GPU detected: {gpu_ids[0]}. Using GPU.")
                    return {
                        **model_params,
                        "tree_method": "gpu_hist",
                        "gpu_id": gpu_ids[0],
                    }
            except ValueError:
                logging.warning(
                    "GPU requested but not detected. Ensure the proper drivers are installed."
                )
        logging.info("No GPU detected. Using CPU parameters.")
        return {**model_params, "tree_method": "approx", "n_jobs": -1}

    def _load_configuration_from_file(self, path: str):
        logging.info(f"Loading configuration from file: {path}")
        try:
            with open(path, "r") as f:
                config = json.load(f)
            self._set_custom_configuration(**config)
        except Exception as e:
            logging.exception(f"Failed to load configuration: {e}")
            raise

    def _set_custom_configuration(
        self,
        use_gridsearch: bool,
        random_state: int,
        test_size: float,
        gridsearch_scoring: str,
        gridsearch_n_splits: int,
        model_params: Dict[str, Any],
        model_cpu_params: Dict[str, Any],
        dataset_cleaning_params: CleanerParameters,
    ):
        self._cross_correlation_parameters.use_gridsearch = use_gridsearch
        self._cross_correlation_parameters.random_state = random_state
        self._cross_correlation_parameters.test_size = test_size
        self._cross_correlation_parameters.gridsearch_scoring = gridsearch_scoring
        self._cross_correlation_parameters.gridsearch_n_splits = gridsearch_n_splits
        self._cross_correlation_parameters.model_cpu_params = model_cpu_params
        self._cross_correlation_parameters.model_params = self._set_cpu_parameters(
            model_params
        )

        feature_cleaner_configurator = CleanerConfigurator(dataset_cleaning_params)
        self._cross_correlation_parameters.dataset_cleaning_params = (
            feature_cleaner_configurator.get_configuration()
        )

        self._cross_correlation_parameters.regressor_name = "XGBoosting"
