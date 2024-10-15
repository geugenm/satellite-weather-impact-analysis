# Polaris learn module

## Miner: FFlat

`FFlat` is a data explorer that analyzes feature importances and iteratively find the most important features.

`FFlat` stands for Feature Flattening.

## Predictor: XCorr

Cross Correlation finder.

```python
import pandas as pd
from polaris.learn import XCorr

correlator = XCorr()

# df = load_my_data(whatever, function, of, yours)

correlator.fit(df)

print(correlator.importances_map)
```

The XCorr class can be incorporated into a Scikit-learn pipeline.

### XCorr : warnings

The `RuntimeWarning: invalid value encountered in true_divide` has been deactivated. It appears because at this time we are not doing feature engineering before making predictions (explanations [here](https://gitlab.com/librespacefoundation/polaris/polaris/-/issues/84) ). This warning should be reactivated once we are doing feature engineering.
