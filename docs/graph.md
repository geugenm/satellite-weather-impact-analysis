## Graph Overview

In the repository, the file [`astra/graph.py`](https://github.com/geugenm/satellite-weather-impact-analysis/blob/main/astra/graph.py) generates a dependency-style graph by reading JSON-serialized correlation or cross-correlation data (for example, from [`test/test_graph.json`](https://github.com/geugenm/satellite-weather-impact-analysis/blob/main/test/test_graph.json)) and visualizing it with a force-directed layout. This graph highlights how different satellite or solar parameters (nodes) influence one another based on their computed correlation values (edges).

---

### Mathematical Context

1. **Cross-Correlation**
   The edges typically represent some measure derived from cross-correlation, such as:

    ```
    r_{X,Y}(\tau) = \frac{\sum_{t}(X(t)-\mu_X)(Y(t+\tau)-\mu_Y)}{\sqrt{\sum_{t}(X(t)-\mu_X)^2}\sqrt{\sum_{t}(Y(t+\tau)-\mu_Y)^2}}
    ```

    where X and Y are time-series for different parameters (telemetry vs. solar indices), μ_X and μ_Y are their respective means, and τ is a possible time lag. The resulting correlation coefficient (or a statistic derived from it) is encoded in each edge's `"value"` field.

2. **Edge Weight and Color Mapping**

    - The code reads a numeric `"value"` for each link from the JSON.
    - It normalizes these values between min_value and max_value, then applies a color gradient to visually distinguish strong vs. weak (or positive vs. negative) relationships.
    - This color transition can often follow:

    ```
    color(v) = \alpha \cdot red + (1-\alpha) \cdot blue
    ```

    for some normalized α, or a similar gradient formula in RGB or HSL space.

3. **Node Significance**
    - Each node represents a particular parameter or measured signal (e.g., _satellite system telemetry_, _flux measurement_, _sunspot number_, etc.).
    - Node layout is determined by a force-directed algorithm, typically minimizing an energy function of repulsion and spring-like edge forces:

    ```
    E_{total} = \sum_{(i,j)\in E} k_e\|x_i - x_j\|^2 + \sum_{i}k_r \|x_i\|^2
    ```

    with x_i as the node coordinates, k_e as the edge "spring" constant, and k_r as a repulsion term. This means highly correlated (or strongly weighted) nodes gravitate closer together.

---

### Reading the Graph

1. **Nodes**

    - **Labels** match either columns from the satellite or solar dataset.
    - **Position** indicates similarity or correlation strength: strongly linked nodes tend to cluster.

2. **Edges**

    - **Edge Thickness or Color** reflects the magnitude of the correlation coefficient. A larger or more intensely colored edge typically means a stronger connection.
    - If the code supports negative correlations, certain color bands (e.g., red vs. blue) may signify direction or sign of correlation.

3. **Tooltips**
    - Hovering over a node or edge typically reveals the underlying numeric value or a short description. This is defined in the JSON structure's link and node objects.

---

### Integration With Polaris

- **Cross-correlation Data Source**:
  The Polaris workflow computes correlation or regression outputs (e.g., XGBoost-based coefficients). This data then funnels into `astra/graph.py` to construct the visualization.
- **Downstream Analysis**:
  Researchers inspect the force-directed graph to identify clusters of parameters that share strong correlations (e.g., discovering that certain satellite anomaly metrics align with heightened solar flare indices).

- **Mathematical Rigor**:
  By mapping each correlation coefficient onto a visual dimension (color, thickness, or node spacing), the graph enables a quick, intuitive snapshot of high-dimensional relationships otherwise buried in larger datasets.

---

### Example Flow

1. **Collect Satellite & Solar Data**
    - Output includes correlation matrices or cross-correlation series.
2. **Serialize to JSON**
    - Each pair (i, j) with correlation coefficient ρ_ij is stored as a `"link"` in `graph.json`.
3. **Graph Building** (`create_dependency_graph`)
    - Reads JSON to create nodes for each parameter.
    - Creates edges weighted by ρ_ij.
    - Applies a force-directed layout algorithm.
4. **Visualization**
    - Pyecharts or a similar library renders the graph, coloring edges by ρ_ij scale.

The final result is an interactive or static graph that pinpoints which parameters have the highest synergy or conflict, thereby guiding further engineering or scientific exploration.
