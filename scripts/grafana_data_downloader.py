import logging
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


def get_clear_url(url: str) -> str:
    """Remove query parameters from a URL."""
    return url.split('?')[0]


# Todo: make it download to ../data/<dir_name>
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
        div_selector: str = 'div[class^="drawer drawer-right drawer-open css-"]'
        button_selector: str = 'button[class^="css-"][class$="-button"]'

        div = driver.find_element(By.CSS_SELECTOR, div_selector)

        button = div.find_element(By.CSS_SELECTOR, button_selector)

        button.click()
    except Exception as e:
        print(f"An error occurred: {str(e)}")


def process_url(url: str):
    clear_url: str = get_clear_url(url)
    print(f"clear_url: {clear_url}")
    download_path: str = make_custom_download_dir_for_url_and_get_it(clear_url)
    print(f"download_path: {download_path}")
    firefox_driver = create_driver(download_path)
    firefox_driver.get(clear_url)
    panels_ids_list: List[int] = get_existing_panels(firefox_driver)
    print(f"panels_ids_list: {panels_ids_list}")
    for i in panels_ids_list:  # Loop from start to end
        period_from: str = 'now'
        period_to: str = '5y'
        new_url = f"{clear_url}?orgId=1&from={period_from}-{period_to}&to=now&inspect={i}"
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
    urls = ['https://dashboard.satnogs.org/d/uSu4Uxank/sanosat-1?orgId=1']
    for url in urls:
        process_url(url)
