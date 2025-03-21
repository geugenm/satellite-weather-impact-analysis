import logging
from pathlib import Path

import yaml
from pydantic import BaseModel, Field


class SanitizationConfig(BaseModel):
    patterns: list[str] = Field(
        default=[" ", "-", "(", ")", "/", ".", "[", "]"]
    )
    replacement: str = Field(default="_")


class FormatConfig(BaseModel):
    time_column: str = Field(default="time")
    time_format: str = Field(default="%Y-%m-%d")
    separator: str = Field(default=",")
    special_symbols: SanitizationConfig = Field(
        default_factory=SanitizationConfig
    )


class DataConfig(BaseModel):
    """Main configuration class."""

    format: FormatConfig = Field(default_factory=FormatConfig)

    @classmethod
    def from_yaml(cls, path: Path) -> "DataConfig":
        """Load configuration from a YAML file."""
        try:
            content = path.read_text(encoding="utf-8")
            data = yaml.safe_load(content)
            return cls.model_validate(data)
        except FileNotFoundError:
            logging.error(f"configuration file not found: {path}")
            raise
        except yaml.YAMLError as e:
            logging.error(f"error parsing yaml file: {e}")
            raise
        except Exception as e:
            logging.error(f"configuration validation error: {e}")
            raise


def get_project_config() -> DataConfig:
    from astra.paths import CONFIG_PATH

    return DataConfig.from_yaml(CONFIG_PATH / "data.yaml")


if __name__ == "__main__":
    from pydantic import (
        ValidationError,
    )

    try:
        config = get_project_config()
        print(config.model_dump_json(indent=2))
    except ValidationError as e:
        print(f"Configuration validation failed:\n{e}")
    except Exception as e:
        print(f"Runtime error: {e}")
