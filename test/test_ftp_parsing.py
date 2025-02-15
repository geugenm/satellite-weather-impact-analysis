from astra.fetch.sun.indicies import fetch_filtered_files_and_content

import pytest
import pandas as pd
from unittest.mock import Mock, patch
import ftplib


@pytest.fixture
def mock_ftp():
    with patch("ftplib.FTP") as mock:
        ftp_instance = Mock()
        mock.return_value.__enter__.return_value = ftp_instance
        yield ftp_instance


@pytest.fixture
def sample_data():
    return {
        "files": [
            "2024_test_name.txt",
            "2023_another_name.txt",
            "2025_test_name.txt",
        ],
        "content": "mock_content\nline2\nline3",
    }


def test_fetch_filtered_files_success(mock_ftp, sample_data):
    mock_ftp.nlst.return_value = sample_data["files"]
    mock_ftp.retrlines.side_effect = lambda cmd, callback: [
        callback(line) for line in sample_data["content"].split("\n")
    ]

    with patch("astra.fetch.sun.indicies.extract_data_regex") as mock_extract:
        mock_extract.return_value = pd.DataFrame({"col1": [1, 2]})

        result = fetch_filtered_files_and_content(
            url="ftp://test.com/path", year_from=2023, name="test_name"
        )

        assert isinstance(result, pd.DataFrame)
        assert mock_ftp.login.called
        assert mock_ftp.cwd.called
        assert (
            len(mock_extract.mock_calls) == 2
        )  # called for 2024 and 2025 files


@pytest.mark.parametrize("error_method", ["login", "cwd", "nlst"])
def test_fetch_filtered_files_ftp_errors(mock_ftp, error_method):
    getattr(mock_ftp, error_method).side_effect = ftplib.Error(
        "Connection failed"
    )

    with pytest.raises(ftplib.Error):
        fetch_filtered_files_and_content(
            url="ftp://test.com/path", year_from=2023, name="test_name"
        )
