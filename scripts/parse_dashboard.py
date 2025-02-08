from playwright.sync_api import sync_playwright
from pathlib import Path
import logging
import time
from urllib.parse import urlparse
from tqdm import tqdm

# Configuration
DOWNLOAD_BASE_DIR = Path("downloads/sat").absolute()
SATELLITE_URLS = [
    "https://dashboard.satnogs.org/d/qqOgteuSz/enso",
    "https://dashboard.satnogs.org/d/TauG79dWz/grifex",
    "https://dashboard.satnogs.org/d/YdbN_3D4z/greencube",
    "https://dashboard.satnogs.org/d/abEVHMIIk/veronika",
    "https://dashboard.satnogs.org/d/XfQj4RD7z/cute",
    "https://dashboard.satnogs.org/d/iXL8Q0lGk/grbalpha",
    "https://dashboard.satnogs.org/d/Quq4Bi6nk/ctim",
    "https://dashboard.satnogs.org/d/D2TbAJXmz/csim-fd",
]

TIME_PERIODS = {"from": "now", "to": "4y"}
TIMEOUTS = {"page_load": 10000, "panel_wait": 10000, "download": 10000}

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def _get_panels(page):
    panels = []
    for panel_id in tqdm(range(100), desc="Identifying panels"):
        try:
            panel = page.locator(f"#panel-{panel_id}")
            if panel.count() > 0 and "react-grid-item" in panel.get_attribute(
                "class"
            ):
                title = panel.locator(".panel-title-text")
                if title.count() > 0:
                    panels.append((panel_id, title.inner_text()))
        except Exception as e:
            logger.error(f"panel '{panel_id}' error: {e}")
    return panels


def _download_panel(page):
    js_script = """
    (() => {
        const xpaths = {
            dataOptions: "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/div/div/div/div",
            inputField: '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-input") + 1) = "-input"]',
            firstOption: '//*[starts-with(@id, "react-select-") and substring(@id, string-length(@id) - string-length("-option-0") + 1) = "-option-0"]',
            downloadButton: "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button"
        };

        return (async () => {
            for (const [key, xpath] of Object.entries(xpaths)) {
                const element = document.evaluate(xpath, document, null,
                    XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
                if (element) {
                    element.click();
                    await new Promise(r => setTimeout(r, 500));
                }
            }
        })();
    })()
    """
    page.evaluate(js_script)
    time.sleep(TIMEOUTS["download"] / 1000)


def process_url(context, url: str, download_dir: Path):
    page = context.new_page()
    page_url = f"{url}?orgId=1&from={TIME_PERIODS['from']}-{TIME_PERIODS['to']}&to={TIME_PERIODS['from']}"

    try:
        page.goto(page_url, wait_until="networkidle")

        for panel_id, panel_name in _get_panels(page):
            try:
                inspect_url = f"{page_url}&inspect={panel_id}"
                page.goto(inspect_url, wait_until="networkidle")

                logger.info(f"downloading '{panel_name}'...")

                with page.expect_download() as download_info:
                    _download_panel(page)
                download = download_info.value

                download.save_as(
                    download_dir / f"{panel_name}_{int(time.time())}.csv"
                )

                print(
                    f"Saving {download_dir}/{panel_name}_{int(time.time())}.csv"
                )

            except Exception as e:
                logger.error(f"panel '{panel_name}' error: {e}")

    except Exception as e:
        logger.error(f"page load error: {e}")
    finally:
        page.close()


def main():
    for url in SATELLITE_URLS:
        base_url = url.split("?")[0]
        download_dir = DOWNLOAD_BASE_DIR / Path(urlparse(base_url).path).name
        download_dir.mkdir(parents=True, exist_ok=True)

        with sync_playwright() as p:
            browser = p.chromium.launch(headless=True)
            context = browser.new_context(
                accept_downloads=True, viewport={"width": 1920, "height": 1080}
            )

            try:
                logger.info(f"processing '{base_url}' -> '{download_dir}'")
                process_url(context, base_url, download_dir)
            except Exception as e:
                logger.error(f"browser error: {e}")
            finally:
                context.close()
                browser.close()


if __name__ == "__main__":
    main()
