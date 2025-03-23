from __future__ import annotations

import math
from collections import Counter
from dataclasses import dataclass, field
from functools import partial
from typing import TypeAlias, TypedDict, Final

import numpy as np
from numpy.typing import NDArray
from pyecharts import options as opts
from pyecharts.charts import Graph
from scipy import stats

# Type aliases
NodeId: TypeAlias = str
Value: TypeAlias = float
Color: TypeAlias = tuple[int, int, int]


class Link(TypedDict):
    source: NodeId
    target: NodeId
    coefficient: Value


class GraphData(TypedDict):
    links: list[Link]


@dataclass(frozen=True, slots=True)
class GraphStyle:
    node_base_size: Final[int] = 10
    node_size_multiplier: Final[int] = 2
    edge_width: Final[int] = 2
    edge_curveness: Final[float] = 0.3
    force_repulsion: Final[int] = 1200
    force_gravity: Final[float] = 0.2
    force_friction: Final[float] = 0.5
    force_length: Final[int] = 40
    width: Final[str] = "100vw"
    height: Final[str] = "100vh"
    color_alpha: Final[float] = 0.9
    color_red_max: Final[int] = 255
    color_green: Final[tuple[int, int]] = field(default=(128, 50))
    color_blue: Final[tuple[int, int]] = field(default=(200, 30))


def create_color(
    value: Value, min_val: Value, max_val: Value, style: GraphStyle
) -> str:
    norm: float = np.clip((value - min_val) / (max_val - min_val), 0, 1)
    red: int = int(norm * style.color_red_max)
    green: int = int(
        math.fma(
            -norm,
            style.color_green[0] - style.color_green[1],
            style.color_green[0],
        )
    )
    blue: int = int(
        math.fma(
            -norm,
            style.color_blue[0] - style.color_blue[1],
            style.color_blue[0],
        )
    )
    return f"rgba({red},{green},{blue},{style.color_alpha})"


def create_dependency_graph(
    data: GraphData,
    descriptions: dict[NodeId, str],
    style: GraphStyle = GraphStyle(),
) -> Graph:
    links: list[dict[str, NodeId | Value]] = [
        {
            "source": link["source"],
            "target": link["target"],
            "value": float(link["coefficient"]),
        }
        for link in data["links"]
        if "coefficient" in link
    ]

    nodes: set[NodeId] = {link["source"] for link in links} | {
        link["target"] for link in links
    }
    values: NDArray[np.float64] = np.fromiter(
        (link["value"] for link in links), dtype=np.float64
    )

    min_val, max_val = np.min(values), np.max(values)

    stats: dict[str, int | str] = {
        "nodes": len(nodes),
        "connections": len(links),
        "max_correlation": f"{max_val:.3f}",
        "min_correlation": f"{min_val:.3f}",
        "avg_correlation": f"{np.mean(values):.3f}",
    }

    connections: Counter[NodeId] = Counter(
        node for link in links for node in (link["source"], link["target"])
    )

    color_func = partial(
        create_color, min_val=min_val, max_val=max_val, style=style
    )

    graph = Graph(
        init_opts=opts.InitOpts(width=style.width, height=style.height)
    )

    graph.add(
        "Dependencies",
        [
            {
                "name": node,
                "symbolSize": style.node_base_size
                + connections[node] * style.node_size_multiplier,
                "label": {
                    "show": True,
                    "formatter": "{b}",
                    "color": "#FFFFFF",
                    "fontSize": 12,
                    "backgroundColor": "#000000",
                    "borderRadius": 5,
                    "padding": [5, 10],
                },
                "itemStyle": {"color": "#000000"},
                "tooltip": {
                    "formatter": f"<b>{node}</b><br/>"
                    f"Connections: {connections[node]}<br/>"
                    f"Description: {descriptions.get(node, 'No description')}"
                },
            }
            for node in nodes
        ],
        [
            {
                "source": link["source"],
                "target": link["target"],
                "value": link["value"],
                "symbolSize": 0,
                "lineStyle": {
                    "color": color_func(link["value"]),
                    "width": style.edge_width,
                    "curveness": style.edge_curveness,
                },
                "tooltip": {
                    "formatter": f"<b>{link['source']} → {link['target']}</b><br/>"
                    f"Correlation: {link['value']:.3f}<br/>"
                },
                "label": {"show": False},
            }
            for link in links
        ],
        repulsion=style.force_repulsion,
        gravity=style.force_gravity,
        friction=style.force_friction,
        edge_length=style.force_length,
        is_draggable=True,
        layout="force",
    )

    graph.set_global_opts(
        title_opts=opts.TitleOpts(
            title="Correlation Analysis Graph",
            subtitle=f"Nodes: {stats['nodes']} | "
            f"Connections: {stats['connections']} | "
            f"Correlation range: [{stats['min_correlation']}, {stats['max_correlation']}]",
            pos_left="center",
            pos_top="top",
            title_textstyle_opts=opts.TextStyleOpts(
                font_size=20, font_weight="bold"
            ),
            subtitle_textstyle_opts=opts.TextStyleOpts(font_size=14),
        ),
        visualmap_opts=opts.VisualMapOpts(
            min_=min_val,
            max_=max_val,
            range_text=["Strong", "Weak"],
            dimension=2,
            pos_left="left",
            pos_top="center",
            is_calculable=True,
            split_number=20,
            range_color=[
                f"rgb({style.color_blue[0]},{style.color_green[0]},{style.color_red_max})",
                f"rgb({style.color_red_max},{style.color_green[1]},{style.color_blue[1]})",
            ],
        ),
        tooltip_opts=opts.TooltipOpts(
            trigger="item",
            background_color="rgba(255,255,255,0.9)",
            border_color="#333",
            border_width=1,
        ),
        toolbox_opts=opts.ToolboxOpts(
            pos_left="right",
            pos_top="top",
            feature={
                "saveAsImage": {
                    "type": "png",
                    "title": "Save",
                    "pixel_ratio": 2,
                },
                "restore": {"title": "Reset"},
                "dataZoom": {"title": "Zoom"},
            },
        ),
    )

    return graph


def validate_graph_data(data: GraphData) -> None:
    if not isinstance(data, dict) or "links" not in data:
        raise ValueError("Invalid graph data structure")

    for link in data["links"]:
        if not all(key in link for key in ("source", "target", "coefficient")):
            raise ValueError("Invalid link structure in graph data")

        try:
            float(link["coefficient"])
        except ValueError:
            raise ValueError(
                f"Invalid coefficient value: {link['coefficient']}"
            )


def analyze_graph_statistics(values: NDArray[np.float64]) -> dict[str, float]:
    return {
        "mean": np.mean(values),
        "median": np.median(values),
        "std_dev": np.std(values),
        "skewness": stats.skew(values),
        "kurtosis": stats.kurtosis(values),
    }


if __name__ == "__main__":
    import json
    import sys

    try:
        with open(sys.argv[1], "r") as f:
            data = json.load(f)

        with open(sys.argv[2], "r") as f:
            descriptions = json.load(f)

        validate_graph_data(data)

        graph = create_dependency_graph(data, descriptions)
        graph.render("dependency_graph.html")

        values = np.array(
            [float(link["coefficient"]) for link in data["links"]]
        )
        statistics = analyze_graph_statistics(values)

        print("Graph Statistics:")
        for key, value in statistics.items():
            print(f"{key.capitalize()}: {value:.4f}")

    except (
        IndexError,
        FileNotFoundError,
        json.JSONDecodeError,
        ValueError,
    ) as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
