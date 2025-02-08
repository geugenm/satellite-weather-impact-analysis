from playwright.sync_api import sync_playwright
from pathlib import Path
import logging
import time
from urllib.parse import urlparse, parse_qs, urlencode, ParseResult
from collections.abc import Mapping

DOWNLOAD_BASE_DIR = Path("downloads/sat").absolute()
TIMEOUTS = {
    "page_load": 10000,
    "panel_wait": 10000,
    "download": 10000,
    "animation": 500,
}

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def transform_to_data_view(url: str) -> str:
    parsed: ParseResult = urlparse(url)
    params: Mapping[str, list[str]] = parse_qs(
        parsed.query, keep_blank_values=True
    )

    panel_values: list[str] = params.get("viewPanel", [])
    if not panel_values:
        raise ValueError(f"No panel number found in URL '{url}'")

    panel_num: str = panel_values[0]
    if not panel_num:
        raise ValueError(f"Empty panel number in URL '{url}'")

    data_params: dict[str, list[str]] = {
        "inspect": [panel_num],
        "inspectTab": ["data"],
        "viewPanel": [panel_num],
        "orgId": ["1"],
        "from": params.get("from", ["now-2y"]),
        "to": params.get("to", ["now"]),
    }

    for key, value in params.items():
        if key.startswith("var-"):
            data_params[key] = value

    query: str = urlencode(data_params, doseq=True)
    return f"{parsed.scheme}://{parsed.netloc}{parsed.path}?{query}"


def download_panel_data(page, download_dir: Path) -> bool:
    """Hunt down and murder that download button regardless of its disguise"""

    js_code = Path("download_panel.js").read_text(encoding="utf-8")

    try:
        with page.expect_download(timeout=10000) as download_info:
            page.evaluate(js_code)

        download = download_info.value
        timestamp = int(time.time())
        panel_name = page.title().replace(" - Grafana", "").strip()
        file_path = download_dir / f"{panel_name}_{timestamp}.csv"

        download.save_as(file_path)
        logger.info(f"Successfully downloaded to {file_path}")
        return True

    except Exception as e:
        logger.error(f"Download failed with error: {str(e)}")
        return False


def process_grafana_url(url: str, download_dir: Path):
    """Process single Grafana dashboard URL"""
    url = transform_to_data_view(url)

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(
            accept_downloads=True, viewport={"width": 1920, "height": 1080}
        )

        try:
            page = context.new_page()
            page.goto(url, wait_until="networkidle")

            download_panel_data(page, download_dir)

        except Exception as e:
            logger.error(f"Failed to process URL: {str(e)}")
        finally:
            context.close()
            browser.close()


if __name__ == "__main__":
    url = "https://dashboard.satnogs.org/d/abEVHMIIk/veronika?viewPanel=26&orgId=1&from=now-2y&to=now&var-suid=58261"
    download_dir = DOWNLOAD_BASE_DIR / "veronika"
    download_dir.mkdir(parents=True, exist_ok=True)

    process_grafana_url(url, download_dir)
