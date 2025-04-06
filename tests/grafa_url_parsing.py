from urllib.parse import parse_qs, urlparse
from astra.fetch.satnogs.url import build_inspection_url, parse_grafana_url
import pytest


class TestParseGrafanaUrl:
    @pytest.mark.parametrize(
        "url,expected",
        [
            (
                "http://example.com/dashboard?from=2023-01-01&to=2023-01-02",
                {
                    "base_url": "http://example.com/dashboard",
                    "from": "2023-01-01",
                    "to": "2023-01-02",
                },
            ),
            (
                "http://example.com/dashboard",
                {
                    "base_url": "http://example.com/dashboard",
                    "from": "",
                    "to": "",
                },
            ),
            (
                "http://example.com/dashboard?from=&to=",
                {
                    "base_url": "http://example.com/dashboard",
                    "from": "",
                    "to": "",
                },
            ),
            (
                "http://example.com/dashboard?from=2023-01-01",
                {
                    "base_url": "http://example.com/dashboard",
                    "from": "2023-01-01",
                    "to": "",
                },
            ),
        ],
    )
    def test_parse_grafana_url_valid(self, url, expected):
        result = parse_grafana_url(url)
        assert result == expected

    @pytest.mark.parametrize(
        "url,error_message",
        [
            ("invalid-url", "Invalid URL structure: invalid-url"),
            ("/dashboard", "Invalid URL structure: /dashboard"),
        ],
    )
    def test_parse_grafana_url_invalid_structure(self, url, error_message):
        with pytest.raises(ValueError, match=error_message):
            parse_grafana_url(url)


class TestBuildInspectionUrl:
    @pytest.mark.parametrize(
        "base_url, panel_id, time_from, time_to, expected_url",
        [
            # Base case with minimal params
            (
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex",
                "66",
                None,
                None,
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex?"
                "inspect=66&inspectTab=data&viewPanel=66",
            ),
            # With time parameters
            (
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex",
                "66",
                "now-24h",
                "now",
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex?"
                "inspect=66&inspectTab=data&viewPanel=66"
                "&from=now-24h&to=now",
            ),
            # With existing var- params
            (
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex?var-env=prod",
                "66",
                None,
                None,
                "https://dashboard.satnogs.org/d/TauG79dWz/grifex?"
                "var-env=prod&"
                "inspect=66&inspectTab=data&viewPanel=66",
            ),
            # Full complex case
            (
                "http://localhost:3000/dash?var-team=devops",
                "memory",
                "now-7d",
                "now-1h",
                "http://localhost:3000/dash?"
                "var-team=devops&"
                "inspect=memory&inspectTab=data&viewPanel=memory"
                "&from=now-7d&to=now-1h",
            ),
        ],
    )
    def test_urls(self, base_url, panel_id, time_from, time_to, expected_url):
        result = build_inspection_url(base_url, panel_id, time_from, time_to)
        assert result == expected_url
