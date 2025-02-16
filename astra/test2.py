from dataclasses import dataclass
import dash
from dash import html, Input, Output, callback
import dash_cytoscape as cyto
import yaml
from pathlib import Path
from typing import Dict, Any


@dataclass(frozen=True)
class GraphStyle:
    """Styling configuration for the graph"""

    node_base_size: int = 15
    node_size_multiplier: int = 3
    edge_width: int = 2
    arrow_size: int = 15


def load_graph_data(yaml_path: str | Path) -> Dict[str, Any]:
    """Load and parse graph data from YAML file"""
    try:
        with open(yaml_path, "r") as f:
            data = yaml.safe_load(f)

        if not isinstance(data, dict) or "links" not in data:
            raise ValueError("Invalid YAML structure: must contain 'links' key")

        for link in data["links"]:
            if not all(k in link for k in ("source", "target", "coefficient")):
                raise ValueError(
                    "Each link must have source, target, and coefficient"
                )

        return data
    except yaml.YAMLError as e:
        raise ValueError(f"Failed to parse YAML: {e}")
    except Exception as e:
        raise ValueError(f"Error loading graph data: {e}")


def create_elements(data: dict) -> list:
    """Convert raw data to Cytoscape elements"""
    elements = []
    for link in data["links"]:
        elements.extend(
            [
                {"data": {"id": link["source"], "label": link["source"]}},
                {"data": {"id": link["target"], "label": link["target"]}},
                {
                    "data": {
                        "source": link["source"],
                        "target": link["target"],
                        "value": link["coefficient"],
                        "label": f"{link['coefficient']:.2f}",
                    }
                },
            ]
        )
    # Deduplicate nodes while keeping edges intact
    return list(
        {
            element["data"]["id"]: element
            for element in elements
            if "source" not in element["data"]
        }.values()
    ) + [element for element in elements if "source" in element["data"]]


def generate_stylesheet(
    style: GraphStyle, min_val: float, max_val: float
) -> list:
    """Generate Cytoscape stylesheet with heatmap-based edge coloring"""
    return [
        # Node styling
        {
            "selector": "node",
            "style": {
                "width": f"mapData(connections, 0, 10, {style.node_base_size}, "
                f"{style.node_base_size + 10 * style.node_size_multiplier})",
                "height": f"mapData(connections, 0, 10, {style.node_base_size}, "
                f"{style.node_base_size + 10 * style.node_size_multiplier})",
                "content": "data(label)",
                "font-size": "14px",
                "background-color": "#4A90E2",
                "color": "#FFFFFF",
                "text-valign": "center",
                "text-halign": "center",
                "border-width": 2,
                "border-color": "#333",
            },
        },
        # Edge styling with heatmap coloring
        {
            "selector": "edge",
            "style": {
                "width": style.edge_width,
                "line-color": f"mapData(value, {min_val}, {max_val}, yellow, red)",
                "curve-style": "bezier",
                "target-arrow-shape": "triangle",
                "target-arrow-color": f"mapData(value, {min_val}, {max_val}, yellow, red)",
                "arrow-scale": style.arrow_size / 10,
                "label": "",
                "opacity": 0.8,
            },
        },
        # Tooltip styling for edges (on hover)
        {
            "selector": "edge:selected",
            "style": {
                "label": "data(label)",
                "font-size": "12px",
                "text-background-opacity": 1,
                "text-background-color": "#FFFFFF",
                "text-background-padding": "3px",
                "text-border-opacity": 1,
                "text-border-width": 1,
                "text-border-color": "#333",
            },
        },
        # Tooltip styling for nodes (on hover)
        {
            "selector": "node:selected",
            "style": {
                "font-size": "16px",
                "font-weight": "bold",
            },
        },
    ]


app = dash.Dash(__name__)


def create_layout(
    elements: list, style: GraphStyle, min_val: float, max_val: float
):
    """Create Dash layout with Cytoscape graph and heatmap legend"""
    return html.Div(
        [
            html.Div(
                children=[
                    cyto.Cytoscape(
                        id="dependency-graph",
                        elements=elements,
                        layout={"name": "cose", "animate": True},
                        style={
                            "width": "85vw",
                            "height": "85vh",
                            "margin": "auto",
                        },
                        stylesheet=generate_stylesheet(style, min_val, max_val),
                    ),
                ],
                style={"display": "flex", "justify-content": "center"},
            ),
            html.Div(
                children=[
                    html.Div(
                        "Heatmap Legend:",
                        style={"font-weight": "bold", "margin-bottom": "5px"},
                    ),
                    html.Div(
                        children=[
                            html.Span("Low", style={"margin-right": "10px"}),
                            html.Div(
                                style={
                                    "display": "inline-block",
                                    "width": "200px",
                                    "height": "20px",
                                    "background-image": f"linear-gradient(to right, yellow , red)",
                                }
                            ),
                            html.Span("High", style={"margin-left": "10px"}),
                        ],
                        style={"display": "flex", "align-items": "center"},
                    ),
                ],
                style={"text-align": "center", "margin-top": "20px"},
            ),
        ]
    )


def main():
    data = load_graph_data("test/test_graph.yaml")
    elements = create_elements(data)
    values = [link["coefficient"] for link in data["links"]]
    min_val, max_val = min(values), max(values)

    app.layout = create_layout(elements, GraphStyle(), min_val, max_val)
    app.run_server(debug=True)


if __name__ == "__main__":
    main()
