import logging
import warnings
from typing import Dict, Any, List, Optional

import numpy as np
import pandas as pd
from mlflow import log_metric, log_param, log_params, start_run
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.ensemble import (
    AdaBoostRegressor,
    ExtraTreesRegressor,
    GradientBoostingRegressor,
    RandomForestRegressor,
)
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import GridSearchCV, KFold, train_test_split
from xgboost import XGBRegressor

from src.polaris.feature.cleaner import Cleaner

import mlflow.xgboost

mlflow.xgboost.autolog(model_format="json")

warnings.simplefilter(action="ignore", category=FutureWarning)
np.seterr(divide="ignore", invalid="ignore")


class XCorr(BaseEstimator, TransformerMixin):
    def __init__(
        self, dataset_metadata: Dict[str, Any], cross_correlation_params: Any
    ) -> None:
        """Initialize an XCorr object.

        :param dataset_metadata: The metadata of the dataset.
        :param cross_correlation_params: XCorr parameters.
        """
        self.models: List[Any] = []
        self._importances_map: Optional[pd.DataFrame] = None
        self._feature_cleaner = Cleaner(
            dataset_metadata, cross_correlation_params.dataset_cleaning_params
        )

        self.xcorr_params = {
            "random_state": cross_correlation_params.random_state,
            "test_size": cross_correlation_params.test_size,
            "gridsearch_scoring": cross_correlation_params.gridsearch_scoring,
            "gridsearch_n_splits": cross_correlation_params.gridsearch_n_splits,
            "feature_columns": dataset_metadata.get("analysis", {}).get(
                "feature_columns", []
            ),
        }

        # Set method based on parameters
        if cross_correlation_params.use_gridsearch:
            self.method = self.gridsearch
            self.mlf_logging = self.gridsearch_mlf_logging
        else:
            self.method = self.regression
            self.mlf_logging = self.regression_mlf_logging

        # Default regressor name if not provided
        if not cross_correlation_params.regressor_name:
            cross_correlation_params.regressor_name = "XGBoosting"

        self.model_params = {
            "current": cross_correlation_params.model_params,
            "cpu": cross_correlation_params.model_cpu_params,
            "regressor_name": cross_correlation_params.regressor_name,
        }

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
        self._importances_map = importances_map

    def fit(self, X: pd.DataFrame) -> None:
        """Train on a dataframe.

        The input dataframe will be split column by column considering each one as a prediction target.

        :param X: Input dataframe.
        :raises TypeError: If input data is not a DataFrame.
        """
        if not isinstance(X, pd.DataFrame):
            raise TypeError("Input data should be a DataFrame")

        if self.models:
            logging.warning("Models are already trained. Skipping re-training.")
            return

        logging.info("Clearing Data. Removing unnecessary columns")

        X = self._feature_cleaner.drop_constant_values(X)
        X = self._feature_cleaner.drop_non_numeric_values(X)
        X = self._feature_cleaner.handle_missing_values(X)

        logging.info("Starting training with %d columns in the dataset.", X.shape[1])

        self.reset_importance_map(X.columns)
        parameters = self.__build_parameters(X)

        self.mlf_logging()
        for column in parameters:
            logging.info(column)
            model_instance = self.method(
                X.drop([column], axis=1),
                X[column],
                self.model_params["current"],
            )
            self.models.append(model_instance)

    def transform(self) -> None:
        raise NotImplementedError

    def regression(
        self,
        df_in: pd.DataFrame,
        target_series: pd.Series,
        model_params: Dict[str, Any],
    ) -> XGBRegressor:
        """Fit a model to predict target_series with df_in features/columns.

        :param df_in: Input dataframe representing the context, predictors.
        :param target_series: pandas series of the target variable.
        :param model_params: Parameters for the XGB model.
        :return: A fitted XGBRegressor.
        """

        df_in_train, df_in_test, target_train, target_test = train_test_split(
            df_in,
            target_series,
            test_size=0.2,
            random_state=self.xcorr_params["random_state"],
        )

        regressors_dict = {
            "XGBoosting": XGBRegressor(**model_params),
            "RandomForest": RandomForestRegressor(),
            "AdaBoost": AdaBoostRegressor(),
            "ExtraTrees": ExtraTreesRegressor(),
            "GradientBoosting": GradientBoostingRegressor(),
        }

        regr_m = regressors_dict[self.regressor]

        regr_m.fit(df_in_train, target_train)

        target_series_predict = regr_m.predict(df_in_test)

        try:
            rmse = np.sqrt(mean_squared_error(target_test, target_series_predict))
            log_metric(str(target_series.name) + "_rmse", rmse)

            logging.info(
                "Root Mean Square Error for '%s' : %s", target_series.name, str(rmse)
            )

        except Exception as e:
            logging.error(
                "Cannot find RMS Error for '%s' due to error: %s",
                target_series.name,
                str(e),
            )

        # Log feature importances
        new_row = {
            column: [feat_imp]
            for column, feat_imp in zip(df_in.columns, regr_m.feature_importances_)
        }

        # Add current target manually to new_row
        new_row[target_series.name] = [0.0]

        # Sort new_row to avoid concatenation warnings and update importance map if necessary
        new_row = dict(sorted(new_row.items()))

        if self._importances_map is not None:
            self._importances_map = pd.concat(
                [
                    self._importances_map,
                    pd.DataFrame(index=[target_series.name], data=new_row),
                ]
            )

        return regr_m

    def gridsearch(
        self, df_in: pd.DataFrame, target_series: pd.Series, params: Dict[str, Any]
    ) -> XGBRegressor:
        """Apply grid search to fine-tune XGBoost hyperparameters.

        :param df_in: Input dataframe representing the context, predictors.
        :param target_series: Pandas series of the target variable.
        :param params: The hyperparameters to use on the gridsearch method.
        :raises TypeError: If df_in is not Pandas DataFrame.
        :return: A fitted XGBRegressor.
        """

        if not isinstance(df_in, pd.DataFrame):
            logging.error(
                "Expected %s got %s for df_in in gridsearch",
                pd.DataFrame.__name__,
                type(df_in).__name__,
            )
            raise TypeError("Input data should be a DataFrame")

        random_state = self.xcorr_params["random_state"]

        kfolds = KFold(
            n_splits=self.xcorr_params["gridsearch_n_splits"],
            shuffle=True,
            random_state=random_state,
        )

        regr_m = XGBRegressor(random_state=random_state, tree_method="auto", n_jobs=-1)

        gs_regr = GridSearchCV(
            estimator=regr_m,
            param_grid=params,
            cv=kfolds,
            scoring=self.xcorr_params["gridsearch_scoring"],
            n_jobs=-1,
            verbose=1,
        )

        gs_regr.fit(df_in, target_series)

        log_param(str(target_series.name) + "_best_estimator", gs_regr.best_params_)

        logging.info(
            "%s best estimator : %s", target_series.name, str(gs_regr.best_estimator_)
        )

        return self.regression(df_in, target_series, gs_regr.best_params_)

    def reset_importance_map(self, columns: pd.Index) -> None:
        self._importances_map = self._importances_map or pd.DataFrame(columns=columns)

    def common_mlf_logging(self) -> None:
        log_params(
            {"Test size": self.xcorr_params["test_size"], "Model": "XGBRegressor"}
        )

    def gridsearch_mlf_logging(self) -> None:
        log_params(
            {
                "Gridsearch scoring": self.xcorr_params["gridsearch_scoring"],
                "Gridsearch parameters": str(self.model_params),
            }
        )
        self.common_mlf_logging()

    def regression_mlf_logging(self) -> None:
        self.common_mlf_logging()
        log_params(self.model_params)

    def __build_parameters(self, X: pd.DataFrame) -> List[str]:
        """Remove features only from being predicted.

        :param X: The dataset.
        :return: List of remaining features that are not removed.
        """
        if not self.xcorr_params["feature_columns"]:
            return list(X.columns)

        logging.info(
            "Removing features from the parameters : %s",
            str(self.xcorr_params["feature_columns"]),
        )

        feature_to_remove = set(self.xcorr_params["feature_columns"])

        return [x for x in list(X.columns) if x not in feature_to_remove]
