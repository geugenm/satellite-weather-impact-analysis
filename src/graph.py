from pyecharts import options as opts
from pyecharts.charts import Graph
import json
from pathlib import Path
from typing import List, Dict, Any


def color_from_value(value: float, min_value: float, max_value: float) -> str:
    """Generate a color based on the value normalized between min and max."""
    normalized_value = max(0, min(1, (value - min_value) / (max_value - min_value)))
    red = int(normalized_value * 255)
    green = int((1 - normalized_value) * 128 + normalized_value * 50)
    blue = int((1 - normalized_value) * 200 + normalized_value * 30)
    return f"rgba({red}, {green}, {blue}, 0.9)"


def load_graph_data(graph_coeffs_json: Path) -> Dict[str, Any]:
    """Load graph data from a JSON file."""
    with graph_coeffs_json.open() as file:
        return json.load(file)


def create_nodes_and_links(
    data: Dict[str, Any]
) -> tuple[List[Dict[str, Any]], List[Dict[str, Any]]]:
    """Create nodes and links from the graph data."""
    nodes = {link["source"] for link in data["links"]}.union(
        link["target"] for link in data["links"]
    )
    links = []

    for link in data["links"]:
        try:
            value = float(link["value"])
            links.append(
                {"source": link["source"], "target": link["target"], "value": value}
            )
        except (ValueError, TypeError):
            print(f"Invalid value for link: {link}")

    if not links:
        raise ValueError("No valid links found with numeric values.")

    return list(nodes), links


def create_dependency_graph(graph_coeffs_json: Path, output_dir: Path) -> None:
    """Create and render a dependency graph from JSON data."""
    loaded_json = load_graph_data(graph_coeffs_json)
    nodes, links = create_nodes_and_links(loaded_json["graph"])

    min_value = min(link["value"] for link in links)
    max_value = max(link["value"] for link in links)

    connection_count = {node: 0 for node in nodes}
    for link in links:
        connection_count[link["source"]] += 1
        connection_count[link["target"]] += 1

    node_list = [
        {
            "name": node,
            "symbolSize": 10 + connection_count[node] * 2,
            "category": sum(
                1 for link in links if link["source"] == node or link["target"] == node
            ),
            "label": {
                "show": True,
                "formatter": "{b}",  # Show node name
                "color": "#FFFFFF",  # White color for better visibility
                "fontSize": 12,
                "backgroundColor": "#000000",  # Black background for contrast
                "borderRadius": 5,
                "padding": [5, 10],
            },
            "tooltip": {"formatter": f"{node}: {connection_count[node]} connection(s)"},
        }
        for node in nodes
    ]

    curved_edges = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": link["value"],
            "lineStyle": {
                "color": color_from_value(link["value"], min_value, max_value),
                "width": 2,
                "curveness": 0.3,
            },
            # No edge labels shown
            "label": {"show": False},  # Hide edge labels
        }
        for link in links
    ]

    graph = (
        Graph(init_opts=opts.InitOpts(width="100vw", height="100vh"))
        .add(
            "",
            node_list,
            curved_edges,
            categories=[
                {"name": str(i)}
                for i in range(max(node["category"] for node in node_list) + 1)
            ],
            repulsion=8000,
            is_focusnode=True,
            layout="force",
            label_opts=opts.LabelOpts(is_show=False),  # Hide node labels (if needed)
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
                    "restore": {"title": "Restore"},
                    "zoom": {},
                    "pan": {},
                    "lineWidth": {
                        "title": "Line Width",
                        "type": ["number"],
                        "minValue": 1,
                        "maxValue": 10,
                    },
                    "nodeSize": {
                        "title": "Node Size",
                        "type": ["number"],
                        "minValue": 10,
                        "maxValue": 100,
                    },
                },
                pos_left="center",
                pos_top="3%",
            ),
            legend_opts=opts.LegendOpts(pos_right="5%"),
            visualmap_opts=opts.VisualMapOpts(
                type_="continuous",
                min_=min_value,
                max_=max_value,
                range_color=["#000000", "#7F7F7F", "#FFFFFF"],
                textstyle_opts=opts.TextStyleOpts(color="#333", font_size=12),
                orient="horizontal",
                pos_bottom="bottom",
                pos_left="center",
            ),
        )
    )

    graph.render(output_dir / "graph.html")


# Example usage:
# create_dependency_graph(Path("path/to/graph_coeffs.json"), Path("path/to/output/dir"))
