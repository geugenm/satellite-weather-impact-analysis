from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    field_validator,
)
from pathlib import Path
import yaml
from typing import List, Union, Final, Dict
import logging
import re

# Constants
RESTRICTED_FILES: Final[set] = {"Ground_Stations", "Last_Frame_Received"}
UNIT_PATTERN: Final[str] = (
    r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c)$"
)
UNIT_MAP: Final[Dict[str, str]] = {
    "c": "celsius",
    "°c": "celsius",
    "v": "volts",
    "mv": "millivolts",
    "ma": "milliamps",
    "ms": "milliseconds",
    "s": "seconds",
    "m": "meters",
    "kg": "kilograms",
    "hz": "hertz",
    "db": "decibels",
    "rpm": "rpm",
}


class PathConfig(BaseModel):
    """Configuration for data paths."""

    base_dir: Union[str, Path] = Field(
        default="data", description="Base directory"
    )
    raw: Union[str, Path] = Field(
        default="data/raw", description="Raw data directory"
    )
    filtered: Union[str, Path] = Field(
        default="data/filtered", description="Filtered data directory"
    )
    formatted: Union[str, Path] = Field(
        default="data/formatted", description="Formatted data directory"
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )

    @field_validator("base_dir", "raw", "filtered", "formatted")
    @classmethod
    def convert_to_path(cls, v: Union[str, Path]) -> Path:
        return Path(v) if isinstance(v, str) else v

    @field_validator("raw", "filtered", "formatted", mode="before")
    @classmethod
    def resolve_relative_paths(cls, v: Union[str, Path], info) -> Path:
        """Resolve raw, filtered, and formatted paths relative to base_dir."""
        base_dir = info.data.get("base_dir", Path("data"))
        resolved_path = (Path(base_dir) / v).resolve()

        # Ensure the resolved path is within the base_dir
        if not resolved_path.is_relative_to(base_dir.resolve()):
            raise ValueError(
                f"Path '{resolved_path}' must be within the base directory '{base_dir}'."
            )
        return resolved_path

    @field_validator("base_dir")
    @classmethod
    def base_dir_must_exist(cls, v: Path) -> Path:
        if not v.exists():
            logging.warning(
                f"Base directory '{v}' does not exist, creating it."
            )
            v.mkdir(parents=True, exist_ok=True)
        return v.absolute()


class UnitConfig(BaseModel):
    """Configuration for unit conversion and validation."""

    pattern: str = Field(
        default=UNIT_PATTERN, description="Regex pattern for unit detection"
    )
    mapping: Dict[str, str] = Field(
        default=UNIT_MAP, description="Unit name mapping"
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )

    @field_validator("pattern")
    @classmethod
    def validate_regex(cls, v: str) -> str:
        try:
            re.compile(v)
            return v
        except re.error as e:
            raise ValueError(f"Invalid regex pattern: {e}")


class ProcessingConfig(BaseModel):
    """Configuration for data processing parameters."""

    time_column: str = Field(default="time", description="Time column name")
    restricted_files: List[str] = Field(
        default_factory=lambda: list(RESTRICTED_FILES)
    )
    strict_mode: bool = Field(
        default=False, description="Enable strict formatting"
    )
    min_columns: int = Field(default=2, description="Minimum required columns")
    sample_size: int = Field(
        default=100, description="Sample size for unit detection"
    )

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )


class SatelliteConfig(BaseModel):
    """Main configuration class."""

    paths: PathConfig = Field(default_factory=PathConfig)
    units: UnitConfig = Field(default_factory=UnitConfig)
    processing: ProcessingConfig = Field(default_factory=ProcessingConfig)

    model_config = ConfigDict(
        extra="forbid", populate_by_name=True, strict=True
    )

    @classmethod
    def from_yaml(cls, path: Path) -> "SatelliteConfig":
        """Load configuration from YAML file."""
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


def get_project_config() -> SatelliteConfig:
    """Get satellite configuration from default location."""
    config_path = Path(__file__).parent / "satellite.yaml"
    return SatelliteConfig.from_yaml(config_path)


if __name__ == "__main__":
    try:
        config = get_project_config()
        print(config.model_dump_json(indent=2))
    except ValidationError as e:
        print(f"Configuration validation failed:\n{e}")
    except Exception as e:
        print(f"Runtime error: {e}")
