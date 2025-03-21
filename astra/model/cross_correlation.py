import logging
import multiprocessing
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Any, Optional, Tuple

import mlflow.xgboost
import numpy as np
import pandas as pd
from mlflow import log_metric, log_param, log_params
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.ensemble import (
    AdaBoostRegressor,
    ExtraTreesRegressor,
    GradientBoostingRegressor,
    RandomForestRegressor,
)
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
from xgboost import XGBRegressor

from astra.model.cleaner import Cleaner

# Thread-safe MLflow logging
mlflow_lock = threading.RLock()


class XCorr(BaseEstimator, TransformerMixin):
    def __init__(
        self,
        dataset_metadata: dict[str, Any],
        cross_correlation_params: dict,
    ) -> None:
        self.models: list[Any] = []
        self._importances_map: Optional[pd.DataFrame] = None
        self._importances_lock = threading.Lock()
        self._feature_cleaner = Cleaner(
            dataset_metadata,
            cross_correlation_params["dataset_cleaning_params"],
        )

        with mlflow_lock:
            log_params(cross_correlation_params["model_params"])

        self.xcorr_params = {
            "random_state": cross_correlation_params["random_state"],
            "test_size": cross_correlation_params["test_size"],
            "feature_columns": dataset_metadata.get("analysis", {}).get(
                "feature_columns", []
            ),
        }
        self.model_params = {
            "current": cross_correlation_params["model_params"],
            "regressor_name": cross_correlation_params["regressor_name"]
            or "XGBoosting",
        }
        self.method, self.mlf_logging = (
            self.regression,
            self.regression_mlf_logging,
        )

    @property
    def regressor(self) -> str:
        return self.model_params["regressor_name"]

    @regressor.setter
    def regressor(self, regressor: str) -> None:
        self.model_params["regressor_name"] = regressor

    @property
    def importances_map(self) -> Optional[pd.DataFrame]:
        return self._importances_map

    @importances_map.setter
    def importances_map(self, importances_map: pd.DataFrame) -> None:
        with self._importances_lock:
            self._importances_map = importances_map

    def fit(self, x_dataframe: pd.DataFrame) -> None:
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        logging.info("cleaning data...")

        x_dataframe = self._feature_cleaner.drop_constant_values(x_dataframe)
        x_dataframe = self._feature_cleaner.drop_non_numeric_values(x_dataframe)
        x_dataframe = self._feature_cleaner.handle_missing_values(x_dataframe)

        logging.info(f"training with {x_dataframe.shape[1]} features.")
        mlflow.xgboost.autolog(model_format="json")
        self.reset_importance_map(x_dataframe.columns)
        parameters = self.__build_parameters(x_dataframe)

        for column in parameters:
            logging.info(f"training model for {column}")
            model_instance = self.method(
                df_in=x_dataframe.drop([column], axis=1),
                target_series=x_dataframe[column],
                model_params=self.model_params["current"],
            )
            self.models.append(model_instance)

    def experimental_fit_parallel(
        self, x_dataframe: pd.DataFrame, max_workers: int = None
    ) -> None:
        """Thread-safe parallel model training optimized for performance.

        Args:
            x_dataframe: DataFrame with features
            max_workers: Maximum number of worker threads (None for auto-selection)
        """
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        logging.info("cleaning data...")

        # Clean data (sequential preprocessing)
        x_dataframe = self._feature_cleaner.drop_constant_values(x_dataframe)
        x_dataframe = self._feature_cleaner.drop_non_numeric_values(x_dataframe)
        x_dataframe = self._feature_cleaner.handle_missing_values(x_dataframe)

        logging.info(f"training with {x_dataframe.shape[1]} features.")
        self.reset_importance_map(x_dataframe.columns)
        parameters = self.__build_parameters(x_dataframe)

        # Thread-safe collection for models
        models_lock = threading.Lock()
        self.models = []

        # Auto-determine optimal number of workers if not specified
        if max_workers is None:
            # Use slightly fewer threads than CPUs to avoid resource contention
            # This is better for GUI applications as it leaves resources for the UI
            max_workers = max(1, multiprocessing.cpu_count() - 1)

        logging.info(f"using {max_workers} parallel workers for model training")

        # Define worker function for a single model training task
        def train_model_for_column(
            column: str,
        ) -> Tuple[Any, str, Optional[str]]:
            try:
                logging.info(f"training model for '{column}'")
                df_without_column = x_dataframe.drop([column], axis=1)
                target = x_dataframe[column]

                model_instance = self.method(
                    df_in=df_without_column,
                    target_series=target,
                    model_params=self.model_params["current"],
                )

                # Success
                return model_instance, column, None
            except Exception as e:
                # Error handling
                error_msg = f"error training model for '{column}': {str(e)}"
                logging.error(error_msg)
                return None, column, error_msg

        # Use ThreadPoolExecutor for parallel training
        with ThreadPoolExecutor(max_workers=max_workers) as executor:
            # Submit all training tasks
            future_to_column = {
                executor.submit(train_model_for_column, col): col
                for col in parameters
            }

            # Process results as they complete
            for future in as_completed(future_to_column):
                column = future_to_column[future]
                try:
                    model, col, error = future.result()
                    if model is not None:
                        with models_lock:
                            self.models.append(model)
                        logging.info(f"model for '{col}' trained successfully")
                    else:
                        logging.error(
                            f"failed to train model for '{col}': {error}"
                        )
                except Exception as exc:
                    logging.error(
                        f"critical failure in model training for '{column}': {exc}"
                    )

        logging.info(
            f"parallel training completed. trained {len(self.models)} models"
        )

    def transform(self) -> None:
        raise NotImplementedError

    def regression(
        self,
        df_in: pd.DataFrame,
        target_series: pd.Series,
        model_params: dict[str, Any],
    ) -> XGBRegressor:
        df_in_train, df_in_test, target_train, target_test = train_test_split(
            df_in,
            target_series,
            test_size=0.2,
            random_state=self.xcorr_params["random_state"],
        )

        # For XGBoost, limit threads for better parallel scaling when in parallel mode
        local_model_params = model_params.copy()
        if (
            self.regressor == "XGBoosting"
            and "nthread" not in local_model_params
        ):
            # Use 2 threads per model to avoid oversubscription
            local_model_params["nthread"] = 2

        model_dict = {
            "XGBoosting": XGBRegressor(**local_model_params),
            "RandomForest": RandomForestRegressor(),
            "AdaBoost": AdaBoostRegressor(),
            "ExtraTrees": ExtraTreesRegressor(),
            "GradientBoosting": GradientBoostingRegressor(),
        }

        regressor = model_dict[self.regressor]
        regressor.fit(df_in_train, target_train)

        target_predict = regressor.predict(df_in_test)

        # Thread-safe metric logging
        self._log_rmse(target_test, target_predict, str(target_series.name))
        self._log_mae(target_test, target_predict, str(target_series.name))
        self._log_r2(target_test, target_predict, str(target_series.name))

        self._log_feature_importances(
            df_in, regressor.feature_importances_, str(target_series.name)
        )

        return regressor

    @staticmethod
    def _log_mae(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        try:
            mae = mean_absolute_error(target_test, target_predict)
            with mlflow_lock:
                log_metric(f"{target_name}_mae", mae)
            logging.info(f"mean absolute error for '{target_name}': {mae}")
        except Exception as e:
            logging.error(f"failed to log mae for {target_name}: {e}")

    @staticmethod
    def _log_r2(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        try:
            r2 = r2_score(target_test, target_predict)
            with mlflow_lock:
                log_metric(f"{target_name}_r2", r2)
            logging.info(f"r² score for '{target_name}': {r2}")
        except Exception as e:
            logging.error(f"failed to log r² for {target_name}: {e}")

    def reset_importance_map(self, columns: pd.Index) -> None:
        with self._importances_lock:
            if self._importances_map is None:
                self._importances_map = pd.DataFrame(columns=columns)

    def common_mlf_logging(self) -> None:
        with mlflow_lock:
            log_params(
                {
                    "Test size": self.xcorr_params["test_size"],
                    "Model": "XGBRegressor",
                }
            )

    def regression_mlf_logging(self) -> None:
        self.common_mlf_logging()
        with mlflow_lock:
            log_param("regressor_name", self.model_params["regressor_name"])

    def __build_parameters(self, x_dataframe: pd.DataFrame) -> list[str]:
        feature_columns = self.xcorr_params["feature_columns"]
        if feature_columns:
            logging.info(f"removing features: {feature_columns}")
            return [
                col for col in x_dataframe.columns if col not in feature_columns
            ]
        return list(x_dataframe.columns)

    @staticmethod
    def _log_rmse(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        rmse = np.sqrt(mean_squared_error(target_test, target_predict))
        with mlflow_lock:
            log_metric(f"{target_name}_rmse", rmse)
        logging.info(f"rmse for '{target_name}': {rmse}")

    def _log_feature_importances(
        self,
        df_in: pd.DataFrame,
        feature_importances: np.ndarray,
        target_name: str,
    ) -> None:
        imp_df = pd.DataFrame(
            {**dict(zip(df_in.columns, feature_importances)), target_name: 0},
            index=[target_name],
        )
        imp_df.dropna(axis=1, how="all", inplace=True)

        with self._importances_lock:
            self._importances_map.dropna(axis=1, how="all", inplace=True)
            self._importances_map = pd.concat([self._importances_map, imp_df])
