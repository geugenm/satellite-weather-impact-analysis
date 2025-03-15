from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    field_validator,
    StringConstraints,
    conlist,
)
from pathlib import Path
import yaml
from typing import Literal, Annotated, Union
import logging
from astra.paths import PROJECT_ROOT


class FetchConfig(BaseModel):
    """Configuration for data storage directories."""

    base_dir: Path = Field(
        default=Path("data"), description="Base directory for data storage"
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )

    @field_validator("base_dir", mode="before")
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
                f"base directory '{v}' does not exist, creating it."
            )
            v.mkdir(parents=True, exist_ok=True)  # Ensure directory exists
        return v


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
    separator: Annotated[str, StringConstraints(min_length=1, max_length=1)] = (
        Field(default=",", description="CSV delimiter")
    )
    special_symbols: SanitizationConfig = Field(
        default_factory=SanitizationConfig
    )

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
        print(config.model_dump_json(indent=2, exclude_none=True))
    except ValidationError as e:
        print("Validation Error:", e)
