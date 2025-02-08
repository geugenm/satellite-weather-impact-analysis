import argparse
from playwright.sync_api import sync_playwright
from pathlib import Path
import logging
import time
from urllib.parse import urlparse, parse_qs, urlencode, ParseResult
from collections.abc import Mapping
import yaml

DOWNLOAD_BASE_DIR = Path("downloads/sat").absolute()
CONFIG_DIR = Path("cfg").absolute()
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


def init_argparse() -> argparse.ArgumentParser:
    """Initialize argument parser with examples that even a monkey could understand"""
    parser = argparse.ArgumentParser(
        description="Extract data from Grafana or die trying",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples that won't make you look stupid:

Study Mode (saves panel info to cfg/<satellite>.yaml):
    %(prog)s --study "https://dashboard.satnogs.org/d/abEVHMIIk/veronika"
    %(prog)s --study "https://dashboard.satnogs.org/d/TauG79dWz/grifex"

Download Specific Panel:
    %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika?viewPanel=26&orgId=1"
    %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika?viewPanel=11&from=now-5y&to=now"

How to Fail:
    %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika"  # Missing --study or viewPanel

Note:
    If you're too dumb to provide either --study or a panel URL,
    I'll tell you to fuck off with a helpful error message.
    """,
    )
    parser.add_argument(
        "url",
        help="Grafana dashboard URL. For fuck's sake, make sure it's valid",
    )
    parser.add_argument(
        "--study",
        action="store_true",
        help="Just study the panels without downloading.",
    )
    return parser


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


def scan_grafana_panels(page, url: str) -> dict:
    """Scan Grafana dashboard panels and return their info in YAML format"""

    parsed = urlparse(url)
    base_url = f"{parsed.scheme}://{parsed.netloc}{parsed.path.split('?')[0]}"

    page.goto(base_url, wait_until="networkidle")

    scripts = {
        name: Path(f"{name}.js").read_text(encoding="utf-8")
        for name in ["expand_all", "get_all_panels"]
    }

    page.wait_for_selector("div.react-grid-layout", timeout=10000)

    expanded = page.evaluate(scripts["expand_all"])
    logging.info(f"Expanded {expanded} collapsed rows")
    time.sleep(1)  # Wait for expansion

    panels = page.evaluate(scripts["get_all_panels"])

    panel_info = {
        "dashboard": base_url.split("/")[-1],
        "panels": [
            {"id": panel["id"], "name": panel["title"], "type": panel["type"]}
            for panel in panels
            if panel["type"] == "panel"  # Filter out row headers
        ],
    }

    return panel_info


def process_grafana_url(url: str, study_mode: bool = False):
    """Process Grafana URL like a boss"""
    parsed = urlparse(url)
    sat_name = parsed.path.split("/")[-1]

    if study_mode:
        CONFIG_DIR.mkdir(exist_ok=True)
        output_file = CONFIG_DIR / f"{sat_name}.yaml"
    else:
        download_dir = DOWNLOAD_BASE_DIR / sat_name
        download_dir.mkdir(parents=True, exist_ok=True)
        url = transform_to_data_view(url)

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(
            accept_downloads=True, viewport={"width": 1920, "height": 1080}
        )

        try:
            page = context.new_page()
            if study_mode:
                panel_info = scan_grafana_panels(page, url)
                panel_info["url"] = url  # Add base URL to YAML
                yaml_content = yaml.dump(
                    panel_info, sort_keys=False, allow_unicode=True
                )
                output_file.write_text(yaml_content)
                logger.info(f"Panel info saved to {output_file}")
            else:
                page.goto(url, wait_until="networkidle")
                download_panel_data(page, download_dir)

        except Exception as e:
            logger.error(f"Failed because: {str(e)}")
        finally:
            context.close()
            browser.close()


if __name__ == "__main__":
    parser = init_argparse()
    args = parser.parse_args()

    process_grafana_url(args.url, args.study)
