from src.core import create_dependency_graph
from pathlib import Path

create_dependency_graph("test_graph.json", Path("artifacts"))