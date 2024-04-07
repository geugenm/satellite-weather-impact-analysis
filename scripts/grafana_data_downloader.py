import logging
from pathlib import Path
import time
from typing import List, Tuple

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

import os
from urllib.parse import urlparse, ParseResult

from tqdm import tqdm

# Set up logging
logging.basicConfig(level=logging.INFO)


def create_driver(browser_download_dir: str,
                  headless: bool = True) -> webdriver:
    options = Options()
    if headless:
        options.add_argument("--headless")  # Run in headless mode
    options.set_preference("browser.download.folderList",
                           2)  # Use custom download directory
    options.set_preference("browser.download.dir",
                           browser_download_dir)  # Set custom download directory to the new directory
    options.set_preference("browser.helperApps.neverAsk.saveToDisk",
                           "application/octet-stream")  # Enable automatic download

    return webdriver.Firefox(options=options)


def make_download_dir(url: str, base_dir: str) -> str:
    """Create a custom download directory for a URL and return its absolute path."""
    parsed_url: ParseResult = urlparse(url)
    dir_name: str = os.path.basename(parsed_url.path)
    download_path: str = os.path.join(base_dir, dir_name)
    os.makedirs(download_path, exist_ok=True)
    return download_path


def get_existing_panels(driver: webdriver) -> List[Tuple[int, str]]:
    """Get IDs and titles of existing panels, handling potential exceptions."""
    existing_panels = []
    for panel_id in tqdm(range(100), desc="Identifying panels"):
        try:
            element = driver.find_element(By.ID, f"panel-{panel_id}")
            if 'react-grid-item' in element.get_attribute('class'):
                title_element = element.find_element(By.CLASS_NAME, 'panel-title-text')
                existing_panels.append((panel_id, title_element.text))
        except NoSuchElementException:
            pass  # Ignore panels that don't exist or don't match criteria

    for panel_id, panel_name in existing_panels:
        print(f"Panel ID: {panel_id}, Name: {panel_name}")

    return existing_panels


def process_elements(driver: webdriver) -> None:
    """Process elements in a webpage."""
    try:
        div_selector = 'div[class^="drawer drawer-right drawer-open css-"]'
        button_selector = 'button[class^="css-"][class$="-button"]'

        div = driver.find_element(By.CSS_SELECTOR, div_selector)
        button = div.find_element(By.CSS_SELECTOR, button_selector)
        button.click()
    except Exception as e:
        logging.error(f"An error occurred: {str(e)}")


def scroll_to_element(driver: webdriver, css_selector: str) -> None:
    element = driver.find_element(By.ID, css_selector)
    driver.execute_script("arguments[0].scrollIntoView();", element)


def process_url(url: str, download_dir: str, period_from: str = 'now',
                period_to: str = '9y') -> None:
    clear_url: str = url.split('?')[0]
    download_path: str = make_download_dir(clear_url,
                                           download_dir)

    logging.info("Creating browsing firefox_driver...")
    firefox_driver: webdriver = create_driver(download_path)
    logging.info(f'Set download_directory=[{download_path}]')

    firefox_driver.get(clear_url)

    logging.info("Waiting for page load. Press Ctrl+C to quit...")
    time.sleep(10)

    logging.info(f'Obtaining panels...')
    panels_ids_list: List[Tuple[int, str]] = get_existing_panels(firefox_driver)

    for panel_id, panel_name in panels_ids_list:  # Loop from start to end
        new_url: str = f"{clear_url}?orgId=1&from={period_from}-{period_to}&to=now&inspect={panel_id}"
        firefox_driver.get(new_url)

        try:
            element_present = EC.presence_of_element_located(
                (By.ID, f"panel-{panel_id}"))
            WebDriverWait(firefox_driver, 10).until(element_present)
        except TimeoutException:
            logging.warning(f"timeout: page url=[{url}] is not loaded")
            continue

        scroll_to_element(firefox_driver, f"panel-{panel_id}")

        try:
            element_present = EC.presence_of_element_located(
                (By.CSS_SELECTOR,
                 'button[class^="css-"][class$="-button"]'))
            WebDriverWait(firefox_driver, 10).until(
                element_present)
        except TimeoutException:
            logging.warning(
                f"timeout: panel=[{panel_name}] download button is not found, url=[{new_url}]")
            continue

        logging.info(f"panel=[{panel_name}]: downloading...")
        process_elements(firefox_driver)

    firefox_driver.quit()


if __name__ == '__main__':
    # Satellites dashboard catalog: https://dashboard.satnogs.org/d/QjDe5S8mk/satellite-telemetries?orgId=1
    urls: List[str] = [
        'https://dashboard.satnogs.org/d/TauG79dWz/grifex?orgId=1&from=now-9y&to=now']
    download_dir: str = './data/'
    for url in urls:
        logging.info(f"Downloading data from [{url}]")
        process_url(url, download_dir)
