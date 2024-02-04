import logging
from pathlib import Path
from typing import List, Tuple

from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException, TimeoutException
from selenium.webdriver.common.by import By
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait

# Set up logging
logging.basicConfig(level=logging.INFO)


def create_driver(browser_download_dir: str,
                  headless: bool = True) -> webdriver:
    """Create a Firefox webdriver with custom options."""
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


def get_clear_url(url: str) -> str:
    """Remove query parameters from a URL."""
    return url.split('?')[0]


def make_custom_download_dir_for_url_and_get_it(url: str,
                                                base_dir: str) -> str:
    """Create a custom download directory for a URL and return its absolute path."""
    dir_name = url.split('/')[-1]
    logging.info(f"Downloading sat=[{dir_name}]")
    full_path = Path(base_dir) / dir_name
    full_path.mkdir(parents=True, exist_ok=True)
    return str(full_path.resolve())


def get_existing_panels(driver: webdriver) -> List[Tuple[int, str]]:
    """Get IDs and titles of existing panels."""
    existing_panels = []
    for i in range(
            101):  # The range starts from 0, so 101 is needed to reach 100
        element_id = f"panel-{i}"
        try:
            element = driver.find_element(By.ID, element_id)
            if 'react-grid-item' in element.get_attribute('class'):
                title_element = element.find_element(By.CLASS_NAME,
                                                     'panel-title-text')
                title = title_element.text
                existing_panels.append((i, title))
        except NoSuchElementException:
            continue
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
                period_to: str = '5y') -> None:
    clear_url: str = get_clear_url(url)
    download_path: str = make_custom_download_dir_for_url_and_get_it(clear_url,
                                                                     download_dir)
    firefox_driver: webdriver = create_driver(download_path)
    firefox_driver.get(clear_url)
    panels_ids_list = get_existing_panels(firefox_driver)

    for panel_id, panel_name in panels_ids_list:  # Loop from start to end
        new_url = f"{clear_url}?orgId=1&from={period_from}-{period_to}&to=now&inspect={panel_id}"
        firefox_driver.get(new_url)

        try:
            element_present = EC.presence_of_element_located(
                (By.ID, f"panel-{panel_id}"))
            WebDriverWait(firefox_driver, 2).until(element_present)
        except TimeoutException:
            logging.warning(f"timeout: page url=[{url}] is not loaded")
            continue

        scroll_to_element(firefox_driver, f"panel-{panel_id}")

        try:
            element_present = EC.presence_of_element_located(
                (By.CSS_SELECTOR,
                 'button[class^="css-"][class$="-button"]'))
            WebDriverWait(firefox_driver, 2).until(
                element_present)
        except TimeoutException:
            logging.warning(
                f"panel=[{panel_name}] timeout: download button is not found on url=[{new_url}]")
            continue

        logging.info(f"Downloading data from panel=[{panel_name}]")
        process_elements(firefox_driver)

    firefox_driver.quit()


if __name__ == '__main__':
    # Stellites dashboard catalog: https://dashboard.satnogs.org/d/QjDe5S8mk/satellite-telemetries?orgId=1
    urls: List[str] = [
        'https://dashboard.satnogs.org/d/QGujdBBZk/aausat4?orgId=1']
    download_dir: str = '../data/'
    for url in urls:
        logging.info(f"Downloading data from [{url}]")
        process_url(url, download_dir)
