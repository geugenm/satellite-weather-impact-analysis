"""
Module for flattening feature importance distribution from xgboost.
"""
from collections.abc import Iterable

import numpy as np
import pandas as pd
import xgboost as xgb
from fets.pipeline import FeatureUnion2DF
from sklearn.base import BaseEstimator, TransformerMixin
# from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline


class FeatureImportanceOptimization(BaseEstimator, TransformerMixin):
    """
    Flattening the features' importances distribution using entropy
    augmentation (or distribution flattening).

    """
    def __init__(self, list_of_transformers):
        """ The constructor will help parameterize all options of this
        transformer

            :param list_of_transformers: list of externally built transformers
            objects in terms of scikit-learn pipeline compatible transformers.
            Meant to be a list of list of transformers to test different new
            features iteratively.

        """

        # List of best features finally selected after fit()
        self.best_features = None

        # Building eventually cascading pipelines
        self.build_pipelines(list_of_transformers)

        # Each pipeline will have a corresponding model after fitting
        self.models = []

        # Model with optimized input
        self.model_optinput = None

        # Initial XGBoost parameters
        self.default_xgb_params = {
            'learning_rate': 0.1,
            'gamma': 0,
            'max_depth': 10,
            'n_estimators': 100,
            'base_score': 0.5,
            'colsample_bylevel': 1,
            'colsample_bytree': 1,
            'max_delta_step': 0,
            'min_child_weight': 1,
            'missing': None,
            'nthread': 100,
            'objective': "reg:squarederror",
            'reg_alpha': 0,
            'reg_lambda': 1,
            'scale_pos_weight': 1,
            'seed': 0,
            'verbosity': 1,
            'subsample': 1,
            'predictor': "gpu_predictor",
            'tree_method': "auto"
        }

        self.do_tuning = False

    def build_pipelines(self, list_of_transformers):
        """
            Create series of pipelines of transformers to be called to augment
            input datasets before searching for most important features.

            :param list_of_transformers: List (of list) of scikit-learn
            compatible transformers.
        """
        self.pipelines = []

        if list_of_transformers is None or list_of_transformers == []:
            return

        for transformer in list_of_transformers:
            # Preparing the list of transformer for one iteration
            tmp_pipeline = []
            if isinstance(transformer, Iterable):
                tmp_pipeline = [("T" + str(hash(k)), k) for k in transformer
                                if issubclass(type(k), TransformerMixin)]
            elif issubclass(type(transformer), TransformerMixin):
                tmp_pipeline = [("T0", transformer)]

            # Creating the pipeline
            if tmp_pipeline:
                self.pipelines.append(
                    Pipeline([("union", FeatureUnion2DF(tmp_pipeline))]))

    @staticmethod
    def extract_feature_importance(columns, model):
        """ Extract a sorted list of feature importances from an XGBoost model

            :param columns: Columns names in the same order than the input
            dataset.
            :param model: A trained model containing feature importances list
            and trained trees.

        """
        importances = list(zip(columns, model.feature_importances_))
        importances.sort(key=lambda x: x[1], reverse=True)
        return importances

    @staticmethod
    def find_gap(importancy_list):
        """ Find a drop in list of decreasing values and returns feature index
            at found gap if the drop is more than 50% of the average and with
            at least 5 and maximum of (avarage minus 1 standard deviation).

            :param importancy_list: List of featurename,importancy
            in decreasing order.
            :return: Return index of last feature before gap in the feature
            distribuion. In case of flat distribution the maximum index fitting
            average - standard deviation is returned.

        """

        lst_val = []  # list of feature values
        lst_name = []  # list of feature names
        lst_dif = []  # list of gaps/differences between two importances
        idx = 0  # index of current feature
        average_dif = None  # average difference
        all_imps = []

        try:
            for fet, imp in importancy_list:
                all_imps.append(imp)
            upper_limit = np.mean(all_imps) - np.std(all_imps)

            for fet, imp in importancy_list:
                lst_val.append(imp)
                lst_name.append(fet)
                if idx != 0:
                    dif = lst_val[idx - 1] - lst_val[idx]
                    lst_dif.append(dif)
                    average_dif = np.mean(lst_dif, dtype=np.float64)
                    if (dif > (average_dif * 0.5) and idx > 5) or \
                       (imp < upper_limit):
                        return lst_name.index(lst_name[idx - 1])
                idx = idx + 1
            return idx

        except TypeError:
            print("No list provided as importancy_list.")

    def filter_importances(self, list_of_fimp, method=None):
        """ Return a list of best features based on their importance

            **fimp** stands for Feature IMPortances.
            Each feature importance is expressed as a tuple (name, value)

            :param list_of_fimp: List of list of feature importances.  Each
            model would output a list of importances so this list is a list of
            all model's list of features importances.
            :param method: Method to filter best features, use the following
            string:
                - 'first_best' method: select best of each feature list
                - 'all_best'   method: select best features over all models
                - 'best_until_threshold' method: select best of each feature
                list with regard to a threshold defined by find_gap

            :return: Return a list of tuples ("feature_name",
            feature_importance) of the best features according to filtering
            `method`
        """
        all_chosen_features = []

        if list_of_fimp is None \
           or (isinstance(list_of_fimp, list) and not list_of_fimp):
            return all_chosen_features

        if method is None:
            method = "first_best"

        if method == "first_best":
            for model_list in list_of_fimp:
                # Sort the input list to get best first
                tmp_list = sorted(model_list, reverse=True, key=lambda x: x[1])
                # Defining how many best first we want (first quarter)
                best_first = int(len(tmp_list) / 4.0 + 1.0)
                # Aggregating the result
                all_chosen_features.extend(tmp_list[:best_first])

        if method == "all_best":
            for model_list in list_of_fimp:
                if not model_list:
                    continue
                model_list = sorted(model_list,
                                    reverse=True,
                                    key=lambda x: x[1])
                all_chosen_features.append(model_list[0])

        if method == "best_until_threshold":
            for model_list in list_of_fimp:
                model_list = sorted(model_list,
                                    reverse=True,
                                    key=lambda x: x[1])
                last_significant_index = self.find_gap(model_list)
                tmp_list = model_list[:(last_significant_index + 1)]
                all_chosen_features.extend(tmp_list)

        all_chosen_features.sort(key=lambda x: x[1], reverse=True)
        return all_chosen_features

    @staticmethod
    def importances_distribution_spread(importances):
        """ Calculated absolute average distance from perfectly flat
        distribution of importances.

            :param importances: list of tuples such as [(feature_name,
            feature_importance), (...), ...]

        """
        flat_score = 1.0
        nbr_of_importances = float(len(importances))
        if nbr_of_importances > 0.0:
            flat_score = 1.0 / nbr_of_importances
            return np.mean(np.abs([(flat_score - k[1]) for k in importances]))
        return flat_score

    @staticmethod
    def anti_collision_renaming(dataset, col, pipeline_n):
        """ Renaming column names to avoid collision during pipelines
        transformations

            :param dataset: pd.Series or pd.DataFrame to be managed
            :param col: string for initial column name from which this data is
            originated
            :param pipeline_n: pipeline stage, an Integer number.
            :return: the input dataset with changed name or column names.
        """
        if isinstance(dataset, pd.Series):
            dataset.name = "{}_p{}_{}".format(col, pipeline_n, dataset.name)
        elif isinstance(dataset, pd.DataFrame):
            dataset.columns = [
                "{}_p{}_{}".format(col, pipeline_n, subcol)
                for subcol in dataset.columns
            ]
        return dataset

    def fit(self, input_x, input_y, method=None):
        """ Fit models for every pipeline and extract best features

            :param input_x: dataset (usually a dataframe) of features/predictor
            :param input_y: dataset (timseries or dataframe) of target(s) to
            predict.

        """

        # For now we take default hyperparameters
        xgboost_params = self.default_xgb_params

        # list of list of (tuples of) feature importances
        list_of_fimp = []

        pipeline_n = 0
        for pipeline in self.pipelines:
            # Augment dataset with current pipeline
            pipeline_n += 1
            input_dataset = None
            for col in input_x.columns:
                tmp_dataset = pipeline.transform(input_x[col])
                tmp_dataset = self.anti_collision_renaming(
                    tmp_dataset, col, pipeline_n)
                if input_dataset is None:
                    input_dataset = pd.DataFrame(tmp_dataset)
                else:
                    input_dataset = pd.concat([input_dataset, tmp_dataset],
                                              axis=1)

            input_dataset = pd.concat([input_dataset, input_x], axis=1)

            # Train a model with augmented dataset
            self.models.append(xgb.XGBRegressor(**xgboost_params))
            self.models[-1].fit(input_dataset, input_y)

            # Extract feature importances and keep them for further analysis
            list_of_fimp.append(
                self.extract_feature_importance(input_dataset.columns,
                                                self.models[-1]))

        self.best_features = self.filter_importances(list_of_fimp, method)

        return self

    def transform(self):
        """ Unused function here. Interface requirement.
        """
        return self
