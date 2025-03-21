import logging
import threading
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import Any, Optional, Tuple

import numpy as np
import pandas as pd
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
from sklearn.model_selection import train_test_split

# Thread-safe logging
log_lock = threading.RLock()

# Try to import GPU libraries, fall back to CPU if not available
try:
    import cupy as cp
    import cudf
    from cuml.ensemble import RandomForestRegressor as cuRandomForestRegressor
    from cuml.ensemble import (
        GradientBoostingRegressor as cuGradientBoostingRegressor,
    )
    from cuml.metrics import mean_squared_error as cu_mean_squared_error
    from cuml.metrics import r2_score as cu_r2_score
    from cuml.model_selection import train_test_split as cu_train_test_split

    GPU_AVAILABLE = True
except ImportError:
    # Fall back to CPU libraries
    import xgboost as xgb
    from sklearn.ensemble import (
        RandomForestRegressor,
        GradientBoostingRegressor,
        AdaBoostRegressor,
        ExtraTreesRegressor,
    )

    GPU_AVAILABLE = False

from astra.model.cleaner import Cleaner


class XCorr(BaseEstimator, TransformerMixin):
    def __init__(
        self,
        dataset_metadata: dict[str, Any],
        cross_correlation_params: dict,
    ) -> None:
        self.models = []
        self._importances_map = None
        self._importances_lock = threading.Lock()
        self._feature_cleaner = Cleaner(
            dataset_metadata,
            cross_correlation_params["dataset_cleaning_params"],
        )

        # Store parameters directly
        self.random_state = cross_correlation_params["random_state"]
        self.test_size = cross_correlation_params["test_size"]
        self.feature_columns = dataset_metadata.get("analysis", {}).get(
            "feature_columns", []
        )
        self.model_params = cross_correlation_params["model_params"]
        self.regressor_name = cross_correlation_params.get(
            "regressor_name", "RandomForest"
        )
        self.use_gpu = GPU_AVAILABLE and cross_correlation_params.get(
            "use_gpu", True
        )

        # Configure model dictionary based on available hardware
        if self.use_gpu:
            self._model_dict = {
                "RandomForest": cuRandomForestRegressor,
                "GradientBoosting": cuGradientBoostingRegressor,
            }
            logging.info("using gpu acceleration for model training")
        else:
            self._model_dict = {
                "XGBoosting": xgb.XGBRegressor,
                "RandomForest": RandomForestRegressor,
                "AdaBoost": AdaBoostRegressor,
                "ExtraTrees": ExtraTreesRegressor,
                "GradientBoosting": GradientBoostingRegressor,
            }
            logging.info("using cpu for model training")

    @property
    def importances_map(self) -> Optional[pd.DataFrame]:
        return self._importances_map

    def fit(self, x_dataframe: pd.DataFrame) -> None:
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        # Clean data in one pass
        x_dataframe = self._clean_dataframe(x_dataframe)
        logging.info(f"training with {x_dataframe.shape[1]} features")

        # Convert to GPU DataFrame if using GPU
        if self.use_gpu:
            try:
                x_dataframe = cudf.DataFrame.from_pandas(x_dataframe)
                logging.info("data successfully transferred to gpu")
            except Exception as e:
                logging.warning(
                    f"failed to transfer data to gpu: {e}, falling back to cpu"
                )
                self.use_gpu = False
                # Recreate model dictionary for CPU
                self._model_dict = {
                    "XGBoosting": xgb.XGBRegressor,
                    "RandomForest": RandomForestRegressor,
                    "AdaBoost": AdaBoostRegressor,
                    "ExtraTrees": ExtraTreesRegressor,
                    "GradientBoosting": GradientBoostingRegressor,
                }

        # Prepare columns
        self.reset_importance_map(x_dataframe.columns)
        columns_to_process = self._get_columns_to_process(x_dataframe)

        # Train models sequentially
        for column in columns_to_process:
            logging.info(f"training model for '{column}'")
            model_instance = self._train_model(
                x_dataframe.drop(column, axis=1), x_dataframe[column]
            )
            self.models.append(model_instance)

    def experimental_fit_parallel(
        self, x_dataframe: pd.DataFrame, max_workers: int = None
    ) -> None:
        if self.models:
            logging.warning("models already trained. skipping re-training.")
            return

        # Clean data in one pass
        x_dataframe = self._clean_dataframe(x_dataframe)
        logging.info(f"training with {x_dataframe.shape[1]} features")

        # Convert to GPU DataFrame if using GPU
        if self.use_gpu:
            try:
                x_dataframe = cudf.DataFrame.from_pandas(x_dataframe)
                logging.info("data successfully transferred to gpu")
            except Exception as e:
                logging.warning(
                    f"failed to transfer data to gpu: {e}, falling back to cpu"
                )
                self.use_gpu = False
                # Recreate model dictionary for CPU
                self._model_dict = {
                    "XGBoosting": xgb.XGBRegressor,
                    "RandomForest": RandomForestRegressor,
                    "AdaBoost": AdaBoostRegressor,
                    "ExtraTrees": ExtraTreesRegressor,
                    "GradientBoosting": GradientBoostingRegressor,
                }

        # Prepare columns
        self.reset_importance_map(x_dataframe.columns)
        columns_to_process = self._get_columns_to_process(x_dataframe)

        # Determine optimal worker count
        max_workers = (
            max_workers or 4
        )  # Default to 4 workers for GPU to avoid memory issues
        logging.info(f"using {max_workers} parallel workers for model training")

        # Thread-safe collection
        models_lock = threading.Lock()
        self.models = []

        # Train models in parallel
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

    def _clean_dataframe(self, df: pd.DataFrame) -> pd.DataFrame:
        """Clean dataframe in one pass to avoid redundant operations."""
        logging.info("cleaning data...")
        df = self._feature_cleaner.drop_constant_values(df)
        df = self._feature_cleaner.drop_non_numeric_values(df)
        return self._feature_cleaner.handle_missing_values(df)

    def _get_columns_to_process(self, df) -> list[str]:
        """Get columns to process based on feature_columns setting."""
        columns = (
            df.columns.to_pandas()
            if hasattr(df.columns, "to_pandas")
            else df.columns
        )
        if self.feature_columns:
            logging.info(f"removing features: {self.feature_columns}")
            return [col for col in columns if col not in self.feature_columns]
        return list(columns)

    def _train_model_worker(
        self, df, column: str
    ) -> Tuple[Any, str, Optional[str]]:
        """Worker function for parallel training."""
        try:
            return (
                self._train_model(df.drop(column, axis=1), df[column]),
                column,
                None,
            )
        except Exception as e:
            return None, column, str(e)

    def _train_model(
        self, df_in: pd.DataFrame, target_series: pd.Series
    ) -> Any:
        """Train a single model with the given data."""
        # Split data
        df_in_train, df_in_test, target_train, target_test = train_test_split(
            df_in,
            target_series,
            test_size=self.test_size,
            random_state=self.random_state,
        )

        # Configure model parameters
        local_model_params = self.model_params.copy()

        # If using XGBoost with GPU
        if self.regressor_name == "XGBoosting":
            # Add GPU parameters
            local_model_params["tree_method"] = "hist"
            if "nthread" not in local_model_params:
                local_model_params["nthread"] = 2

        # Create and train model
        model_class = self._model_dict[self.regressor_name]
        regressor = (
            model_class(**local_model_params)
            if self.regressor_name == "XGBoosting"
            else model_class()
        )

        # Train the model
        regressor.fit(df_in_train, target_train)

        # For prediction, ensure data is on the same device
        target_predict = regressor.predict(df_in_test)
        target_name = str(target_series.name)

        # Log metrics
        self._log_metrics(target_test, target_predict, target_name)
        self._log_feature_importances(
            df_in, regressor.feature_importances_, target_name
        )

        return regressor

    def _log_metrics(
        self, target_test, target_predict, target_name: str
    ) -> None:
        """Log all metrics in one function to reduce code duplication."""
        try:
            # Calculate metrics
            if self.use_gpu:
                rmse = cp.sqrt(
                    cu_mean_squared_error(target_test, target_predict)
                )
                r2 = cu_r2_score(target_test, target_predict)
                # Convert to numpy for logging
                rmse = rmse.item() if hasattr(rmse, "item") else float(rmse)
                r2 = r2.item() if hasattr(r2, "item") else float(r2)
                # MAE not available in cuML, skip it
                mae = 0.0
            else:
                rmse = np.sqrt(mean_squared_error(target_test, target_predict))
                mae = mean_absolute_error(target_test, target_predict)
                r2 = r2_score(target_test, target_predict)

            # Log to console
            logging.info(
                f"metrics for '{target_name}': rmse={rmse:.4f}, r²={r2:.4f}"
            )
        except Exception as e:
            logging.error(f"failed to log metrics for {target_name}: {e}")

    def reset_importance_map(self, columns) -> None:
        with self._importances_lock:
            # Convert GPU columns to pandas if needed
            if hasattr(columns, "to_pandas"):
                columns = columns.to_pandas()
            self._importances_map = pd.DataFrame(columns=columns)

    def _log_feature_importances(
        self, df_in, feature_importances, target_name: str
    ) -> None:
        try:
            # Convert columns to pandas if using GPU
            columns = (
                df_in.columns.to_pandas()
                if hasattr(df_in.columns, "to_pandas")
                else df_in.columns
            )

            # Convert feature importances to numpy if on GPU
            if self.use_gpu and hasattr(feature_importances, "get"):
                feature_importances = cp.asnumpy(feature_importances)

            imp_df = pd.DataFrame(
                {**dict(zip(columns, feature_importances)), target_name: 0},
                index=[target_name],
            )
            imp_df.dropna(axis=1, how="all", inplace=True)

            with self._importances_lock:
                if self._importances_map is not None:
                    self._importances_map.dropna(
                        axis=1, how="all", inplace=True
                    )
                    self._importances_map = pd.concat(
                        [self._importances_map, imp_df]
                    )
        except Exception as e:
            logging.error(
                f"failed to log feature importances for {target_name}: {e}"
            )
