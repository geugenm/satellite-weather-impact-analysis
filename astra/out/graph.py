import logging
from collections import Counter
from dataclasses import dataclass
from functools import partial

import numpy as np
from pyecharts import options as opts
from pyecharts.charts import Graph


@dataclass(frozen=True)
class GraphStyle:
    node_base_size: int = 10
    node_size_multiplier: int = 2
    edge_width: int = 2
    edge_curveness: float = 0.3
    force_repulsion: int = 1200
    force_gravity: float = 0.2
    force_friction: float = 0.5
    force_length: int = 40
    width: str = "100vw"
    height: str = "100vh"
    color_alpha: float = 0.9
    color_red_max: int = 255
    color_green: tuple[int, int] = (128, 50)
    color_blue: tuple[int, int] = (200, 30)


def create_color(
    value: float, min_val: float, max_val: float, style: GraphStyle
) -> str:
    norm = np.clip((value - min_val) / (max_val - min_val), 0, 1)
    red = int(norm * style.color_red_max)
    green = int((1 - norm) * style.color_green[0] + norm * style.color_green[1])
    blue = int((1 - norm) * style.color_blue[0] + norm * style.color_blue[1])
    return f"rgba({red},{green},{blue},{style.color_alpha})"


def create_dependency_graph(
    data: dict, descriptions: dict, style: GraphStyle = GraphStyle()
) -> Graph:
    try:
        links = [
            {
                "source": link["source"],
                "target": link["target"],
                "value": float(link["coefficient"]),
            }
            for link in data.get("links", [])
            if "coefficient" in link
        ]

        nodes = {link["source"] for link in links} | {
            link["target"] for link in links
        }
        values = [link["value"] for link in links]
        min_val, max_val = min(values), max(values)

        stats = {
            "nodes": len(nodes),
            "connections": len(links),
            "max_correlation": f"{max_val:.3f}",
            "min_correlation": f"{min_val:.3f}",
            "avg_correlation": f"{np.mean(values):.3f}",
        }

        connections = Counter(
            node for link in links for node in (link["source"], link["target"])
        )

        color_func = partial(
            create_color, min_val=min_val, max_val=max_val, style=style
        )

        return (
            Graph(
                init_opts=opts.InitOpts(width=style.width, height=style.height)
            )
            .add(
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
                            "formatter": (
                                f"<b>{node}</b><br/>"
                                f"Connections: {connections[node]}<br/>"
                                f"Description: {descriptions.get(node, 'No description')}"
                            )
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
                            "formatter": (
                                f"<b>{link['source']} → {link['target']}</b><br/>"
                                f"Correlation: {link['value']:.3f}<br/>"
                                f"Strength: {abs(link['value']):.2%}"
                            )
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
            .set_global_opts(
                title_opts=opts.TitleOpts(
                    title="Correlation Analysis Graph",
                    subtitle=(
                        f"Nodes: {stats['nodes']} | "
                        f"Connections: {stats['connections']} | "
                        f"Correlation range: [{stats['min_correlation']}, {stats['max_correlation']}]"
                    ),
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
                        f"rgb({style.color_blue[0]},{style.color_green[0]},{style.color_red_max})",  # Blue for weak
                        f"rgb({style.color_red_max},{style.color_green[1]},{style.color_blue[1]})",  # Red for strong
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
        )
    except Exception as e:
        logging.error(f"error creating dependency graph: {str(e)}")
        raise
