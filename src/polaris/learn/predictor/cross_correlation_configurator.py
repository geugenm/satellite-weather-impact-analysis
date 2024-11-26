import json
import logging
from typing import Any, Dict
import GPUtil
from src.polaris.feature.cleaner_configurator import CleanerConfigurator
from src.polaris.feature.cleaner_parameters import CleanerParameters
from src.polaris.learn.predictor.cross_correlation_parameters import (
    CrossCorrelationParameters,
)


class CrossCorrelationConfigurator:
    def __init__(
        self,
        xcorr_configuration_file: str = None,
        force_cpu: bool = False,
    ):
        self._xcorr_configuration_file = xcorr_configuration_file
        self._force_cpu = force_cpu
        self._cross_correlation_parameters = CrossCorrelationParameters()

    def get_configuration(self) -> CrossCorrelationParameters:
        if self._xcorr_configuration_file:
            self._load_configuration_from_file(self._xcorr_configuration_file)
        else:
            raise ValueError(
                "No configuration file provided. Please provide a configuration file."
            )

        return self._cross_correlation_parameters

    def _set_cpu_parameters(self, model_params: Dict[str, Any]) -> Dict[
        str, Any]:
        if not self._force_cpu:
            try:
                gpu_ids = GPUtil.getAvailable()
                if gpu_ids:
                    logging.info(f"GPU detected: {gpu_ids[0]}. Using GPU.")
                    return {
                        **model_params,
                        # "tree_method": "gpu_hist",
                        # "gpu_id": gpu_ids[0],
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
        random_state: int,
        test_size: float,
        model_params: Dict[str, Any],
        dataset_cleaning_params: CleanerParameters,
    ):
        self._cross_correlation_parameters.random_state = random_state
        self._cross_correlation_parameters.test_size = test_size
        self._cross_correlation_parameters.model_params = self._set_cpu_parameters(
            model_params
        )

        feature_cleaner_configurator = CleanerConfigurator(
            dataset_cleaning_params)
        self._cross_correlation_parameters.dataset_cleaning_params = (
            feature_cleaner_configurator.get_configuration()
        )

        self._cross_correlation_parameters.regressor_name = "XGBoosting"
