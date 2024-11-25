import numpy as np
import pandas as pd
import xgboost as xgb
from collections.abc import Iterable
from sklearn.base import BaseEstimator, TransformerMixin
from sklearn.pipeline import Pipeline
from fets.pipeline import FeatureUnion2DF


class FeatureImportanceOptimization(BaseEstimator, TransformerMixin):
    """
    Flatten feature importance distribution using entropy augmentation.
    """

    default_xgb_params = {
        "learning_rate": 0.1,
        "gamma": 0,
        "max_depth": 10,
        "n_estimators": 100,
        "base_score": 0.5,
        "colsample_bylevel": 1,
        "colsample_bytree": 1,
        "max_delta_step": 0,
        "min_child_weight": 1,
        "missing": None,
        "nthread": 100,
        "objective": "reg:squarederror",
        "reg_alpha": 0,
        "reg_lambda": 1,
        "scale_pos_weight": 1,
        "seed": 0,
        "verbosity": 1,
        "subsample": 1,
        "tree_method": "auto",
    }

    def __init__(self, transformers):
        """Initialize with a list of transformers."""
        self.best_features = None
        self.pipelines = []
        self.models = []
        self.model_optinput = None
        self.build_pipelines(transformers)

    def build_pipelines(self, transformers):
        """Create pipelines from a list of scikit-learn compatible transformers."""
        if not transformers:
            return

        for transformer in transformers:
            pipeline_steps = (
                [
                    (f"T{hash(t)}", t)
                    for t in transformer
                    if isinstance(t, TransformerMixin)
                ]
                if isinstance(transformer, Iterable)
                else [("T0", transformer)]
            )

            if pipeline_steps:
                self.pipelines.append(
                    Pipeline([("union", FeatureUnion2DF(pipeline_steps))], memory=None)
                )

    @staticmethod
    def extract_feature_importance(columns, model):
        """Extract and return sorted feature importances from an XGBoost model."""
        return sorted(
            zip(columns, model.feature_importances_), key=lambda x: x[1], reverse=True
        )

    @staticmethod
    def find_gap(importances):
        """Find and return the index of the feature importance drop greater than 50% average."""
        importances = np.array([imp for _, imp in importances])
        gap_threshold = np.mean(importances) - np.std(importances)

        for idx, imp in enumerate(importances[1:], 1):
            if (
                importances[idx - 1] - imp > np.mean(importances) * 0.5
                or imp < gap_threshold
            ):
                return idx - 1
        return len(importances) - 1

    def filter_importances(self, importances_list, method="first_best"):
        """Filter and return the best features based on selected method."""
        chosen_features = []

        if not importances_list:
            return chosen_features

        if method == "first_best":
            for model_importances in importances_list:
                best_features = sorted(
                    model_importances, reverse=True, key=lambda x: x[1]
                )[: max(1, len(model_importances) // 4)]
                chosen_features.extend(best_features)

        elif method == "all_best":
            for model_importances in importances_list:
                chosen_features.append(
                    sorted(model_importances, reverse=True, key=lambda x: x[1])[0]
                )

        elif method == "best_until_threshold":
            for model_importances in importances_list:
                threshold_idx = self.find_gap(model_importances)
                chosen_features.extend(model_importances[: threshold_idx + 1])

        return sorted(chosen_features, key=lambda x: x[1], reverse=True)

    @staticmethod
    def anti_collision_renaming(dataset, col, pipeline_n):
        """Renaming columns to avoid collision during transformations."""
        suffix = f"_p{pipeline_n}"
        if isinstance(dataset, pd.Series):
            dataset.name = f"{col}{suffix}_{dataset.name}"
        elif isinstance(dataset, pd.DataFrame):
            dataset.columns = [f"{col}{suffix}_{c}" for c in dataset.columns]
        return dataset

    def fit(self, X, y, method="first_best"):
        """Fit models to the dataset and extract best features."""
        list_of_fimp = []
        pipeline_n = 0

        for pipeline in self.pipelines:
            pipeline_n += 1
            transformed_data = pd.concat(
                [
                    self.anti_collision_renaming(
                        pipeline.transform(X[col]), col, pipeline_n
                    )
                    for col in X.columns
                ],
                axis=1,
            )
            transformed_data = pd.concat([transformed_data, X], axis=1)

            model = xgb.XGBRegressor(**self.default_xgb_params)
            model.fit(transformed_data, y)
            list_of_fimp.append(
                self.extract_feature_importance(transformed_data.columns, model)
            )

            self.models.append(model)

        self.best_features = self.filter_importances(list_of_fimp, method)
        return self

    def transform(self):
        """Interface method for transformers."""
        return self
