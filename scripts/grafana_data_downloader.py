import argparse
import logging
import threading
from pathlib import Path
from typing import List

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

# Set up logging
logging.basicConfig(level=logging.INFO)

# Create argument parser
parser = argparse.ArgumentParser(description='Web scraping script')


def create_driver(
        browser_download_dir) -> webdriver:
    """Create a Firefox webdriver with custom options."""
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
    """Execute a JavaScript script from a file."""
    if not Path(file_path).is_file():
        raise FileNotFoundError(file_path)

    if not file_path.endswith('.js'):
        raise RuntimeError(f"Given file is not js: {file_path}")

    with open(file_path, 'r') as f:
        script = f.read()

    driver.execute_script(script)


def get_clear_url(url: str) -> str:
    """Remove query parameters from a URL."""
    return url.split('?')[0]


def make_custom_download_dir_for_url_and_get_it(url: str) -> str:
    """Create a custom download directory for a URL and return its absolute path."""
    dir_name: str = url.split('/')[-1]
    Path(dir_name).mkdir(exist_ok=True)
    return str(Path(dir_name).absolute())


def get_existing_panels(driver: webdriver) -> List[int]:
    """Get IDs of existing panels."""
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


def process_elements(driver: webdriver) -> None:
    """Process elements in a webpage."""
    try:
        # Define the CSS selectors
        div_selector = 'div[class^="drawer drawer-right drawer-open css-"]'
        button_selector = 'button[class^="css-"][class$="-button"]'

        # Find the div
        div = driver.find_element(By.CSS_SELECTOR, div_selector)

        # Find the button within the div
        button = div.find_element(By.CSS_SELECTOR, button_selector)

        button.click()
    except Exception as e:
        print(f"An error occurred: {str(e)}")


def read_urls_from_config(config_path: str) -> List[str]:
    """Read URLs from a configuration file."""
    with open(config_path, 'r') as f:
        urls = [line.strip() for line in f]
    return urls


def process_url(url):
    clear_url: str = get_clear_url(url)
    download_path: str = make_custom_download_dir_for_url_and_get_it(clear_url)
    print(f"download_path: {download_path}")
    firefox_driver = create_driver(download_path)
    print(f"clear_url: {clear_url}")
    firefox_driver.get(clear_url)
    panels_ids_list: List[int] = get_existing_panels(firefox_driver)
    print(f"panels_ids_list: {panels_ids_list}")
    for i in panels_ids_list:  # Loop from start to end
        new_url = f"{clear_url}?orgId=1&from=now-5y&to=now&inspect={i}"
        firefox_driver.get(new_url)
        try:
            WebDriverWait(firefox_driver, 2).until(
                EC.presence_of_element_located((By.CSS_SELECTOR,
                                                'button[class^="css-"][class$="-button"]')))
        except TimeoutException:
            logging.warning("Button did not appear within the 2 second window.")
            continue
        logging.info(f"Downloading data from {new_url}")
        process_elements(firefox_driver)
    firefox_driver.quit()


if __name__ == '__main__':
    urls = read_urls_from_config('satellite_pages.txt')
    threads = []
    for url in urls:
        t = threading.Thread(target=process_url, args=(url,))
        threads.append(t)
        t.start()
    for t in threads:
        t.join()
