"""
Cross Correlation module
"""

import logging
import warnings

import enlighten
import numpy as np
import pandas as pd

# Used for tracking ML process results
from mlflow import log_metric, log_param, log_params, start_run

# Used for the pipeline interface of scikit learn
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.ensemble import (
    AdaBoostRegressor,
    ExtraTreesRegressor,
    GradientBoostingRegressor,
    RandomForestRegressor,
)
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import GridSearchCV, KFold, train_test_split

# eXtreme Gradient Boost algorithm
from xgboost import XGBRegressor

from modules.feature.cleaner import Cleaner

LOGGER = logging.getLogger(__name__)
warnings.simplefilter(action="ignore", category=FutureWarning)
# Remove this line when feature engineering is in place
np.seterr(divide="ignore", invalid="ignore")


class XCorr(BaseEstimator, TransformerMixin):
    """Cross Correlation predictor class"""

    def __init__(self, dataset_metadata, cross_correlation_params):
        """Initialize an XCorr object

        :param dataset_metadata: The metadata of the dataset
        :type dataset_metadata: PolarisMetadata
        :param cross_correlation_params: XCorr parameters
        :type cross_correlation_params: CrossCorrelationParameters
        """
        self.models = None
        self._importances_map = None
        self._feature_cleaner = Cleaner(
            dataset_metadata, cross_correlation_params.dataset_cleaning_params
        )
        self.xcorr_params = {
            "random_state": cross_correlation_params.random_state,
            "test_size": cross_correlation_params.test_size,
            "gridsearch_scoring": cross_correlation_params.gridsearch_scoring,
            "gridsearch_n_splits": cross_correlation_params.gridsearch_n_splits,
        }
        # If we're importing from CSV, the dataset_metadata may not
        # have the feature_columns key.
        try:
            self.xcorr_params["feature_columns"] = dataset_metadata["analysis"][
                "feature_columns"
            ]
        except KeyError:
            LOGGER.info("No feature_columns entry in metatdata, setting to empty array")
            self.xcorr_params["feature_columns"] = []

        if cross_correlation_params.use_gridsearch:
            self.method = self.gridsearch
            self.mlf_logging = self.gridsearch_mlf_logging
        else:
            self.method = self.regression
            self.mlf_logging = self.regression_mlf_logging

        if cross_correlation_params.regressor_name == "":
            cross_correlation_params.regressor_name = "XGBoosting"

        self.model_params = {
            "current": cross_correlation_params.model_params,
            "cpu": cross_correlation_params.model_cpu_params,
            "regressor_name": cross_correlation_params.regressor_name,
        }

    @property
    def regressor(self):
        """
        Return the regressor name value as str.

        """

        return self.model_params["regressor_name"]

    @regressor.setter
    def regressor(self, regressor):
        self.model_params["regressor_name"] = regressor

    @property
    def importances_map(self):
        """
        Return the importances_map value as Pandas Dataframe.

        """

        return self._importances_map

    @importances_map.setter
    def importances_map(self, importances_map):
        self._importances_map = importances_map

    def fit(self, X):
        """Train on a dataframe

        The input dataframe will be split column by column
        considering each one as a prediction target.

        :param X: Input dataframe
        :type X: pd.DataFrame
        :raises Exception: If encountered any unhandled error
            during model fitting
        """
        if not isinstance(X, pd.DataFrame):
            raise TypeError("Input data should be a DataFrame")

        if self.models is None:
            self.models = []

        manager = enlighten.get_manager()

        LOGGER.info("Clearing Data. Removing unnecessary columns")
        X = self._feature_cleaner.drop_constant_values(X)
        X = self._feature_cleaner.drop_non_numeric_values(X)
        X = self._feature_cleaner.handle_missing_values(X)

        self.reset_importance_map(X.columns)

        parameters = self.__build_parameters(X)

        pbar = manager.counter(total=len(parameters), desc="Columns", unit="columns")

        with start_run(run_name="cross_correlate", nested=True):
            self.mlf_logging()
            for column in parameters:
                LOGGER.info(column)
                self.models.append(
                    self.method(
                        X.drop([column], axis=1),
                        X[column],
                        self.model_params["current"],
                    )
                )
                pbar.update()

    def transform(self):
        """Unused method in this predictor"""
        return self

    def regression(self, df_in, target_series, model_params):
        """Fit a model to predict target_series with df_in features/columns
        and retain the features importances in the dependency matrix.

        :param df_in: Input dataframe representing the context, predictors
        :type df_in: pd.DataFrame
        :param target_series: pandas series of the target variable. Share
            the same indexes as the df_in dataframe
        :type target_series: pd.Series
        :param model_params: Parameters for the XGB model
        :type model_params: dict
        :return: A fitted XGBRegressor
        :rtype: XGBRegressor
        """
        # Split df_in and target to train and test dataset
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

        # Make predictions
        target_series_predict = regr_m.predict(df_in_test)

        try:
            rmse = np.sqrt(mean_squared_error(target_test, target_series_predict))
            log_metric(target_series.name, rmse)
            LOGGER.info("Making predictions for : %s", target_series.name)
            LOGGER.info("Root Mean Square Error : %s", str(rmse))
        except Exception:  # pylint: disable-msg=broad-except
            # Because of large (close to infinite values) or nans
            LOGGER.error("Cannot find RMS Error for %s", target_series.name)
            LOGGER.debug(
                "Expected %s, Predicted %s",
                str(target_test),
                str(target_series_predict),
            )

        # indices = np.argsort(regr_m.feature_importances_)[::-1]
        # After the model is trained
        new_row = {}
        for column, feat_imp in zip(df_in.columns, regr_m.feature_importances_):
            new_row[column] = [feat_imp]

        # Current target is not in df_in, so manually adding it
        new_row[target_series.name] = [0.0]

        # Sorting new_row to avoid concatenation warnings
        new_row = dict(sorted(new_row.items()))

        # Concatenating new information about feature importances
        if self._importances_map is not None:
            self._importances_map = pd.concat(
                [
                    self._importances_map,
                    pd.DataFrame(index=[target_series.name], data=new_row),
                ]
            )
        return regr_m

    def gridsearch(self, df_in, target_series, params):
        """Apply grid search to fine-tune XGBoost hyperparameters
        and then call the regression method with the best grid
        search parameters.

        :param df_in: Input dataframe representing the context, predictors
        :type df_in: pd.DataFrame
        :param target_series: Pandas series of the target variable. Share
            the same indexes as the df_in dataframe
        :type target_series: pd.Series
        :param params: The hyperparameters to use on the gridsearch
            method
        :type params: dict
        :raises TypeError: If df_in is not Pandas DataFrame
        :return: A fitted XGBRegressor
        :rtype: XGBRegressor
        """
        if not isinstance(df_in, pd.DataFrame):
            LOGGER.error(
                "Expected %s got %s for df_in in gridsearch", pd.DataFrame, type(df_in)
            )
            raise TypeError

        random_state = self.xcorr_params["random_state"]
        kfolds = KFold(
            n_splits=self.xcorr_params["gridsearch_n_splits"],
            shuffle=True,
            random_state=random_state,
        )
        regr_m = XGBRegressor(
            random_state=random_state,
            tree_method="auto",
            n_jobs=-1,
        )

        gs_regr = GridSearchCV(
            estimator=regr_m,
            param_grid=params,
            cv=kfolds,
            scoring=self.xcorr_params["gridsearch_scoring"],
            n_jobs=-1,
            verbose=1,
        )
        gs_regr.fit(df_in, target_series)

        log_param(target_series.name + " best estimator", gs_regr.best_params_)
        LOGGER.info(
            "%s best estimator : %s", target_series.name, str(gs_regr.best_estimator_)
        )
        return self.regression(df_in, target_series, gs_regr.best_params_)

    def reset_importance_map(self, columns):
        """
        Creating an empty importance map

        :param columns: List of column names for the importance map
        :rtype columns: pd.Index or array-like
        """
        if self._importances_map is None:
            self._importances_map = pd.DataFrame(data={}, columns=columns)

    def common_mlf_logging(self):
        """Log the parameters used for gridsearch and regression
        in mlflow
        """
        log_param("Test size", self.xcorr_params["test_size"])
        log_param("Model", "XGBRegressor")

    def gridsearch_mlf_logging(self):
        """Log the parameters used for gridsearch
        in mlflow
        """
        log_param("Gridsearch scoring", self.xcorr_params["gridsearch_scoring"])
        log_param("Gridsearch parameters", self.model_params)
        self.common_mlf_logging()

    def regression_mlf_logging(self):
        """Log the parameters used for regression
        in mlflow.
        """
        self.common_mlf_logging()
        log_params(self.model_params)

    def __build_parameters(self, X):
        """Remove features only from
        being predicted.

        :param X: The dataset
        :type X: pd.DataFrame
        :return: List of remaining features that are not removed
        :rtype: list
        """
        if self.xcorr_params["feature_columns"] is None:
            return list(X.columns)

        LOGGER.info(
            "Removing features from the parameters : %s",
            self.xcorr_params["feature_columns"],
        )
        feature_to_remove = set(self.xcorr_params["feature_columns"])

        return [x for x in list(X.columns) if x not in feature_to_remove]
