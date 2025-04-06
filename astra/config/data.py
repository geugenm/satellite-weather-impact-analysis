import logging
from pathlib import Path

import yaml
from pydantic import BaseModel, Field

logging = logging.getLogger(__name__)


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
    format: FormatConfig = Field(default_factory=FormatConfig)

    @classmethod
    def from_yaml(cls, path: Path) -> "DataConfig":
        try:
            with open(path, "r", encoding="utf-8") as f:
                data = yaml.safe_load(f)
            return cls.model_validate(data or {})
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

    config_path = CONFIG_PATH / "data.yaml"
    return DataConfig.from_yaml(config_path)


if __name__ == "__main__":
    try:
        config = get_project_config()
        print(config.model_dump_json(indent=2))
    except Exception as e:
        print(f"error: {e}")
