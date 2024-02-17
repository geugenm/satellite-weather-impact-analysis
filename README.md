# Satellite Weather Impact Analysis

This repository contains the code for analyzing the impact of space weather on
active satellite systems. The analysis is performed by comparing solar and
active satellite data to identify correlations between them.

## Features

- Loading and processing JSON data from SatNOGS Grafana Dashboard
- Converting timestamps to universal format
- Filtering data by specific years
- Calculating various types of correlations
- Plotting scatter plots for visualization
- Preprocessing solar and satellite data
- Merging datasets and performing correlation analysis

## Scripts Details

### Correlation Calculation

The script calculates several types of correlation coefficients between the
columns of the processed dataset. It uses the `pandas.DataFrame.corr()` method
to compute the Pearson correlation coefficients, which measure the linear
relationship between two datasets. Additionally, it computes the
Kendall Tau and Spearman rank correlation coefficients, which can capture
nonlinear relationships.

### Statistical Analysis

For each pair of columns being compared, the script calculates the Pearson
correlation, Kendall Tau, and Spearman rank correlation coefficients. It also
performs a Chi-square test of independence to determine if there is a
significant association between the two variables. The chi-square statistic and
the corresponding p-value are computed using `scipy.stats.chi2_contingency()`,
which provides insights into the likelihood that the observed data could have
occurred by chance under the assumption of no association.

### Visualizations

Scatter plots are generated for each pair of columns to visualize the
relationships between them. This helps in identifying trends and patterns in the
data. Heatmaps of correlation matrices can also be used to present the
correlation data in a more compact and informative manner.

<figure>
    <img src=".github/img/example_anomaly.webp" width="800" height="400" alt="Example Anomaly">
    <figcaption>An example of an anomaly in the data.</figcaption>
</figure>

<figure>
    <img src=".github/img/example_data_change.png" width="800" height="400" alt="Example Data Change">
    <figcaption>An example of a data change over time.</figcaption>
</figure>

### Logging

The script logs important events and warnings during execution. For instance, if
a column is nearly constant and therefore not suitable for correlation analysis,
a warning is logged. All outputs are formatted professionally, with variables
enclosed in square brackets for clarity.

### Models

We are utilizing a modified and upgraded version
of [Polaris ML](https://gitlab.com/geugenm/polaris-ml-sandbox), enabling us to
use `Python 3.8` with the latest setup tools. This modification includes the ability to
use polaris `behave` and `report`ing capabilities.
Additionally, Sun reports have been enabled, and some visualization styles have
been adjusted.

However, the graph functionality is still not fully operational. The graph can
be accessed by pressing `Ctrl + /`, but it does not display vertex names
correctly. As a workaround, exporting to [Gephi](https://gephi.org/) is the only
viable option at this time.

## Contributing

Pull requests and issues are welcome. For major changes, please open an issue
first to discuss what you would like to change.

## License

[GNU-GPL3.0](https://www.gnu.org/licenses/gpl-3.0.txt)