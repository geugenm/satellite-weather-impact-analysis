from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    field_validator,
    ValidationInfo,
    conint,
    confloat,
)
from pathlib import Path
import yaml
from typing import Literal, Annotated, Optional
import logging


class DatasetCleaningParamsConfig(BaseModel):
    """Configuration for dataset cleaning parameters."""

    col_max_na_percentage: Annotated[int, conint(ge=0, le=100)] = Field(
        default=80, description="Max NA percentage per column"
    )
    row_max_na_percentage: Annotated[int, conint(ge=0, le=100)] = Field(
        default=80, description="Max NA percentage per row"
    )

    model_config = ConfigDict(
        extra="forbid", strict=True, populate_by_name=True
    )


class ModelParamsConfig(BaseModel):
    """Configuration for model hyperparameters."""

    objective: str = Field(default="reg:squarederror")
    n_estimators: Annotated[int, conint(ge=1)] = Field(default=81)
    learning_rate: Annotated[float, confloat(gt=0)] = Field(default=0.1)
    n_jobs: int = Field(default=1)
    tree_method: Literal["auto", "exact", "approx", "hist", "gpu_hist"] = Field(
        default="auto"
    )
    max_depth: Annotated[int, conint(ge=1)] = Field(default=12)
    device: Literal["cpu", "gpu"] = Field(default="gpu")
    base_score: float = Field(default=0.5)
    booster: Literal["gbtree", "gblinear", "dart"] = Field(default="gbtree")
    colsample_bylevel: Annotated[float, confloat(gt=0, le=1)] = Field(default=1)
    colsample_bynode: Annotated[float, confloat(gt=0, le=1)] = Field(default=1)
    colsample_bytree: Annotated[float, confloat(gt=0, le=1)] = Field(default=1)
    eval_metric: str = Field(default="rmse")
    gamma: float = Field(default=0.2)
    grow_policy: Literal["depthwise", "lossguide"] = Field(default="depthwise")

    # Optional fields
    interaction_constraints: Optional[str] = Field(default=None)
    max_bin: Optional[int] = Field(default=None)
    max_cat_threshold: Optional[int] = Field(default=None)
    max_cat_to_onehot: Optional[int] = Field(default=None)
    max_delta_step: float = Field(default=0)
    max_leaves: Optional[int] = Field(default=None)
    min_child_weight: float = Field(default=1)
    monotone_constraints: Optional[str] = Field(default=None)
    multi_strategy: Optional[str] = Field(default=None)
    num_parallel_tree: int = Field(default=1)
    reg_alpha: float = Field(default=0)
    reg_lambda: float = Field(default=1)
    sampling_method: Optional[str] = Field(default=None)
    scale_pos_weight: float = Field(default=1)
    subsample: Annotated[float, confloat(gt=0, le=1)] = Field(default=1)
    validate_parameters: bool = Field(default=False)
    verbosity: int = Field(default=1)
    early_stopping_rounds: Optional[int] = Field(default=None)

    model_config = ConfigDict(
        extra="forbid", strict=True, populate_by_name=True
    )

    @field_validator("eval_metric")
    @classmethod
    def validate_metric_consistency(cls, v: str, info: ValidationInfo) -> str:
        """Validate metric consistency with objective."""
        objective = info.data.get("objective", "")
        if "reg" in objective and v not in {"rmse", "mae", "rmsle"}:
            raise ValueError(
                f"Invalid eval_metric '{v}' for regression objective"
            )
        return v


class GraphConfig(BaseModel):
    """Configuration for graph-related settings."""

    graph_link_threshold: Annotated[float, confloat(ge=0, le=1)] = Field(
        default=0.2, description="Graph link threshold"
    )

    model_config = ConfigDict(
        extra="forbid", strict=True, populate_by_name=True
    )


class ModelConfig(BaseModel):
    """Main configuration class that combines all sub-configurations."""

    random_state: int = Field(default=43)
    test_size: Annotated[float, confloat(gt=0, lt=1)] = Field(default=0.2)
    regressor_name: Literal["XGBoosting", "XGBoost"] = Field(
        default="XGBoosting"
    )

    dataset_cleaning_params: DatasetCleaningParamsConfig = Field(
        default_factory=DatasetCleaningParamsConfig
    )
    model_params: ModelParamsConfig = Field(default_factory=ModelParamsConfig)
    graph: GraphConfig = Field(default_factory=GraphConfig)

    model_config = ConfigDict(
        extra="forbid", strict=True, populate_by_name=True
    )

    @classmethod
    def from_yaml(cls, path: Path) -> "ModelConfig":
        """Load configuration from a YAML file."""
        try:
            content = path.read_text(encoding="utf-8", errors="strict")
            data = yaml.safe_load(content)

            # Convert null values to None
            def replace_nulls(obj):
                if isinstance(obj, dict):
                    return {k: replace_nulls(v) for k, v in obj.items()}
                if obj == "null":
                    return None
                return obj

            data = replace_nulls(data)

            return cls.model_validate(data)
        except FileNotFoundError:
            logging.error(f"Configuration file not found: {path}")
            raise
        except yaml.YAMLError as e:
            logging.error(f"Error parsing YAML file: {e}")
            raise
        except ValidationError as e:
            logging.error(f"Configuration validation error: {e}")
            raise


def get_project_config() -> ModelConfig:
    from astra.paths import CONFIG_PATH

    config_path = CONFIG_PATH / "model.yaml"
    return ModelConfig.from_yaml(config_path)


if __name__ == "__main__":
    try:
        config = get_project_config()
        print(config.model_dump_json(indent=2))
    except ValidationError as e:
        print(f"Configuration validation failed:\n{e}")
    except Exception as e:
        print(f"Runtime error: {e}")
