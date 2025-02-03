import pytest
from pathlib import Path
from astra.graph import create_dependency_graph

import os


@pytest.fixture
def test_graph_path() -> Path:
    return Path(
        os.path.join(
            os.path.dirname(os.path.realpath(__file__)),
            "test_graph.json",
        )
    )


@pytest.fixture
def artifacts_dir() -> Path:
    path = Path("build")
    path.mkdir(exist_ok=True)
    return path


def test_dependency_graph_creation(
    test_graph_path: Path, artifacts_dir: Path
) -> None:
    graph = create_dependency_graph(
        test_graph_path, {"reset_count": "reset count test!"}
    )

    output_file = artifacts_dir / "test_graph.html"
    graph.render(str(output_file))

    assert (
        output_file.exists() and output_file.stat().st_size > 0
    ), "Graph output file was not created or is empty"
