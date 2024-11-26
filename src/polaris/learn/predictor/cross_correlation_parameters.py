class CrossCorrelationParameters:
    def __init__(self):
        self._use_gridsearch: bool = False
        self._random_state: int = 42
        self._test_size: float = 0.2
        self._gridsearch_scoring: str = "accuracy"
        self._gridsearch_n_splits: int = 5
        self._model_params: dict = {}
        self._model_cpu_params: dict = {}
        self._dataset_cleaning_params: object = (
            None  # Assuming CleanerParameters or similar class
        )
        self._regressor_name: str = "default_regressor"

    @property
    def use_gridsearch(self) -> bool:
        return self._use_gridsearch

    @use_gridsearch.setter
    def use_gridsearch(self, value: bool) -> None:
        self._use_gridsearch = value

    @property
    def random_state(self) -> int:
        return self._random_state

    @random_state.setter
    def random_state(self, value: int) -> None:
        self._random_state = value

    @property
    def test_size(self) -> float:
        return self._test_size

    @test_size.setter
    def test_size(self, value: float) -> None:
        self._test_size = value

    @property
    def gridsearch_scoring(self) -> str:
        return self._gridsearch_scoring

    @gridsearch_scoring.setter
    def gridsearch_scoring(self, value: str) -> None:
        self._gridsearch_scoring = value

    @property
    def gridsearch_n_splits(self) -> int:
        return self._gridsearch_n_splits

    @gridsearch_n_splits.setter
    def gridsearch_n_splits(self, value: int) -> None:
        self._gridsearch_n_splits = value

    @property
    def model_params(self) -> dict:
        return self._model_params

    @model_params.setter
    def model_params(self, value: dict) -> None:
        self._model_params = value

    @property
    def model_cpu_params(self) -> dict:
        return self._model_cpu_params

    @model_cpu_params.setter
    def model_cpu_params(self, value: dict) -> None:
        self._model_cpu_params = value

    @property
    def dataset_cleaning_params(self) -> object:
        return self._dataset_cleaning_params

    @dataset_cleaning_params.setter
    def dataset_cleaning_params(self, value: object) -> None:
        self._dataset_cleaning_params = value

    @property
    def regressor_name(self) -> str:
        return self._regressor_name

    @regressor_name.setter
    def regressor_name(self, value: str) -> None:
        self._regressor_name = value
