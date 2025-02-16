from dataclasses import dataclass
from typing import Any
import numpy as np
from pyecharts import options as opts
from pyecharts.charts import Graph
from collections import Counter
from rich.console import Console
import typer
from functools import partial

console = Console()
app = typer.Typer()


@dataclass(frozen=True)
class GraphStyle:
    """Graph styling configuration"""

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
    """Generate RGBA color based on value - blue for low, red for high"""
    norm = np.clip((value - min_val) / (max_val - min_val), 0, 1)
    red = int(norm * style.color_red_max)
    green = int((1 - norm) * style.color_green[0] + norm * style.color_green[1])
    blue = int((1 - norm) * style.color_blue[0] + norm * style.color_blue[1])
    return f"rgba({red},{green},{blue},{style.color_alpha})"


def create_dependency_graph(
    data: dict, descriptions: dict, style: GraphStyle = GraphStyle()
) -> Graph:
    """Create interactive dependency graph with synchronized color legend"""
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

        connections = Counter(
            node for link in links for node in (link["source"], link["target"])
        )

        color_func = partial(
            create_color, min_val=min_val, max_val=max_val, style=style
        )

        # Generate color pieces for visual map
        pieces = [
            {
                "min": min_val,
                "max": max_val,
                "color": [
                    create_color(min_val, min_val, max_val, style),
                    create_color(max_val, min_val, max_val, style),
                ],
            }
        ]

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
                        "tooltip": {
                            "formatter": f"{node}: {connections[node]} connection(s)<br/>{descriptions.get(node, 'No description')}"
                        },
                    }
                    for node in nodes
                ],
                [
                    {
                        "source": link["source"],
                        "target": link["target"],
                        "value": link["value"],
                        "lineStyle": {
                            "color": color_func(link["value"]),
                            "width": style.edge_width,
                            "curveness": style.edge_curveness,
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
                    title="2D Dependency Graph",
                    pos_left="center",
                    pos_top="top",
                ),
                visualmap_opts=opts.VisualMapOpts(
                    min_=min_val,
                    max_=max_val,
                    range_text=["High Correlation", "Low Correlation"],
                    dimension=2,
                    pos_left="left",
                    pos_top="center",
                    is_calculable=True,
                    range_color=[
                        f"rgb({style.color_blue[0]},{style.color_green[0]},{style.color_red_max})",  # Blue for low
                        f"rgb({style.color_red_max},{style.color_green[1]},{style.color_blue[1]})",  # Red for high
                    ],
                ),
                tooltip_opts=opts.TooltipOpts(trigger="item"),
                toolbox_opts=opts.ToolboxOpts(
                    feature={
                        "saveAsImage": {},
                        "dataView": {"readOnly": True},
                        "restore": {},
                    }
                ),
            )
        )
    except Exception as e:
        console.print(f"[red]Error creating dependency graph: {str(e)}[/red]")
        raise
