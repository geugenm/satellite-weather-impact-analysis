from pathlib import Path
import yaml
import numpy as np
from pyecharts import options as opts
from pyecharts.charts import Graph
from collections import Counter

# Constants as a frozen dataclass would be ideal in 3.13, but keeping as dict for compatibility
GRAPH_CONFIG = {
    "node": {"base_size": 10, "size_multiplier": 2},
    "edge": {"width": 2, "curveness": 0.3},
    "force": {"repulsion": 1200, "gravity": 0.2, "friction": 0.5, "length": 40},
    "dimensions": {"width": "100vw", "height": "100vh"},
    "color": {
        "alpha": 0.9,
        "red_max": 255,
        "green": (128, 50),  # (base, offset)
        "blue": (200, 30),  # (base, offset)
    },
}


def _color_from_value(value: float, min_val: float, max_val: float) -> str:
    norm = np.clip((value - min_val) / (max_val - min_val), 0, 1)
    red = int(norm * GRAPH_CONFIG["color"]["red_max"])
    green = int(
        (1 - norm) * GRAPH_CONFIG["color"]["green"][0]
        + norm * GRAPH_CONFIG["color"]["green"][1]
    )
    blue = int(
        (1 - norm) * GRAPH_CONFIG["color"]["blue"][0]
        + norm * GRAPH_CONFIG["color"]["blue"][1]
    )
    return f"rgba({red},{green},{blue},{GRAPH_CONFIG['color']['alpha']})"


def _parse_dependency_graph(yaml_path: Path) -> list[dict]:
    """Parse YAML graph with coefficient validation"""
    try:
        with yaml_path.open("r") as f:
            data = yaml.safe_load(f)

        return [
            {
                "source": link["source"],
                "target": link["target"],
                "value": float(link["coefficient"]),  # Standardize to float
            }
            for link in data.get("links", [])
            if "coefficient" in link  # Fail-fast validation
        ]
    except (yaml.YAMLError, KeyError) as e:
        print(f"🚨 Failed parsing {yaml_path.name}: {str(e)}")
        return []


def create_dependency_graph(graph_yaml: Path, descriptions: dict) -> Graph:
    # Load and process data
    links = _parse_dependency_graph(graph_yaml)

    # Process nodes and values in a single pass
    nodes = set()
    values = []
    for link in links:
        nodes.update([link["source"], link["target"]])
        values.append(link["value"])

    # Calculate connections using Counter
    connections = Counter(
        node for link in links for node in (link["source"], link["target"])
    )

    # Create node configurations
    node_list = [
        {
            "name": node,
            "symbolSize": GRAPH_CONFIG["node"]["base_size"]
            + connections[node] * GRAPH_CONFIG["node"]["size_multiplier"],
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
                "formatter": f"{node}: {connections[node]} connection(s)<br/>{descriptions.get(node, 'No description')}"
            },
        }
        for node in nodes
    ]

    # Create edge configurations
    min_val, max_val = min(values), max(values)
    edge_list = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": link["value"],
            "lineStyle": {
                "color": _color_from_value(link["value"], min_val, max_val),
                "width": GRAPH_CONFIG["edge"]["width"],
                "curveness": GRAPH_CONFIG["edge"]["curveness"],
            },
            "label": {"show": False},
        }
        for link in links
    ]

    # Create and configure graph
    return (
        Graph(init_opts=opts.InitOpts(**GRAPH_CONFIG["dimensions"]))
        .add(
            "Dependencies",
            node_list,
            edge_list,
            repulsion=GRAPH_CONFIG["force"]["repulsion"],
            gravity=GRAPH_CONFIG["force"]["gravity"],
            friction=GRAPH_CONFIG["force"]["friction"],
            edge_length=GRAPH_CONFIG["force"]["length"],
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
                    font_family="Arial",
                    font_size=20,
                    font_weight="bold",
                    color="#000",
                ),
            ),
            tooltip_opts=opts.TooltipOpts(trigger="item"),
            toolbox_opts=opts.ToolboxOpts(
                feature={
                    "saveAsImage": {"title": "Save as Image"},
                    "dataView": {"title": "View Data", "readOnly": True},
                    "restore": {"title": "Reset"},
                }
            ),
        )
    )
