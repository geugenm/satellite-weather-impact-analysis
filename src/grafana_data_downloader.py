import argparse
import logging
import os
from pathlib import Path
from typing import List

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

# Constants
BASE_DOWNLOAD_DIR = Path.home() / 'MyDownloads'

# Set up logging
logging.basicConfig(level=logging.INFO)

# Create argument parser
parser = argparse.ArgumentParser(description='Web scraping script')

# Add arguments
parser.add_argument('--url', type=str, required=True, help='Base URL to scrape')

# Parse arguments
args = parser.parse_args()


def create_driver(
        browser_download_dir: os.path = BASE_DOWNLOAD_DIR) -> webdriver:
    options: Options = Options()
    options.add_argument("--headless")  # Run in headless mode
    options.set_preference("browser.download.folderList",
                           2)  # Use custom download directory
    options.set_preference("browser.download.dir",
                           browser_download_dir)  # Set custom download directory to the new directory
    options.set_preference("browser.helperApps.neverAsk.saveToDisk",
                           "application/octet-stream")  # Enable automatic download

    # Initialize the driver with the listener
    return webdriver.Firefox(options=options)


def execute_script_from_file(driver: webdriver, file_path: str) -> None:
    if not Path(file_path).is_file():
        raise FileNotFoundError(file_path)

    if not file_path.endswith('.js'):
        raise RuntimeError(f"Given file is not js: {file_path}")

    with open(file_path, 'r') as f:
        script = f.read()

    driver.execute_script(script)


def get_clear_url(url: str) -> str:
    return url.split('?')[0]


def make_custom_download_dir_for_url_and_get_it(url: str) -> os.path:
    dir_name: str = url.split('/')[-1]
    Path(dir_name).mkdir(exist_ok=True)
    return os.path.abspath(dir_name)


def get_existing_panels(driver: webdriver) -> List[int]:
    existing_panels: List[int] = []

    for i in range(
            101):  # The range starts from 0, so 101 is needed to reach 100
        element_id = f"panel-{i}"
        try:
            element = driver.find_element(By.ID, element_id)
            if 'react-grid-item' in element.get_attribute('class'):
                existing_panels.append(i)
        except NoSuchElementException:
            continue

    return existing_panels


def process_elements(driver):
    try:
        # Define the CSS selectors
        div_selector = 'div[class^="drawer drawer-right drawer-open css-"]'
        button_selector = 'button[class^="css-"][class$="-button"]'

        # Find the div
        div = driver.find_element(By.CSS_SELECTOR, div_selector)

        # Print div details
        print(f"Processing div number: 1")
        print(f"Div Classes: {div.get_attribute('class')}")

        # Find the button within the div
        button = div.find_element(By.CSS_SELECTOR, button_selector)

        # Print button details and click the button
        print(f"Processing button number: 1 in div number: 1")
        print(f"Button Classes: {button.get_attribute('class')}")
        print(f"Clicking button: {button.get_attribute('class')}")
        button.click()
    except Exception as e:
        print(f"An error occurred: {str(e)}")


# Main script
if __name__ == '__main__':
    parsed_url = args.url
    clear_url: str = get_clear_url(parsed_url)

    download_path: os.path = make_custom_download_dir_for_url_and_get_it(
        clear_url)

    print(download_path)

    firefox_driver = create_driver(download_path)

    print(clear_url)

    firefox_driver.get(clear_url)
    panels_ids_list: List[int] = get_existing_panels(firefox_driver)

    print(panels_ids_list)

    for i in panels_ids_list:  # Loop from start to end
        # Construct the new URL
        new_url = f"{clear_url}?orgId=1&from=now-5y&to=now&inspect={i}"

        # Navigate to the new URL
        firefox_driver.get(new_url)

        # Wait for the button to appear
        try:
            WebDriverWait(firefox_driver, 10).until(
                EC.presence_of_element_located((By.CSS_SELECTOR,
                                                'button[class^="css-"][class$="-button"]')))
        except TimeoutException:
            logging.warning("Button did not appear within the 6 second window.")
            continue  # Skip to the next iteration

        logging.info(f"Downloading {new_url}")

        process_elements(firefox_driver)

    firefox_driver.quit()
