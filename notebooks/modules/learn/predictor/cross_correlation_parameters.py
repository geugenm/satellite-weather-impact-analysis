"""Module for CrossCorrelationParameters class
"""


# pylint: disable=too-many-instance-attributes
# placeholder class for parameters. Hence,
# only one method and large number of parameters
class CrossCorrelationParameters():
    """Cross Correlation parameters class
    """
    def __init__(self):
        pass

    @property
    def use_gridsearch(self):
        """
        Return the use_gridsearch value as Boolean.

        """

        return self._use_gridsearch

    @use_gridsearch.setter
    def use_gridsearch(self, use_gridsearch):
        self._use_gridsearch = use_gridsearch

    @property
    def random_state(self):
        """
        Return the random_state value as Integer.

        """

        return self._random_state

    @random_state.setter
    def random_state(self, random_state):
        self._random_state = random_state

    @property
    def test_size(self):
        """
        Return the test_size value as Float.

        """

        return self._test_size

    @test_size.setter
    def test_size(self, test_size):
        self._test_size = test_size

    @property
    def gridsearch_scoring(self):
        """
        Return the gridsearch_scoring value as String.

        """

        return self._gridsearch_scoring

    @gridsearch_scoring.setter
    def gridsearch_scoring(self, gridsearch_scoring):
        self._gridsearch_scoring = gridsearch_scoring

    @property
    def gridsearch_n_splits(self):
        """
        Return the gridsearch_n_splits value as Integer.

        """

        return self._gridsearch_n_splits

    @gridsearch_n_splits.setter
    def gridsearch_n_splits(self, gridsearch_n_splits):
        self._gridsearch_n_splits = gridsearch_n_splits

    @property
    def model_params(self):
        """
        Return the model_params value as JSON.

        """

        return self._model_params

    @model_params.setter
    def model_params(self, model_params):
        self._model_params = model_params

    @property
    def model_cpu_params(self):
        """
        Return the model_cpu_params value as JSON.

        """

        return self._model_cpu_params

    @model_cpu_params.setter
    def model_cpu_params(self, model_cpu_params):
        self._model_cpu_params = model_cpu_params

    @property
    def dataset_cleaning_params(self):
        """
        Return the dataset_cleaning_params value as CleanerParameters.

        """

        return self._dataset_cleaning_params

    @dataset_cleaning_params.setter
    def dataset_cleaning_params(self, dataset_cleaning_params):
        self._dataset_cleaning_params = dataset_cleaning_params

    @property
    def regressor_name(self):
        """
        Return the regressor_name value as str.

        """

        return self._regressor_name

    @regressor_name.setter
    def regressor_name(self, regressor_name):
        self._regressor_name = regressor_name
