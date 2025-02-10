from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    model_validator,
)
from pathlib import Path
import yaml


class DatasetCleaningParamsConfig(BaseModel):
    """
    Configuration for dataset cleaning parameters.

    Attributes:
        col_max_na_percentage (int): Maximum allowed percentage of missing values in a column. Default is 80.
        row_max_na_percentage (int): Maximum allowed percentage of missing values in a row. Default is 80.
    """

    col_max_na_percentage: int = 80  # Max NA percentage per column
    row_max_na_percentage: int = 80  # Max NA percentage per row

    @model_validator(mode="after")
    def validate_na_percentages(self) -> "DatasetCleaningParamsConfig":
        """Validate NA percentage values are within valid range (0-100)."""
        if not 0 <= self.col_max_na_percentage <= 100:
            raise ValueError("col_max_na_percentage must be between 0 and 100")
        if not 0 <= self.row_max_na_percentage <= 100:
            raise ValueError("row_max_na_percentage must be between 0 and 100")
        return self

    model_config = ConfigDict(extra="forbid")


class ModelParamsConfig(BaseModel):
    """
    Configuration for model hyperparameters.
    """

    objective: str = "reg:squarederror"
    n_estimators: int = 81
    learning_rate: float = 0.1
    n_jobs: int = 1
    tree_method: str = "auto"
    max_depth: int = 12
    device: str = "gpu"
    base_score: float = 0.5
    booster: str = "gbtree"
    colsample_bylevel: float = 1
    colsample_bynode: float = 1
    colsample_bytree: float = 1
    eval_metric: str = "rmse"
    gamma: float = 0.2
    grow_policy: str = "depthwise"

    # Optional fields
    interaction_constraints: str | None = None
    max_bin: int | None = None
    max_cat_threshold: int | None = None
    max_cat_to_onehot: int | None = None
    max_delta_step: float = 0
    max_leaves: int | None = None
    min_child_weight: float = 1
    monotone_constraints: str | None = None
    multi_strategy: str | None = None
    num_parallel_tree: int = 1
    reg_alpha: float = 0
    reg_lambda: float = 1
    sampling_method: str | None = None
    scale_pos_weight: float = 1
    subsample: float = 1
    validate_parameters: bool = False
    verbosity: int = 1
    early_stopping_rounds: int | None = None

    @model_validator(mode="after")
    def validate_model_params(self) -> "ModelParamsConfig":
        """Validate model parameters consistency."""
        valid_tree_methods = {"auto", "exact", "approx", "hist", "gpu_hist"}
        valid_grow_policies = {"depthwise", "lossguide"}
        valid_boosters = {"gbtree", "gblinear", "dart"}
        valid_devices = {"cpu", "gpu"}

        # Validate parameter ranges
        if self.learning_rate <= 0:
            raise ValueError("learning_rate must be > 0")
        if self.n_estimators < 1:
            raise ValueError("n_estimators must be ≥ 1")
        if self.max_depth < 1:
            raise ValueError("max_depth must be ≥ 1")
        if self.tree_method not in valid_tree_methods:
            raise ValueError(f"Invalid tree_method: {self.tree_method}")
        if self.grow_policy not in valid_grow_policies:
            raise ValueError(f"Invalid grow_policy: {self.grow_policy}")
        if self.booster not in valid_boosters:
            raise ValueError(f"Invalid booster: {self.booster}")
        if self.device not in valid_devices:
            raise ValueError(f"Invalid device: {self.device}")
        if self.subsample <= 0 or self.subsample > 1:
            raise ValueError("subsample must be in (0, 1]")
        if any(
            colsample > 1 or colsample <= 0
            for colsample in [
                self.colsample_bytree,
                self.colsample_bylevel,
                self.colsample_bynode,
            ]
        ):
            raise ValueError("All colsample parameters must be in (0, 1]")

        # Validate metric consistency
        if "reg" in self.objective and self.eval_metric not in {
            "rmse",
            "mae",
            "rmsle",
        }:
            raise ValueError(
                f"Invalid eval_metric '{self.eval_metric}' for regression objective"
            )

        return self

    model_config = ConfigDict(extra="forbid")


class GraphConfig(BaseModel):
    """
    Configuration for graph-related settings.
    """

    graph_link_threshold: float = 0.2

    @model_validator(mode="after")
    def validate_graph_threshold(self) -> "GraphConfig":
        """Validate graph link threshold is in [0,1] range."""
        if not 0 <= self.graph_link_threshold <= 1:
            raise ValueError("graph_link_threshold must be between 0 and 1")
        return self


class ModelConfig(BaseModel):
    """
    Main configuration class that combines all sub-configurations.
    """

    random_state: int = 43
    test_size: float = 0.2
    regressor_name: str = "XGBoosting"

    dataset_cleaning_params: DatasetCleaningParamsConfig = Field(
        default_factory=DatasetCleaningParamsConfig
    )
    model_params: ModelParamsConfig = Field(default_factory=ModelParamsConfig)
    graph: GraphConfig = Field(default_factory=GraphConfig)

    @model_validator(mode="after")
    def validate_main_config(self) -> "ModelConfig":
        """Validate cross-parameter consistency."""
        if not 0 < self.test_size < 1:
            raise ValueError("test_size must be between 0 and 1")
        if self.regressor_name.lower() not in {"xgboosting", "xgboost"}:
            raise ValueError("Unsupported regressor type")
        return self

    @classmethod
    def from_yaml(cls, path: Path) -> "ModelConfig":
        with path.open() as f:
            raw_config = yaml.safe_load(f)
            return cls.model_validate(raw_config)


if __name__ == "__main__":
    config_path = Path("model.yaml")

    try:
        config = ModelConfig.from_yaml(config_path)
        print(config.model_dump_json(indent=2))
    except ValidationError as e:
        print(f"Configuration validation failed:\n{e}")
    except Exception as e:
        print(f"Runtime error: {e}")
