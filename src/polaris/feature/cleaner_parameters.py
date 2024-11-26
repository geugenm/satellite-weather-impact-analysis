class CleanerParameters:
    def __init__(
        self, col_max_na_percentage: float = 0.0, row_max_na_percentage: float = 0.0
    ):
        self._col_max_na_percentage = col_max_na_percentage
        self._row_max_na_percentage = row_max_na_percentage

    @property
    def col_max_na_percentage(self) -> float:
        return self._col_max_na_percentage

    @col_max_na_percentage.setter
    def col_max_na_percentage(self, value: float) -> None:
        self._col_max_na_percentage = value

    @property
    def row_max_na_percentage(self) -> float:
        return self._row_max_na_percentage

    @row_max_na_percentage.setter
    def row_max_na_percentage(self, value: float) -> None:
        self._row_max_na_percentage = value
