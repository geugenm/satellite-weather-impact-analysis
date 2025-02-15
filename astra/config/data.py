from pydantic import (
    BaseModel,
    ConfigDict,
    Field,
    ValidationError,
    model_validator,
)
from pathlib import Path
import yaml


class FetchConfig(BaseModel):
    """
    Configuration for data storage directories.

    Attributes:
        base_dir (Path): Base directory for all data storage. Default is 'data'.
        raw (Path): Directory for raw data. Automatically resolved as `base_dir/raw`.
        processed (Path): Directory for processed data. Automatically resolved as `base_dir/processed`.
    """

    base_dir: Path = Path("data")  # Base directory for data storage
    raw: Path = Field(exclude=True)  # Derived field: raw data directory
    processed: Path = Field(
        exclude=True
    )  # Derived field: processed data directory

    @model_validator(mode="after")
    def _resolve_paths(self) -> "FetchConfig":
        """
        Resolve derived paths (raw and processed) based on the base_dir.
        """
        self.raw = self.base_dir / "raw"
        self.processed = self.base_dir / "processed"
        return self

    model_config = ConfigDict(extra="forbid")  # Forbid extra fields in the YAML


class FormatConfig(BaseModel):
    """
    Configuration for data formatting and sanitization.

    Attributes:
        time_column (str): Name of the column containing timestamps. Default is 'time'.
        time_format (str): Format of timestamps (strftime format). Default is '%Y-%m-%d'.
        timezone (str): Timezone for datetime operations. Default is 'UTC'.
        separator (str): CSV delimiter. Default is ','.
        numeric_precision (str): Numeric precision type. Options: 'float32', 'float64', etc.
        exclude_columns (list[str]): List of columns to exclude during processing.
    """

    time_column: str = "time"  # Column name containing timestamps
    time_format: str = "%Y-%m-%d"  # Timestamp format
    timezone: str = "UTC"  # Timezone for datetime operations
    separator: str = ","  # CSV delimiter
    numeric_precision: str = "float64"  # Numeric precision type
    exclude_columns: list[str] = Field(
        default_factory=list
    )  # Columns to exclude

    class SaveConfig(BaseModel):
        """
        Configuration for file saving options.

        Attributes:
            type (str): Output file type. Options: 'csv', 'parquet', etc. Default is 'csv'.
            compression (str): Compression method. Options: '', 'infer', 'gzip', etc.
        """

        type: str = "csv"  # Output file type
        compression: str = "infer"  # Compression method

        @model_validator(mode="after")
        def validate_save_config(self) -> "SaveConfig":
            """
            Validate save configuration.
            Ensure that only supported file types and compression methods are used.
            """
            valid_types = {"csv", "parquet", "feather", "json"}
            valid_compressions = {
                "",
                "infer",
                "bz2",
                "gzip",
                "xz",
                "zip",
                "zstd",
            }

            if self.type not in valid_types:
                raise ValueError(
                    f"Invalid file type '{self.type}'. Must be one of {valid_types}."
                )
            if self.compression not in valid_compressions:
                raise ValueError(
                    f"Invalid compression method '{self.compression}'. Must be one of {valid_compressions}."
                )
            return self

    save: SaveConfig = Field(
        default_factory=SaveConfig
    )  # Nested save configuration

    class SanitizationConfig(BaseModel):
        """
        Configuration for column name sanitization.

        Attributes:
            patterns (list[str]): List of special symbols to replace in column names.
            replacement (str): Character to replace special symbols with.
        """

        patterns: list[str] = [
            " ",
            "-",
            "(",
            ")",
            "/",
            ".",
            "[",
            "]",
        ]  # Symbols to replace
        replacement: str = "_"  # Replacement character

    special_symbols: SanitizationConfig = Field(
        default_factory=SanitizationConfig
    )

    model_config = ConfigDict(extra="forbid")  # Forbid extra fields in the YAML


class ArtifactsConfig(BaseModel):
    """
    Configuration for artifact storage.

    Attributes:
        dir (Path): Directory to store artifacts. Default is 'artifacts'.
    """

    dir: Path = Path("artifacts")  # Directory for artifacts

    @model_validator(mode="after")
    def validate_artifacts_dir(self) -> "ArtifactsConfig":
        """
        Validate that the artifacts directory exists or can be created.
        """
        if not self.dir.exists():
            try:
                self.dir.mkdir(parents=True)
            except Exception as e:
                raise ValueError(
                    f"Failed to create artifacts directory '{self.dir}': {e}"
                )
        return self

    model_config = ConfigDict(extra="forbid")  # Forbid extra fields in the YAML


class DataConfig(BaseModel):
    """
    Main configuration class that combines all sub-configurations.

    Attributes:
        fetch (FetchConfig): Configuration for data directories.
        format (FormatConfig): Configuration for formatting and sanitization.
        artifacts (ArtifactsConfig): Configuration for artifact storage.

    Methods:
        from_yaml(cls, path): Loads configuration from a YAML file.
    """

    fetch: FetchConfig = Field(default_factory=FetchConfig)
    format: FormatConfig = Field(default_factory=FormatConfig)
    artifacts: ArtifactsConfig = Field(default_factory=ArtifactsConfig)

    @classmethod
    def from_yaml(cls, path: Path) -> "DataConfig":
        """
        Load configuration from a YAML file.

        Args:
            path (Path): Path to the YAML configuration file.

        Returns:
            DataConfig: An instance of the configuration class populated with values from the file.

        Example:
            config = DataConfig.from_yaml(Path('data.yaml'))
            print(config.fetch.base_dir)
        """
        content = path.read_text(encoding="utf-8", errors="strict")
        return cls.model_validate(yaml.safe_load(content))

    @model_validator(mode="after")
    def validate_test_config(self) -> "DataConfig":
        """
        Perform high-level validation across all configurations.

        Example checks:
          - Ensure `fetch.base_dir` is not empty.
          - Validate that numeric precision is supported.
          - Ensure no overlap between excluded columns and required columns like `time_column`.

          Raises ValueError if any validation fails.
        """

        if self.format.numeric_precision not in {"float32", "float64"}:
            raise ValueError(
                f"Unsupported numeric precision '{self.format.numeric_precision}'."
            )

        if self.format.time_column in self.format.exclude_columns:
            raise ValueError(
                f"`time_column` ('{self.format.time_column}') cannot be in `exclude_columns`."
            )

        return self


if __name__ == "__main__":
    from astra.paths import CONFIG_PATH

    config_path = CONFIG_PATH / "data.yaml"

    try:
        config = DataConfig.from_yaml(config_path)

        print(config.model_dump_json(indent=2))

    except ValidationError as e:
        print("Validation Error:", e)
