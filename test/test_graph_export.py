import pytest
from pathlib import Path
from astra.graph import create_dependency_graph


@pytest.fixture
def test_graph_path() -> Path:
    return Path("test/test_graph.json")


@pytest.fixture
def artifacts_dir() -> Path:
    artifacts: Path = Path(".test")
    artifacts.mkdir(exist_ok=True)
    return artifacts


def test_dependency_graph_creation(
    test_graph_path: Path, artifacts_dir: Path
) -> None:
    params: dict[str, str] = {"reset_count": "reset count test!"}

    graph = create_dependency_graph(
        test_graph_path,
        params,
    )
    output_path = str(artifacts_dir / "graph.html")
    graph.render(output_path)

    expected_output: Path = artifacts_dir / "graph.html"
    assert expected_output.exists(), "Graph output file was not created"
    assert expected_output.stat().st_size > 0, "Graph output file is empty"
