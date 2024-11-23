import logging
import os
import time
from pathlib import Path
from typing import List, Tuple
from urllib.parse import urlparse
from tqdm import tqdm

from selenium import webdriver
from selenium.common.exceptions import (
    NoSuchElementException,
    TimeoutException,
    WebDriverException,
)
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


def create_driver(browser_download_dir: str) -> webdriver:
    options = Options()
    # options.add_argument("--headless")
    options.set_preference("browser.download.folderList", 2)
    options.set_preference("browser.download.dir", browser_download_dir)
    options.set_preference(
        "browser.helperApps.neverAsk.saveToDisk", "application/octet-stream"
    )

    try:
        driver = webdriver.Firefox(options=options)
        return driver
    except WebDriverException as e:
        logging.exception(f"failed to create webdriver: {e}")
        raise


def get_existing_panels(driver: webdriver) -> List[Tuple[int, str]]:
    existing_panels = []

    for panel_id in tqdm(range(100), desc="Identifying panels"):
        try:
            element = driver.find_element(By.ID, f"panel-{panel_id}")
            if "react-grid-item" in element.get_attribute("class"):
                title_element = element.find_element(By.CLASS_NAME, "panel-title-text")
                existing_panels.append((panel_id, title_element.text))
        except NoSuchElementException:
            pass
        except Exception as e:
            logging.exception(f"error retrieving panel '{panel_id}': {e}")

    print(f"Found panels: {existing_panels}")

    return existing_panels


def click_on_download_button_on_panel(driver: webdriver):
    try:
        with open("scripts/download_from_grafana_panel.js") as file:
            js_code = file.read()

        print("Executing js downloading script...")
        driver.execute_script(js_code)
        time.sleep(20)
    except Exception as e:
        logging.exception(e)


def process_url(
    driver: webdriver, url: str, period_from: str = "now", period_to: str = "9y"
) -> None:
    satellite_page: str = (
        f"{url}?orgId=1&from={period_from}-{period_to}&to={period_from}"
    )

    try:
        logging.debug(f"Waiting for page load: '{satellite_page}'")
        driver.get(satellite_page)
        time.sleep(20)
    except Exception as e:
        logging.exception(e)
        return

    panels_ids_list: list = get_existing_panels(driver)

    for panel_id, panel_name in panels_ids_list:
        new_url: str = f"{satellite_page}&inspect={panel_id}"

        wait_timeout: int = 20

        try:
            driver.get(new_url)

            WebDriverWait(driver, wait_timeout).until(
                EC.presence_of_element_located((By.ID, f"panel-{panel_id}"))
            )

            WebDriverWait(driver, wait_timeout).until(
                EC.presence_of_element_located(
                    (
                        By.XPATH,
                        "/html/body/div/div/div[2]/div/div[2]/div[1]/div[1]/button",
                    )
                )
            )

            WebDriverWait(driver, wait_timeout).until(
                EC.presence_of_element_located(
                    (
                        By.XPATH,
                        "/html/body/div/div/div[2]/div/div[2]/div[1]/div[2]/div[1]/div/div/div/div[1]",
                    )
                )
            )

        except TimeoutException as e:
            logging.exception(f"failed to load '{panel_name}': {e}")
            continue
        except Exception as e:
            logging.exception(e)

        logging.info(f"downloading '{panel_name}' data...")
        click_on_download_button_on_panel(driver)


if __name__ == "__main__":
    sat_urls: list[str] = [
        "https://dashboard.satnogs.org/d/eWnadSeik/irazu?orgId=1&from=now-9y&to=now",
    ]

    for sat_url in sat_urls:
        clear_url: str = sat_url.split("?")[0]

        parsed_url = urlparse(clear_url)
        dir_name = os.path.basename(parsed_url.path)
        download_location = Path("downloads").absolute() / Path(dir_name)

        firefox_driver = create_driver(str(download_location))

        logging.info(
            f"downloading data from '{clear_url}', using dir '{download_location}'"
        )
        process_url(firefox_driver, clear_url)
