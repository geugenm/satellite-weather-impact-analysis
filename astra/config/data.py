from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    field_validator,
    ValidationInfo,
    StringConstraints,
    conlist,
)
from pathlib import Path
import yaml
from typing import Literal, List, Annotated, Union
import logging
import pandas as pd
from astra.paths import PROJECT_ROOT


class FetchConfig(BaseModel):
    """Configuration for data storage directories."""

    base_dir: Path = Field(
        default=Path("data"), description="Base directory for data storage"
    )
    raw: Path = Field(
        default=Path("data/raw"), description="Directory for raw data"
    )
    processed: Path = Field(
        default=Path("data/processed"),
        description="Directory for processed data",
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )

    @field_validator("base_dir", "raw", "processed", mode="before")
    @classmethod
    def convert_to_path(cls, v: Union[str, Path]) -> Path:
        """Convert string to Path object."""
        return Path(v) if isinstance(v, str) else v

    @field_validator("base_dir")
    @classmethod
    def base_dir_must_exist(cls, v: Path) -> Path:
        """Validate that base_dir exists."""
        v = PROJECT_ROOT / v
        if not v.exists():
            logging.warning(
                f"Base directory '{v}' does not exist, creating it."
            )
            v.mkdir(parents=True, exist_ok=True)  # Ensure directory exists
        return v

    @field_validator("raw", "processed")
    @classmethod
    def ensure_subdirectories(cls, v: Path, info: ValidationInfo) -> Path:
        """Ensure raw and processed directories exist, relative to base_dir."""
        base_dir = info.data.get("base_dir", Path("data"))
        resolved_path = (Path(base_dir) / v).resolve()

        # Ensure the resolved path is within the base_dir
        if not resolved_path.is_relative_to(base_dir.resolve()):
            raise ValueError(
                f"Path '{resolved_path}' must be within the base directory '{base_dir}'."
            )
        return resolved_path


class SaveConfig(BaseModel):
    """Configuration for file saving options."""

    type: Literal["csv", "parquet", "feather", "json"] = Field(
        default="csv", description="Output file type"
    )
    compression: Literal["", "infer", "bz2", "gzip", "xz", "zip", "zstd"] = (
        Field(default="infer", description="Compression method")
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )


class SanitizationConfig(BaseModel):
    """Configuration for column name sanitization."""

    patterns: conlist(str, min_length=1) = Field(
        default=[" ", "-", "(", ")", "/", ".", "[", "]"],
        description="Symbols to replace in column names",
    )
    replacement: Annotated[
        str, StringConstraints(min_length=1, max_length=1)
    ] = Field(default="_", description="Replacement character for symbols")

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )


class FormatConfig(BaseModel):
    """Configuration for data formatting and sanitization."""

    time_column: Annotated[str, StringConstraints(min_length=1)] = Field(
        default="time", description="Column name containing timestamps"
    )
    time_format: Annotated[str, StringConstraints(min_length=1)] = Field(
        default="%Y-%m-%d", description="Timestamp format (Python strftime)"
    )
    timezone: str = Field(
        default="UTC", description="Timezone for all datetime operations"
    )
    separator: Annotated[str, StringConstraints(min_length=1, max_length=1)] = (
        Field(default=",", description="CSV delimiter")
    )
    numeric_precision: Literal["float32", "float64"] = Field(
        default="float64", description="Numeric precision"
    )
    exclude_columns: List[str] = Field(
        default_factory=list, description="Columns to exclude"
    )
    save: SaveConfig = Field(
        default_factory=SaveConfig, description="Nested save configuration"
    )
    special_symbols: SanitizationConfig = Field(
        default_factory=SanitizationConfig
    )

    @field_validator("exclude_columns")
    @classmethod
    def time_column_not_excluded(
        cls, v: List[str], info: ValidationInfo
    ) -> List[str]:
        """Ensure time_column is not in exclude_columns."""
        time_column = info.data.get("time_column")
        if time_column and time_column in v:
            raise ValueError(
                f"time_column ('{time_column}') cannot be in exclude_columns."
            )
        return v

    @field_validator("timezone")
    @classmethod
    def validate_timezone(cls, v: str) -> str:
        """Validate the timezone by attempting to use it in a pandas operation."""
        try:
            pd.Timestamp.now(tz=v)
            return v
        except Exception as e:
            raise ValueError(
                f"Invalid timezone: {v}. Please ensure it is a valid tz database name."
            ) from e

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )


class DataConfig(BaseModel):
    """Main configuration class that combines all sub-configurations."""

    fetch: FetchConfig = Field(
        default_factory=FetchConfig,
        description="Configuration for data directories",
    )
    format: FormatConfig = Field(
        default_factory=FormatConfig,
        description="Configuration for formatting and sanitization",
    )

    @classmethod
    def from_yaml(cls, path: Path) -> "DataConfig":
        """Load configuration from a YAML file."""
        try:
            content = path.read_text(encoding="utf-8", errors="strict")
            data = yaml.safe_load(content)
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

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )


def get_project_config() -> DataConfig:
    from astra.paths import CONFIG_PATH

    config_path = CONFIG_PATH / "data.yaml"
    return DataConfig.from_yaml(config_path)


if __name__ == "__main__":
    try:
        config = get_project_config()
        print(config.model_dump_json(indent=2))
    except ValidationError as e:
        print("Validation Error:", e)
