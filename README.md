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

### Data Preprocessing (like skipping non-numerical data  and etc.)

Before calculating correlations, the script preprocesses the data by loading it
from JSON files and CSV files, converting timestamps to a universal format,
filtering data by specific years, removing non-numeric data, and merging
datasets by time. This ensures that the correlation analysis is performed on
clean, relevant data.
There is `scripts/data_preprocessor.py` script that will clear the csv data
in `data/` subfolders (sats name). You can see the example of preprocessings
in `test/data-preprocessor/data`.

### Logging

The script logs important events and warnings during execution. For instance, if
a column is nearly constant and therefore not suitable for correlation analysis,
a warning is logged. All outputs are formatted professionally, with variables
enclosed in square brackets for clarity.

## Requirements

- Python 3.7+
- pandas
- numpy
- matplotlib
- scipy

## Contributing

Pull requests and issues are welcome. For major changes, please open an issue
first to discuss what you would like to change.

## License

[GNU-GPL3.0](https://www.gnu.org/licenses/gpl-3.0.txt)