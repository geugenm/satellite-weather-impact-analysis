from pyecharts import options as opts
from pyecharts.charts import Graph
import json
from pathlib import Path
import numpy as np

# Constants
NODE_BASE_SIZE = 10
NODE_SIZE_MULTIPLIER = 2
EDGE_WIDTH = 2
EDGE_CURVENESS = 0.3
REPULSION_FORCE = 1200  # Increased repulsion for better spacing
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


def color_from_value(value: float, min_value: float, max_value: float) -> str:
    normalized_value = np.clip((value - min_value) / (max_value - min_value), 0, 1)
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


def load_graph_data(graph_coeffs_json: Path) -> dict:
    try:
        with graph_coeffs_json.open() as file:
            return json.load(file)
    except (FileNotFoundError, json.JSONDecodeError) as e:
        raise ValueError(f"Error loading graph data: {e}")


def create_nodes_and_links(data: dict[str, any]) -> (list[str], list[dict[str, any]]):
    nodes = {link["source"] for link in data["links"]}.union(
        link["target"] for link in data["links"]
    )

    links = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": float(link["value"]),
        }
        for link in data["links"]
        if isinstance(link.get("value"), (int, float))
    ]

    if not links:
        raise ValueError("No valid links found with numeric values.")

    return list(nodes), links


def create_node_list(
    nodes: list[str], connection_count: dict[str, int], descriptions: dict[str, str]
) -> list[dict[str, any]]:
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


def create_dependency_graph(
    graph_coeffs_json: Path, output_dir: Path, descriptions: dict[str, str]
) -> None:
    loaded_json = load_graph_data(graph_coeffs_json)

    nodes, links = create_nodes_and_links(loaded_json["graph"])

    min_value = min(link["value"] for link in links)
    max_value = max(link["value"] for link in links)

    connection_count = {
        node: sum(
            1 for link in links if link["source"] == node or link["target"] == node
        )
        for node in nodes
    }

    # Pass descriptions to create_node_list
    node_list = create_node_list(nodes, connection_count, descriptions)
    edge_list = create_edge_list(links, min_value, max_value)

    graph = (
        Graph(
            init_opts=opts.InitOpts(
                width=GRAPH_DIMENSIONS["width"], height=GRAPH_DIMENSIONS["height"]
            )
        )
        .add(
            "result",
            node_list,
            edge_list,
            gravity=GRAVITY,
            friction=FRICTION,
            edge_length=EDGE_LENGTH,
            is_rotate_label=True,
            is_draggable=True,
            repulsion=REPULSION_FORCE,
            is_focusnode=True,
            layout="force",
            label_opts=opts.LabelOpts(is_show=False),
            linestyle_opts=opts.LineStyleOpts(curve=0.2),
        )
        .set_global_opts(
            title_opts=opts.TitleOpts(
                title="2D Dependency Graph",
                pos_left="center",
                pos_top="top",
                title_textstyle_opts=opts.TextStyleOpts(
                    font_family="Arial", font_size=24, font_weight="bold", color="#000"
                ),
            ),
            tooltip_opts=opts.TooltipOpts(
                trigger="item", formatter="{a} <br/>{b} : {c}"
            ),
            toolbox_opts=opts.ToolboxOpts(
                feature={
                    "saveAsImage": {"title": "Save screenshot"},
                    "dataView": {"readOnly": True, "title": "Data View"},
                    "restore": {"title": "Regenerate"},
                },
                pos_left="center",
                pos_top="3%",
            ),
        )
    )

    graph.render(output_dir / "graph.html")
