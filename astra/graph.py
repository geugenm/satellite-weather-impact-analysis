from pathlib import Path
import json
import numpy as np
from pyecharts import options as opts
from pyecharts.charts import Graph

# Constants
NODE_BASE_SIZE = 10
NODE_SIZE_MULTIPLIER = 2
EDGE_WIDTH = 2
EDGE_CURVENESS = 0.3
REPULSION_FORCE = 1200
GRAVITY = 0.2
FRICTION = 0.5
EDGE_LENGTH = 40
GRAPH_DIMENSIONS = {"width": "100vw", "height": "100vh"}

COLOR_CONFIG = {
    "alpha": 0.9,
    "red_max": 255,
    "green_base": 128,
    "green_offset": 50,
    "blue_base": 200,
    "blue_offset": 30,
}


def normalize(value: float, min_value: float, max_value: float) -> float:
    """Normalize a value between min_value and max_value."""
    return np.clip((value - min_value) / (max_value - min_value), 0, 1)


def color_from_value(value: float, min_value: float, max_value: float) -> str:
    """Generate a color from a value based on its normalized position."""
    normalized_value = normalize(value, min_value, max_value)
    red = int(normalized_value * COLOR_CONFIG["red_max"])
    green = int(
        np.clip(
            (1 - normalized_value) * COLOR_CONFIG["green_base"]
            + normalized_value * COLOR_CONFIG["green_offset"],
            0,
            255,
        )
    )
    blue = int(
        np.clip(
            (1 - normalized_value) * COLOR_CONFIG["blue_base"]
            + normalized_value * COLOR_CONFIG["blue_offset"],
            0,
            255,
        )
    )
    return f"rgba({red}, {green}, {blue}, {COLOR_CONFIG['alpha']})"


def load_graph_data(file_path: Path) -> dict:
    """Load graph data from a JSON file."""
    try:
        with file_path.open() as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError) as e:
        raise ValueError(f"Error loading graph data from {file_path}: {e}")


def create_nodes_and_links(graph_data: dict) -> tuple[list[str], list[dict[str, any]]]:
    links = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": float(link["value"]),
        }
        for link in graph_data["links"]
        if isinstance(link.get("value"), (int, float))
    ]

    if not links:
        raise ValueError("No valid links with numeric values found.")

    nodes = {link["source"] for link in links} | {link["target"] for link in links}
    return list(nodes), links


def create_node_list(
    nodes: list[str], connection_count: dict[str, int], descriptions: dict[str, str]
) -> list[dict[str, any]]:
    """Generate a list of node configurations."""
    return [
        {
            "name": node,
            "symbolSize": NODE_BASE_SIZE
            + connection_count[node] * NODE_SIZE_MULTIPLIER,
            "label": {
                "show": True,
                "formatter": "{b}",
                "color": "#FFFFFF",
                "fontSize": 12,
                "backgroundColor": "#000000",
                "borderRadius": 5,
                "padding": [5, 10],
            },
            "tooltip": {
                "formatter": f"{node}: {connection_count[node]} connection(s)<br/>{descriptions.get(node, 'No description available')}"
            },
        }
        for node in nodes
    ]


def create_edge_list(
    links: list[dict[str, any]], min_value: float, max_value: float
) -> list[dict[str, any]]:
    """Generate a list of edge configurations."""
    return [
        {
            "source": link["source"],
            "target": link["target"],
            "value": link["value"],
            "lineStyle": {
                "color": color_from_value(link["value"], min_value, max_value),
                "width": EDGE_WIDTH,
                "curveness": EDGE_CURVENESS,
            },
            "label": {"show": False},
        }
        for link in links
    ]


def calculate_connection_count(links: list[dict[str, any]]) -> dict[str, int]:
    """Calculate the number of connections for each node."""
    connection_count = {}
    for link in links:
        connection_count[link["source"]] = connection_count.get(link["source"], 0) + 1
        connection_count[link["target"]] = connection_count.get(link["target"], 0) + 1
    return connection_count


def create_dependency_graph(
    graph_coeffs_json: Path, descriptions: dict[str, str]
) -> Graph:
    """Generate a dependency graph visualization."""
    graph_data = load_graph_data(graph_coeffs_json)

    nodes, links = create_nodes_and_links(graph_data["graph"])
    min_value, max_value = min(link["value"] for link in links), max(
        link["value"] for link in links
    )

    connection_count = calculate_connection_count(links)
    node_list = create_node_list(nodes, connection_count, descriptions)
    edge_list = create_edge_list(links, min_value, max_value)

    return (
        Graph(init_opts=opts.InitOpts(**GRAPH_DIMENSIONS))
        .add(
            series_name="Dependencies",
            nodes=node_list,
            links=edge_list,
            repulsion=REPULSION_FORCE,
            gravity=GRAVITY,
            friction=FRICTION,
            edge_length=EDGE_LENGTH,
            is_draggable=True,
            layout="force",
            label_opts=opts.LabelOpts(is_show=False),
        )
        .set_global_opts(
            title_opts=opts.TitleOpts(
                title="2D Dependency Graph",
                pos_left="center",
                pos_top="top",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_family="Arial", font_size=20, font_weight="bold", color="#000"
                ),
            ),
            tooltip_opts=opts.TooltipOpts(trigger="item"),
            toolbox_opts=opts.ToolboxOpts(
                feature={
                    "saveAsImage": {"title": "Save as Image"},
                    "dataView": {"title": "View Data", "readOnly": True},
                    "restore": {"title": "Reset"},
                },
            ),
        )
    )
