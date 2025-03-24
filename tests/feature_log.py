import pytest
import pandas as pd
import numpy as np
from unittest.mock import patch
from astra.model.cross_correlation import XCorr


@pytest.fixture
def mock_log_params():
    with patch("astra.model.cross_correlation.log_params") as mock:
        yield mock


@pytest.fixture
def xcorr_instance(mock_log_params):
    dataset_metadata = {
        "analysis": {"feature_columns": ["feature1", "feature2", "feature3"]}
    }

    cross_correlation_params = {
        "random_state": 42,
        "test_size": 0.2,
        "model_params": {"n_estimators": 100},
        "regressor_name": "XGBoosting",
    }

    xcorr = XCorr(dataset_metadata, cross_correlation_params)
    xcorr._importances_map = pd.DataFrame()
    return xcorr


def test_log_feature_importances(xcorr_instance):
    # Prepare test data
    df_in = pd.DataFrame(
        {"feature1": [1, 2, 3], "feature2": [4, 5, 6], "feature3": [7, 8, 9]}
    )
    feature_importances = np.array([0.3, 0.5, 0.2])
    target_name = "target"

    # Call the method
    xcorr_instance._log_feature_importances(
        df_in, feature_importances, target_name
    )

    # Assertions
    assert xcorr_instance._importances_map is not None
    assert isinstance(xcorr_instance._importances_map, pd.DataFrame)
    assert xcorr_instance._importances_map.index.tolist() == [target_name]
    assert set(xcorr_instance._importances_map.columns.tolist()) == {
        "feature1",
        "feature2",
        "feature3",
        target_name,
    }
    assert xcorr_instance._importances_map.loc[target_name, "feature1"] == 0.3
    assert xcorr_instance._importances_map.loc[target_name, "feature2"] == 0.5
    assert xcorr_instance._importances_map.loc[target_name, "feature3"] == 0.2
    assert xcorr_instance._importances_map.loc[target_name, target_name] == 0

    # Test with existing importances_map
    existing_importances = pd.DataFrame(
        {"feature4": [0.4], "feature5": [0.6]}, index=["existing_target"]
    )
    xcorr_instance._importances_map = existing_importances

    xcorr_instance._log_feature_importances(
        df_in, feature_importances, target_name
    )

    assert set(xcorr_instance._importances_map.index.tolist()) == {
        "existing_target",
        target_name,
    }
    assert set(xcorr_instance._importances_map.columns.tolist()) == {
        "feature4",
        "feature5",
        "feature1",
        "feature2",
        "feature3",
        target_name,
    }
    assert (
        xcorr_instance._importances_map.loc["existing_target", "feature4"]
        == 0.4
    )
    assert (
        xcorr_instance._importances_map.loc["existing_target", "feature5"]
        == 0.6
    )

    # Test with NaN values
    df_with_nan = pd.DataFrame(
        {
            "feature1": [1, np.nan, 3],
            "feature2": [4, 5, np.nan],
            "feature3": [np.nan, 8, 9],
        }
    )
    feature_importances_with_nan = np.array([0.3, np.nan, 0.2])

    xcorr_instance._log_feature_importances(
        df_with_nan, feature_importances_with_nan, "nan_target"
    )

    assert "nan_target" in xcorr_instance._importances_map.index
    assert xcorr_instance._importances_map.loc["nan_target", "feature1"] == 0.3
    assert xcorr_instance._importances_map.loc["nan_target", "feature3"] == 0.2
    assert xcorr_instance._importances_map.loc["nan_target", "nan_target"] == 0
