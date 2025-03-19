import pytest
from pathlib import Path
from astra.graph import create_dependency_graph
import yaml

import os


@pytest.fixture
def test_graph_path() -> Path:
    return Path(
        os.path.join(
            os.path.dirname(os.path.realpath(__file__)),
            "data/test_graph.yaml",
        )
    )


@pytest.fixture
def artifacts_dir() -> Path:
    path = Path(__file__).parent / Path("artifacts")
    path.mkdir(exist_ok=True)
    return path


def test_dependency_graph_creation(
    test_graph_path: Path, artifacts_dir: Path
) -> None:
    with test_graph_path.open() as f:
        graph_source = yaml.safe_load(f)

    graph = create_dependency_graph(
        graph_source, {"reset_count": "reset count test!"}
    )

    output_file = artifacts_dir / "test_graph.html"
    graph.render(str(output_file))

    assert (
        output_file.exists() and output_file.stat().st_size > 0
    ), "Graph output file was not created or is empty"
