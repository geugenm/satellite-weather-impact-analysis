import logging
from pathlib import Path
import json
import tempfile
import time
import asyncio
from playwright.async_api import async_playwright


async def get_satellite_urls(force_refresh=False) -> list[str]:
    cache_file = Path(tempfile.gettempdir()) / "satnogs_satellites_cache.json"

    try:
        if (
            not force_refresh
            and cache_file.exists()
            and time.time() - cache_file.stat().st_mtime < 86400
        ):
            logging.debug(f"Using cached satellite data from {cache_file}")
            return json.loads(cache_file.read_text())
    except json.JSONDecodeError:
        logging.warning("Cache file corrupt, refreshing data")
    except Exception as e:
        logging.debug(f"Cache error: {e}")

    logging.debug("Fetching fresh satellite data from SatNOGS dashboard")
    js_path = Path(__file__).parent / "available_satellites.js"
    js_code = js_path.read_text()

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page()
        await page.goto(
            "https://dashboard.satnogs.org/dashboards/f/PgptDZUmz/telemetry",
            wait_until="load",
            timeout=10000,
        )

        try:
            urls = await page.evaluate(js_code)
            logging.debug(
                f"Found {len(urls)} satellites. First few: {urls[:3]}..."
            )

            try:
                cache_file.write_text(json.dumps(urls))
                logging.debug(f"Satellite data cached at {cache_file}")
            except OSError as e:
                logging.debug(f"Failed to write cache: {e}")

            return urls
        except Exception as e:
            logging.error(f"Scraping failed: {e}")
            raise
        finally:
            await browser.close()


if __name__ == "__main__":
    logging.basicConfig(
        format="%(asctime)s [%(levelname)s] [%(name)s] %(message)s",
        level=logging.DEBUG,
        datefmt="%H:%M:%S",
    )

    print("🛰️ Starting SatNOGS satellite hunter...")
    urls = asyncio.run(get_satellite_urls())
    print(f"🚀 Found {len(urls)} satellites in dashboard!")

    # Show a few random satellites to pique interest
    import random

    samples = random.sample(urls, min(5, len(urls)))
    for i, url in enumerate(samples, 1):
        sat_name = url.split("/")[-1].upper()
        print(f"{i}. 📡 {sat_name} - {url}")

    print("\n💾 All data cached for faster access next time")
    print("🔄 Use get_satellite_urls(force_refresh=True) to update data")
