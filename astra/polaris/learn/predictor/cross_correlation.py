import logging
from typing import Optional
import numpy as np
import pandas as pd
from mlflow import log_metric, log_param, log_params
from scipy.stats import norm
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.ensemble import (
    AdaBoostRegressor,
    ExtraTreesRegressor,
    GradientBoostingRegressor,
    RandomForestRegressor,
)
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, r2_score
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split
import mlflow.xgboost
from xgboost import XGBRegressor
from astra.polaris.feature.cleaner import Cleaner
from astra.polaris.learn.predictor.cross_correlation_parameters import (
    CrossCorrelationParameters,
)
import plotly.express as px
import io

mlflow.xgboost.autolog(model_format="json")


class XCorr(BaseEstimator, TransformerMixin):
    def __init__(
        self,
        dataset_metadata: dict[str, any],
        cross_correlation_params: CrossCorrelationParameters,
    ) -> None:
        self.models: list[any] = []
        self.importances_map: Optional[pd.DataFrame] = None
        self._feature_cleaner = Cleaner(
            dataset_metadata, cross_correlation_params.dataset_cleaning_params
        )

        log_params(cross_correlation_params.model_params)
        self.xcorr_params = {
            "random_state": cross_correlation_params.random_state,
            "test_size": cross_correlation_params.test_size,
            "feature_columns": dataset_metadata.get("analysis", {}).get(
                "feature_columns", []
            ),
        }
        self.model_params = {
            "current": cross_correlation_params.model_params,
            "regressor_name": cross_correlation_params.regressor_name
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
        self._importances_map = importances_map

    def fit(self, x_dataframe: pd.DataFrame) -> None:
        if self.models:
            logging.warning("Models already trained. Skipping re-training.")
            return

        logging.info("Cleaning data...")
        x_dataframe = self._feature_cleaner.drop_constant_values(x_dataframe)
        x_dataframe = self._feature_cleaner.drop_non_numeric_values(x_dataframe)
        x_dataframe = self._feature_cleaner.handle_missing_values(x_dataframe)

        logging.info(f"Training with {x_dataframe.shape[1]} features.")
        self.reset_importance_map(x_dataframe.columns)
        parameters = self.__build_parameters(x_dataframe)

        for column in parameters:
            logging.info(f"Training model for {column}")
            model_instance = self.method(
                df_in=x_dataframe.drop([column], axis=1),
                target_series=x_dataframe[column],
                model_params=self.model_params["current"],
            )
            self.models.append(model_instance)

    def transform(self) -> None:
        raise NotImplementedError

    def regression(
        self,
        df_in: pd.DataFrame,
        target_series: pd.Series,
        model_params: dict[str, any],
    ) -> XGBRegressor:
        df_in_train, df_in_test, target_train, target_test = train_test_split(
            df_in,
            target_series,
            test_size=0.2,
            random_state=self.xcorr_params["random_state"],
        )

        model_dict = {
            "XGBoosting": XGBRegressor(**model_params),
            "RandomForest": RandomForestRegressor(),
            "AdaBoost": AdaBoostRegressor(),
            "ExtraTrees": ExtraTreesRegressor(),
            "GradientBoosting": GradientBoostingRegressor(),
        }

        regressor = model_dict[self.regressor]
        regressor.fit(df_in_train, target_train)

        target_predict = regressor.predict(df_in_test)

        self._log_rmse(target_test, target_predict, str(target_series.name))
        self._log_mae(target_test, target_predict, str(target_series.name))
        self._log_r2(target_test, target_predict, str(target_series.name))

        self._log_feature_importances(
            df_in, regressor.feature_importances_, str(target_series.name)
        )

        # Calculate residuals
        residuals = target_test - target_predict
        residuals_df = pd.DataFrame(
            {
                "Actual": target_test,
                "Predicted": target_predict,
                "Residuals": residuals,
            }
        )

        # 1. Residuals vs Actual Plot with trend line and horizontal zero line
        fig = px.scatter(
            residuals_df, x="Actual", y="Residuals", title="Residuals vs Actual"
        )

        # Adding zero line and trend line
        fig.add_shape(
            type="line",
            x0=min(target_test),
            y0=0,
            x1=max(target_test),
            y1=0,
            line=dict(color="black", dash="dash"),
        )
        # Add a trend line using linear regression
        trend_line = LinearRegression().fit(
            target_test.values.reshape(-1, 1), residuals.values
        )
        trend_y = trend_line.predict(target_test.values.reshape(-1, 1))
        fig.add_scatter(
            x=target_test,
            y=trend_y,
            mode="lines",
            name="Trend Line",
            line=dict(color="red", dash="solid"),
        )

        # Update layout for better clarity
        fig.update_layout(
            xaxis_title="Actual Values",
            yaxis_title="Residuals",
            showlegend=True,
            height=500,
            margin=dict(l=40, r=40, b=40, t=40),
            font=dict(family="Arial", size=12, color="black"),
        )

        mlflow.log_figure(fig, "plots/residuals.html")

        # 2. Prediction vs Actual Plot with Line of Identity and trend line
        prediction_vs_actual_fig = px.scatter(
            residuals_df,
            x="Actual",
            y="Predicted",
            title="Prediction vs Actual",
        )

        # Adding line of identity (45-degree line)
        fig_identity = np.linspace(min(target_test), max(target_test), 100)
        prediction_vs_actual_fig.add_scatter(
            x=fig_identity,
            y=fig_identity,
            mode="lines",
            name="Line of Identity",
            line=dict(color="green", dash="dash"),
        )

        # Adding trend line to prediction vs actual plot
        trend_line_actual_vs_pred = LinearRegression().fit(
            target_test.values.reshape(-1, 1), target_predict
        )
        trend_y_actual_vs_pred = trend_line_actual_vs_pred.predict(
            target_test.values.reshape(-1, 1)
        )
        prediction_vs_actual_fig.add_scatter(
            x=target_test,
            y=trend_y_actual_vs_pred,
            mode="lines",
            name="Trend Line",
            line=dict(color="blue", dash="solid"),
        )

        # Update layout for better clarity
        prediction_vs_actual_fig.update_layout(
            xaxis_title="Actual Values",
            yaxis_title="Predicted Values",
            showlegend=True,
            height=500,
            margin=dict(l=40, r=40, b=40, t=40),
            font=dict(family="Arial", size=12, color="black"),
        )

        mlflow.log_figure(
            prediction_vs_actual_fig, "plots/prediction_vs_actual.html"
        )

        # 3. Residuals Distribution Plot with mean and std lines
        mean_residuals = np.mean(residuals)
        std_residuals = np.std(residuals)

        # Plotting histogram of residuals
        residuals_dist_fig = px.histogram(
            residuals_df,
            x="Residuals",
            nbins=50,
            title="Residuals Distribution",
        )

        # Adding mean and standard deviation lines
        residuals_dist_fig.add_vline(
            x=mean_residuals,
            line=dict(color="blue", dash="dash"),
            annotation_text="Mean",
            annotation_position="top left",
        )
        residuals_dist_fig.add_vline(
            x=mean_residuals + std_residuals,
            line=dict(color="red", dash="dot"),
            annotation_text="+1 STD",
            annotation_position="top left",
        )
        residuals_dist_fig.add_vline(
            x=mean_residuals - std_residuals,
            line=dict(color="red", dash="dot"),
            annotation_text="-1 STD",
            annotation_position="top left",
        )

        # Adding the normal distribution curve
        x_range = np.linspace(
            min(residuals_df["Residuals"]), max(residuals_df["Residuals"]), 100
        )
        y_norm = (
            norm.pdf(x_range, mean_residuals, std_residuals)
            * len(residuals_df)
            * (x_range[1] - x_range[0])
        )  # Adjust for histogram area
        residuals_dist_fig.add_scatter(
            x=x_range,
            y=y_norm,
            mode="lines",
            name="Normal Distribution",
            line=dict(color="red", width=2),
        )

        # Update layout for better clarity
        residuals_dist_fig.update_layout(
            xaxis_title="Residuals",
            yaxis_title="Frequency",
            showlegend=True,
            height=500,
            margin=dict(l=40, r=40, b=40, t=40),
            font=dict(family="Arial", size=12, color="black"),
        )

        # Log the figure to MLflow
        mlflow.log_figure(
            residuals_dist_fig, "plots/residuals_distribution.html"
        )

        # 4. Feature Importance Plot
        if hasattr(regressor, "feature_importances_"):
            feature_importances = pd.DataFrame(
                {
                    "Feature": df_in.columns,
                    "Importance": regressor.feature_importances_,
                }
            )
            feature_importances_fig = px.bar(
                feature_importances,
                x="Feature",
                y="Importance",
                title="Feature Importances",
            )

            # Update layout for better clarity
            feature_importances_fig.update_layout(
                xaxis_title="Features",
                yaxis_title="Importance",
                showlegend=False,
                height=500,
                margin=dict(l=40, r=40, b=40, t=40),
                font=dict(family="Arial", size=12, color="black"),
            )
            mlflow.log_figure(
                feature_importances_fig, "plots/feature_importances.html"
            )

        return regressor

    @staticmethod
    def _log_mae(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        try:
            mae = mean_absolute_error(target_test, target_predict)
            log_metric(f"{target_name}_mae", mae)
            logging.info(f"Mean Absolute Error for '{target_name}': {mae}")
        except Exception as e:
            logging.error(f"Failed to log MAE for {target_name}: {e}")

    @staticmethod
    def _log_r2(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        try:
            r2 = r2_score(target_test, target_predict)
            log_metric(f"{target_name}_r2", r2)
            logging.info(f"R² Score for '{target_name}': {r2}")
        except Exception as e:
            logging.error(f"Failed to log R² for {target_name}: {e}")

    def reset_importance_map(self, columns: pd.Index) -> None:
        if self.importances_map is None:
            self.importances_map = pd.DataFrame(columns=columns)

    def common_mlf_logging(self) -> None:
        log_params(
            {
                "Test size": self.xcorr_params["test_size"],
                "Model": "XGBRegressor",
            }
        )

    def regression_mlf_logging(self) -> None:
        self.common_mlf_logging()
        log_param("regressor_name", self.model_params["regressor_name"])

    def __build_parameters(self, x_dataframe: pd.DataFrame) -> list[str]:
        feature_columns = self.xcorr_params["feature_columns"]
        if feature_columns:
            logging.info(f"Removing features: {feature_columns}")
            return [
                col for col in x_dataframe.columns if col not in feature_columns
            ]
        return list(x_dataframe.columns)

    @staticmethod
    def _log_rmse(
        target_test: pd.Series, target_predict: np.ndarray, target_name: str
    ) -> None:
        rmse = np.sqrt(mean_squared_error(target_test, target_predict))
        log_metric(f"{target_name}_rmse", rmse)
        logging.info(f"RMSE for '{target_name}': {rmse}")

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

        if not imp_df.empty and self.importances_map is not None:
            self.importances_map = pd.concat([self.importances_map, imp_df])
