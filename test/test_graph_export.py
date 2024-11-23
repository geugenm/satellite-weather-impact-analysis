from src.graph import create_dependency_graph
from pathlib import Path

create_dependency_graph(
    Path("test_graph.json"), Path("artifacts"), {"reset_count": "reset count test!"}
)
