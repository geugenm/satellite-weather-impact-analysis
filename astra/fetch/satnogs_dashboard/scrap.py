from playwright.sync_api import sync_playwright
from pathlib import Path
import logging
import time
from urllib.parse import urlparse, parse_qs, urlencode, ParseResult
from collections.abc import Mapping
import yaml

from astra.config.data import DataConfig, get_project_config

config: DataConfig = get_project_config()

DOWNLOAD_BASE_DIR = config.fetch.raw
CONFIG_DIR = config.fetch.base_dir / "map"
TIMEOUTS = {
    "page_load": 10000,
    "panel_wait": 10000,
    "download": 10000,
    "animation": 500,
}


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


def extract_panel_title(page) -> str:
    """Extract the actual panel title from the DOM"""
    try:
        title_element = page.locator(".panel-title-text").first
        return title_element.inner_text() if title_element else "untitled_panel"
    except Exception as e:
        logging.warning(f"Failed to extract panel title: {str(e)}")
        return "unknown_panel"


def download_panel_data(page, download_dir: Path) -> bool:
    """Hunt down and murder that download button regardless of its disguise"""
    js_code = Path(
        Path(__file__).resolve().parent / "download_panel.js"
    ).read_text(encoding="utf-8")

    try:
        with page.expect_download(timeout=10000) as download_info:
            page.evaluate(js_code)

        download = download_info.value
        timestamp = int(time.time())
        panel_name = extract_panel_title(page)
        sanitized_name = "".join(c if c.isalnum() else "_" for c in panel_name)
        file_path = download_dir / f"{sanitized_name}_{timestamp}.csv"

        download.save_as(file_path)
        logging.info(f"Successfully downloaded to {file_path}")
        return True

    except Exception as e:
        logging.error(f"Download failed with error: {str(e)}")
        return False


def scan_grafana_panels(page, url: str) -> dict:
    """Scan Grafana dashboard panels and return their info in YAML format"""
    parsed = urlparse(url)
    base_url = f"{parsed.scheme}://{parsed.netloc}{parsed.path.split('?')[0]}"

    page.goto(base_url, wait_until="networkidle")
    scripts = {
        name: Path(Path(__file__).resolve().parent / f"{name}.js").read_text(
            encoding="utf-8"
        )
        for name in ["expand_all", "get_all_panels"]
    }

    page.wait_for_selector("div.react-grid-layout", timeout=10000)
    expanded = page.evaluate(scripts["expand_all"])
    logging.info(f"expanded {expanded} collapsed rows")
    time.sleep(1)  # Wait for expansion

    panels = page.evaluate(scripts["get_all_panels"])

    # Process each panel to get its actual title
    processed_panels = []
    for panel in panels:
        if panel["type"] == "panel":
            try:
                page.goto(
                    f"{base_url}?viewPanel={panel['id']}",
                    wait_until="networkidle",
                )
                actual_title = extract_panel_title(page)
                processed_panels.append(
                    {"id": panel["id"], "name": actual_title, "type": "panel"}
                )
                logging.info(
                    f"discovered panel '{actual_title}' [id={panel['id']}]"
                )
            except Exception as e:
                logging.exception(
                    f"failed to extract title for panel [id={panel['id']}]: {str(e)}"
                )
                processed_panels.append(panel)

    panel_info = {
        "dashboard": base_url.split("/")[-1],
        "url": url,
        "panels": processed_panels,
    }

    return panel_info


def process_grafana_url(url: str, study_mode: bool = False) -> None:
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
                logging.info(f"saved config to '{output_file}'")
            else:
                page.goto(url, wait_until="networkidle")
                download_panel_data(page, download_dir)

        except Exception as e:
            logging.error(f"operation failed: {str(e)}")
        finally:
            context.close()
            browser.close()


def process_config_file(config_path: Path) -> None:
    """Process all panels from a config file because you're too lazy to do it manually"""
    try:
        config = yaml.safe_load(config_path.read_text())
        base_url = config["url"]

        for panel in config["panels"]:
            panel_url = f"{base_url}?viewPanel={panel['id']}"
            logging.info(f"processing '{panel['name']}' [id={panel['id']}]")
            process_grafana_url(panel_url, study_mode=False)
            time.sleep(1)  # Don't DoS their server, asshole

    except Exception as e:
        logging.error(f"config '{config_path}' processing failed: {str(e)}")


if __name__ == "__main__":
    import argparse

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

                Download All Panels from Config:
                    %(prog)s --config cfg/veronika.yaml

                How to Fail:
                    %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika"  # Missing --study or viewPanel
                    %(prog)s --config nonexistent.yaml  # Being a moron with file paths
                    """,
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "url",
        nargs="?",
        help="Grafana dashboard URL. For fuck's sake, make sure it's valid",
    )
    group.add_argument(
        "--config",
        type=Path,
        help="YAML config file with panel definitions. Use --study first",
    )
    parser.add_argument(
        "--study",
        action="store_true",
        help="Just study the panels without downloading.",
    )
    args = parser.parse_args()

    if args.config:
        if not args.config.exists():
            logging.error(f"Config file {args.config} doesn't exist, genius")
            exit(1)
        process_config_file(args.config)
    else:
        process_grafana_url(args.url, args.study)
