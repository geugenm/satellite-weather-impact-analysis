from dash import Dash, html, Input, Output
import dash_cytoscape as cyto
import yaml
import dash


def load_graph_data(yaml_path):
    """Load and parse graph data from YAML file."""
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


def create_elements(data):
    """Convert raw data to Cytoscape elements."""
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
    return list(
        {
            element["data"]["id"]: element
            for element in elements
            if "source" not in element["data"]
        }.values()
    ) + [element for element in elements if "source" in element["data"]]


def generate_stylesheet(min_val, max_val):
    """Generate Cytoscape stylesheet with a light theme."""
    return [
        # Node styling
        {
            "selector": "node",
            "style": {
                "width": 25,
                "height": 25,
                "content": "data(label)",
                "font-size": "14px",
                "background-color": "#007AFF",
                "color": "#000000",
                "text-valign": "center",
                "text-halign": "center",
                "border-width": 2,
                "border-color": "#CCCCCC",
                "transition-property": "background-color",
                "transition-duration": "0.3s",
            },
        },
        # Edge styling with gradient coloring (purple to red)
        {
            "selector": "edge",
            "style": {
                "width": 2,
                "line-color": f"mapData(value, {min_val}, {max_val}, #D1C4E9, #FF5252)",
                "curve-style": "bezier",
                "target-arrow-shape": "triangle",
                "target-arrow-color": f"mapData(value, {min_val}, {max_val}, #D1C4E9, #FF5252)",
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
                "text-border-color": "#CCCCCC",
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


app = Dash(__name__)


def create_layout(elements, min_val, max_val):
    """Create Dash layout with Cytoscape graph and heatmap legend."""
    return html.Div(
        [
            html.Div(
                children=[
                    cyto.Cytoscape(
                        id="dependency-graph",
                        elements=elements,
                        layout={"name": "cose", "animate": True},
                        style={"width": "100vw", "height": "90vh"},
                        stylesheet=generate_stylesheet(min_val, max_val),
                        zoomingEnabled=True,
                        userZoomingEnabled=True,
                        userPanningEnabled=True,
                        responsive=True,
                    ),
                ],
                style={"display": "flex", "justify-content": "center"},
            ),
            html.Div(
                children=[
                    html.Div(
                        "Heatmap Legend:",
                        style={
                            "font-weight": "bold",
                            "margin-bottom": "5px",
                            "color": "#000000",
                        },
                    ),
                    html.Div(
                        children=[
                            html.Span(
                                "Low",
                                style={
                                    "margin-right": "10px",
                                    "color": "#000000",
                                },
                            ),
                            html.Div(
                                style={
                                    "display": "inline-block",
                                    "width": "200px",
                                    "height": "20px",
                                    "background-image": f"linear-gradient(to right, #D1C4E9 , #FF5252)",
                                }
                            ),
                            html.Span(
                                "High",
                                style={
                                    "margin-left": "10px",
                                    "color": "#000000",
                                },
                            ),
                        ],
                        style={"display": "flex", "align-items": "center"},
                    ),
                ],
                style={"text-align": "center", "margin-top": "20px"},
            ),
            html.Div(
                children=[
                    html.Button("Export as PNG", id="export-button", n_clicks=0)
                ],
                style={
                    "display": "flex",
                    "justify-content": "center",
                    "gap": "20px",
                    "margin-top": "20px",
                },
            ),
        ],
        style={"background-color": "#F9F9F9"},
    )


@app.callback(
    Output("dependency-graph", "generateImage"),
    Input("export-button", "n_clicks"),
)
def export_graph(n_clicks):
    """Export the graph as a PNG image."""
    if n_clicks > 0:
        return {"type": "png", "action": "download"}
    return dash.no_update


def main():
    data = load_graph_data("test/test_graph.yaml")
    elements = create_elements(data)
    values = [link["coefficient"] for link in data["links"]]
    min_val, max_val = min(values), max(values)

    app.layout = create_layout(elements, min_val, max_val)
    app.run_server(debug=True)


if __name__ == "__main__":
    main()
