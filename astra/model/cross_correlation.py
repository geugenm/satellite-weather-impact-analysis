import logging
import multiprocessing
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Any, Optional, Tuple

import mlflow.xgboost
import numpy as np
import pandas as pd
from mlflow import log_metric, log_params
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

logging = logging.getLogger(__name__)


class XCorr(BaseEstimator, TransformerMixin):
    def __init__(
        self,
        dataset_metadata: dict[str, Any],
        cross_correlation_params: dict,
    ) -> None:
        self.models = []
        self._importances_map = None
        self._importances_lock = threading.Lock()

        log_params(cross_correlation_params["model_params"])

        self.random_state = cross_correlation_params["random_state"]
        self.test_size = cross_correlation_params["test_size"]
        self.feature_columns = dataset_metadata.get("analysis", {}).get(
            "feature_columns", []
        )
        self.model_params = cross_correlation_params["model_params"]
        self.regressor_name = (
            cross_correlation_params["regressor_name"] or "XGBoosting"
        )

        self._model_dict = {
            "XGBoosting": XGBRegressor,
            "RandomForest": RandomForestRegressor,
            "AdaBoost": AdaBoostRegressor,
            "ExtraTrees": ExtraTreesRegressor,
            "GradientBoosting": GradientBoostingRegressor,
        }

    @property
    def importances_map(self) -> Optional[pd.DataFrame]:
        return self._importances_map

    def fit(self, x_dataframe: pd.DataFrame) -> None:
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        logging.info(f"training with {x_dataframe.shape[1]} features.")

        mlflow.xgboost.autolog(model_format="json")
        self.reset_importance_map(x_dataframe.columns)
        columns_to_process = self._get_columns_to_process(x_dataframe)

        for column in columns_to_process:
            logging.info(f"training model for '{column}'")
            model_instance = self._train_model(
                x_dataframe.drop([column], axis=1), x_dataframe[column]
            )
            self.models.append(model_instance)

    def experimental_fit_parallel(
        self, x_dataframe: pd.DataFrame, max_workers: int = 0
    ) -> None:
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        logging.info(f"training with {x_dataframe.shape[1]} features.")

        self.reset_importance_map(x_dataframe.columns)
        columns_to_process = self._get_columns_to_process(x_dataframe)

        max_workers = max_workers or max(1, multiprocessing.cpu_count() - 1)
        logging.info(f"using {max_workers} parallel workers for model training")

        models_lock = threading.Lock()
        self.models = []

        with ThreadPoolExecutor(max_workers=max_workers) as executor:
            future_to_column = {
                executor.submit(self._train_model_worker, x_dataframe, col): col
                for col in columns_to_process
            }

            for future in as_completed(future_to_column):
                column = future_to_column[future]
                try:
                    model, col, error = future.result()
                    if model is not None:
                        with models_lock:
                            self.models.append(model)
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

    def _get_columns_to_process(self, df: pd.DataFrame) -> list[str]:
        if self.feature_columns:
            logging.info(f"removing features: {self.feature_columns}")
            return [
                col for col in df.columns if col not in self.feature_columns
            ]
        return list(df.columns)

    def _train_model_worker(
        self, df: pd.DataFrame, column: str
    ) -> Tuple[Any, str, Optional[str]]:
        try:
            return (
                self._train_model(df.drop([column], axis=1), df[column]),
                column,
                None,
            )
        except Exception as e:
            return None, column, str(e)

    def _train_model(
        self, df_in: pd.DataFrame, target_series: pd.Series
    ) -> Any:
        # Split data
        df_in_train, df_in_test, target_train, target_test = train_test_split(
            df_in,
            target_series,
            test_size=self.test_size,
            random_state=self.random_state,
        )

        local_model_params = self.model_params.copy()
        if (
            self.regressor_name == "XGBoosting"
            and "nthread" not in local_model_params
        ):
            local_model_params["nthread"] = 2

        model_class = self._model_dict[self.regressor_name]
        regressor = (
            model_class(**local_model_params)
            if self.regressor_name == "XGBoosting"
            else model_class()
        )
        regressor.fit(df_in_train, target_train)

        target_predict = regressor.predict(df_in_test)
        target_name = str(target_series.name)

        self._log_metrics(target_test, target_predict, target_name)
        self._log_feature_importances(
            df_in, regressor.feature_importances_, target_name
        )

        return regressor

    def _log_metrics(
        self,
        target_test: pd.Series,
        target_predict: np.ndarray,
        target_name: str,
    ) -> None:
        try:
            rmse = np.sqrt(mean_squared_error(target_test, target_predict))
            mae = mean_absolute_error(target_test, target_predict)
            r2 = r2_score(target_test, target_predict)

            log_metric(f"{target_name}_rmse", rmse)
            log_metric(f"{target_name}_mae", mae)
            log_metric(f"{target_name}_r2", r2)

            logging.info(
                f"metrics for '{target_name}': rmse={rmse:.4f}, mae={mae:.4f}, r²={r2:.4f}"
            )
        except Exception as e:
            logging.error(f"failed to log metrics for {target_name}: {e}")

    def reset_importance_map(self, columns: pd.Index) -> None:
        with self._importances_lock:
            self._importances_map = pd.DataFrame(columns=columns)

    def _log_feature_importances(
        self,
        df_in: pd.DataFrame,
        feature_importances: np.ndarray,
        target_name: str,
    ) -> None:
        imp_df = pd.DataFrame(
            {**dict(zip(df_in.columns, feature_importances)), target_name: 0},
            index=[target_name],
        ).dropna(axis=1, how="all")

        with self._importances_lock:
            if self._importances_map is not None:
                self._importances_map = pd.concat(
                    [self._importances_map.dropna(axis=1, how="all"), imp_df]
                )
            else:
                self._importances_map = imp_df
