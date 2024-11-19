from pyecharts import options as opts
from pyecharts.charts import Graph
import json
from pathlib import Path


def color_from_value(value: float, min_value: float, max_value: float) -> str:
    normalized_value = (value - min_value) / (max_value - min_value)
    normalized_value = max(0, min(1, normalized_value))  # Clamp between 0 and 1
    red = int(normalized_value * 255)
    blue = int((1 - normalized_value) * 255)
    return f"rgba({red}, {0}, {blue}, 0.8)"


def create_dependency_graph(graph_coeffs_json: Path, output_dir: Path) -> None:
    with open(graph_coeffs_json) as file:
        loaded_json = json.load(file)

    data = loaded_json["graph"]

    nodes = {link["source"] for link in data["links"]}.union(
        link["target"] for link in data["links"]
    )

    links = []
    for link in data["links"]:
        try:
            value = float(link["value"])  # Convert to float
            links.append(
                {"source": link["source"], "target": link["target"], "value": value}
            )
        except (ValueError, TypeError):
            print(f"Invalid value for link: {link}")  # Log invalid entries

    if not links:
        raise ValueError("No valid links found with numeric values.")

    min_value = min(link["value"] for link in links)
    max_value = max(link["value"] for link in links)

    node_list = [
        {
            "name": node,
            "symbolSize": 20,
            "value": f"{node} - {sum(1 for link in links if link['source'] == node or link['target'] == node)} bound(s)",
        }
        for node in nodes
    ]

    bond_width = 4

    colored_links = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": link["value"],
            "lineStyle": {
                "color": color_from_value(link["value"], min_value, max_value),
                "width": bond_width,
            },
        }
        for link in links
    ]

    graph = (
        Graph()
        .add("", node_list, colored_links, repulsion=8000)
        .set_global_opts(
            title_opts=opts.TitleOpts(title="2D Dependency Graph"),
            toolbox_opts=opts.ToolboxOpts(
                feature={
                    "saveAsImage": {"title": "Save as Image"},
                    "dataView": {"readOnly": True, "title": "Data View"},
                    "restore": {"title": "Restore"},
                },
                pos_left="right",  # Positioning from the left
                pos_top="10%",  # Positioning from the top
            ),
        )
    )

    graph.render(output_dir / "graph.html")
