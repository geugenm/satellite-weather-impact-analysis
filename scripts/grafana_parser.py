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

logging.basicConfig(level=logging.INFO)


def create_driver(browser_download_dir: str, headless: bool = True) -> webdriver:
    options = Options()
    if headless:
        options.add_argument("--headless")
    options.set_preference("browser.download.folderList", 2)
    options.set_preference("browser.download.dir", browser_download_dir)
    options.set_preference(
        "browser.helperApps.neverAsk.saveToDisk", "application/octet-stream"
    )

    try:
        driver = webdriver.Firefox(options=options)
        return driver
    except WebDriverException as e:
        logging.exception(f"failed to create WebDriver: {e}")
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


def click_on_download_button_on_panel(driver: webdriver) -> None:
    div_selector = 'div[class^="drawer drawer-right drawer-open css-"]'
    button_selector = 'button[class^="css-"][class$="-button"]'

    try:
        div = driver.find_element(By.CSS_SELECTOR, div_selector)
        button = div.find_element(By.CSS_SELECTOR, button_selector)
        button.click()
        logging.info("download button clicked successfully.")
    except NoSuchElementException as e:
        logging.exception(f"download button not found: {e}")
    except Exception as e:
        logging.exception(e)


def scroll_to_element(driver: webdriver, css_selector: str) -> None:
    try:
        element = driver.find_element(By.ID, css_selector)
        driver.execute_script("arguments[0].scrollIntoView();", element)
    except NoSuchElementException as e:
        logging.exception(f"element '{css_selector}' not found: {e}")
    except Exception as e:
        logging.exception(e)


def process_url(
    driver: webdriver, url: str, period_from: str = "now", period_to: str = "1y"
) -> None:
    try:
        driver.get(url)
    except Exception as e:
        logging.exception(f"failed to load '{url}': {e}")

    logging.info("Waiting for page load. Press Ctrl+C to quit...")
    time.sleep(10)

    logging.info("obtaining panels...")
    panels_ids_list: list = get_existing_panels(driver)

    satellite_page: str = (
        f"{url}?orgId=1&from={period_from}-{period_to}&to=now&inspect="
    )

    for panel_id, panel_name in panels_ids_list:
        new_url: str = f"{satellite_page}{panel_id}"

        try:
            driver.get(new_url)
        except Exception as e:
            logging.exception(e)

        wait_timeout: int = 10
        try:
            WebDriverWait(driver, wait_timeout).until(
                EC.presence_of_element_located((By.ID, f"panel-{panel_id}"))
            )

            WebDriverWait(driver, wait_timeout).until(
                EC.presence_of_element_located(
                    (By.CSS_SELECTOR, 'button[class^="css-"][class$="-button"]')
                )
            )
        except TimeoutException as e:
            logging.exception(f"failed to load '{panel_name}': {e}")
            continue

        scroll_to_element(driver, f"panel-{panel_id}")

        logging.info(f"Panel '{panel_name}' data preparing to download...")
        click_on_download_button_on_panel(driver)


if __name__ == "__main__":
    sat_urls: list = [
        "https://dashboard.satnogs.org/d/anRdyz9Vk/cubebel-1?orgId=1&refresh=30s&from=now-6y&to=now"
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
