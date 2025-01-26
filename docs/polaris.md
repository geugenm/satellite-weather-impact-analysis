# 🌟 Polaris ML Core: Advanced Satellite-Solar Correlation Analysis

## 🔬 Core Principles

The model employs XGBoost-based gradient boosting for discovering non-linear correlations between satellite telemetry and solar activity parameters.

### Mathematical Foundation

The core learning process optimizes the following objective:

\[
\text{obj}(\theta) = \sum*{i=1}^n l(y_i, \hat{y}\_i) + \sum*{k=1}^K \Omega(f_k)
\]

where:

- \( l \) is the training loss function
- \( \Omega \) is the regularization term
- \( f_k \) represents tree structure
- \( \hat{y}_i = \sum_{k=1}^K f_k(x_i) \)

## 🛠️ Pipeline Architecture

```
graph TD
    A[Satellite Telemetry] --> B[Feature Engineering]
    C[Solar Parameters] --> B
    B --> D[XGBoost Training]
    D --> E[Cross-Validation]
    E --> F[Feature Importance]
    F --> G[Correlation Graph]

    subgraph "Core Learning"
        D --> H[Tree Building]
        H --> I[Loss Optimization]
        I --> J[Regularization]
        J --> K[Model Update]
    end
```

## 🧮 Learning Process

1. **Feature Engineering**

    - Time-series alignment
    - Missing value handling using forward fill
    - Feature scaling: \( x\_{scaled} = \frac{x - \mu}{\sigma} \)

2. **XGBoost Configuration**

    ```
    params = {
        'max_depth': 6,
        'learning_rate': 0.1,
        'objective': 'reg:squarederror',
        'tree_method': 'hist',
        'eval_metric': ['rmse', 'mae']
    }
    ```

3. **Cross-Validation**

    - Time-series based k-fold
    - RMSE minimization:
      \[
      RMSE = \sqrt{\frac{1}{n}\sum\_{i=1}^n(y_i - \hat{y}\_i)^2}
      \]

4. **Feature Importance**
    - Gain-based importance:
      \[
      Gain*f = \sum*{t \in T} gain_t \cdot \mathbb{1}[split_t = f]
      \]
      where \(T\) is the set of trees

## 📊 Correlation Analysis

The model builds a weighted directed graph \(G(V,E)\) where:

- \(V\): Set of satellite and solar parameters
- \(E\): Weighted edges representing correlation strength
- Weight calculation:
  \[
  w*{ij} = \alpha \cdot corr*{ij} + (1-\alpha) \cdot gain\_{ij}
  \]

## 🎯 Performance Metrics

1. **Model Quality**
   \[
   Q = \frac{1}{m}\sum\_{i=1}^m \frac{gain_i}{\sigma_i^2}
   \]

2. **Correlation Significance**
   \[
   S*{ij} = |corr*{ij}| \cdot \sqrt{\frac{n-2}{1-corr\_{ij}^2}}
   \]

## 🔄 Optimization Loop

```
stateDiagram-v2
    [*] --> FeatureSelection
    FeatureSelection --> ModelTraining
    ModelTraining --> CrossValidation
    CrossValidation --> FeatureImportance
    FeatureImportance --> ThresholdOptimization
    ThresholdOptimization --> GraphConstruction
    GraphConstruction --> [*]
```

## 🎛️ Hyperparameters

| Parameter        | Range       | Description                           |
| ---------------- | ----------- | ------------------------------------- |
| learning_rate    | [0.01, 0.3] | Step size shrinkage                   |
| max_depth        | [3, 10]     | Maximum tree depth                    |
| min_child_weight | [1, 7]      | Minimum sum of instance weight        |
| subsample        | [0.5, 1.0]  | Subsample ratio of training instances |
| colsample_bytree | [0.5, 1.0]  | Subsample ratio of columns            |

```

The model focuses on discovering complex non-linear relationships between satellite telemetry and solar activity while maintaining robustness through regularization and cross-validation. The correlation graph provides insights into the strength and direction of these relationships.

```
