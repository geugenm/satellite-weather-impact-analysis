from pathlib import Path
import logging
import time
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from urllib.parse import urlparse
from tqdm import tqdm

# Paths and URLs
DOWNLOAD_BASE_DIR = Path("downloads/sat").absolute()
DOWNLOAD_SCRIPT_PATH = "scripts/download_from_grafana_panel.js"
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

# Time periods and timeouts
TIME_PERIODS = {"from": "now", "to": "9y"}
TIMEOUTS = {"page_load": 10, "panel_wait": 10, "download": 10}

# Browser configuration
FIREFOX_PREFS = {
    "browser.download.folderList": 2,
    "browser.helperApps.neverAsk.saveToDisk": "application/octet-stream",
}

# Panel configuration
PANEL_SCAN_RANGE = 100
PANEL_XPATHS = [
    "//div[@id='panel-{panel_id}']",
    "//div/div[2]/div/div[2]/div[1]/div[1]/button",
    "//div/div[2]/div/div[2]/div[1]/div[2]/div[1]/div/div/div/div[1]",
]

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def _create_driver(download_dir: Path) -> webdriver.Firefox:
    options = Options()
    options.add_argument("--headless")
    for key, value in FIREFOX_PREFS.items():
        options.set_preference(key, value)
    options.set_preference("browser.download.dir", str(download_dir))
    return webdriver.Firefox(options=options)


def _get_panels(driver: webdriver.Firefox) -> list[tuple[int, str]]:
    panels = []
    for panel_id in tqdm(range(PANEL_SCAN_RANGE), desc="Identifying panels"):
        try:
            element = driver.find_element(By.ID, f"panel-{panel_id}")
            if "react-grid-item" in element.get_attribute("class"):
                panels.append(
                    (
                        panel_id,
                        element.find_element(
                            By.CLASS_NAME, "panel-title-text"
                        ).text,
                    )
                )
        except NoSuchElementException:
            continue
        except Exception as e:
            logger.error(f"panel '{panel_id}' error: {e}")
    return panels


def _download_panel(driver: webdriver.Firefox) -> None:
    with open(DOWNLOAD_SCRIPT_PATH) as f:
        driver.execute_script(f.read())
    time.sleep(TIMEOUTS["download"])


def process_url(driver: webdriver.Firefox, url: str) -> None:
    page_url = f"{url}?orgId=1&from={TIME_PERIODS['from']}-{TIME_PERIODS['to']}&to={TIME_PERIODS['from']}"

    try:
        driver.get(page_url)
        time.sleep(TIMEOUTS["page_load"])

        for panel_id, panel_name in _get_panels(driver):
            try:
                driver.get(f"{page_url}&inspect={panel_id}")
                wait = WebDriverWait(driver, TIMEOUTS["panel_wait"])

                for xpath in [
                    xpath.format(panel_id=panel_id) for xpath in PANEL_XPATHS
                ]:
                    wait.until(
                        EC.presence_of_element_located((By.XPATH, xpath))
                    )

                logger.info(f"downloading '{panel_name}'...")
                _download_panel(driver)

            except TimeoutException:
                logger.error(f"timeout on panel '{panel_name}'")
            except Exception as e:
                logger.error(f"panel '{panel_name}' error: {e}")

    except Exception as e:
        logger.error(f"page load error: {e}")


if __name__ == "__main__":
    for url in SATELLITE_URLS:
        base_url = url.split("?")[0]
        download_dir = DOWNLOAD_BASE_DIR / Path(urlparse(base_url).path).name
        download_dir.mkdir(parents=True, exist_ok=True)

        try:
            with _create_driver(download_dir) as driver:
                logger.info(f"processing '{base_url}' -> '{download_dir}'")
                process_url(driver, base_url)
        except Exception as e:
            logger.error(f"driver error: {e}")
