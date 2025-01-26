from pathlib import Path
import pytest
from astra.automation import process_directory


@pytest.fixture
def test_data_dir() -> Path:
    return Path(__file__).parent / "example/sat"


@pytest.fixture
def empty_dir(tmp_path) -> Path:
    return tmp_path


def test_process_valid_directory(test_data_dir: Path) -> None:
    process_directory(test_data_dir)  # Should not raise


def test_process_nonexistent_directory() -> None:
    with pytest.raises(Exception, match=r".+: no such directory"):
        process_directory(Path("nonexistent"))


def test_process_empty_directory(empty_dir: Path) -> None:
    with pytest.raises(
        Exception, match=r".+: directory contains no subdirectories"
    ):
        process_directory(empty_dir)
