import asyncio
import logging
import os
import random
import time
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
from typing import Set

import pandas as pd
from playwright.async_api import async_playwright

from astra.fetch.format import DataFrameParser
from astra.fetch.satnogs.url import build_inspection_url, parse_grafana_url

# Execution control
MAX_WORKERS = os.cpu_count() or 4
IO_EXECUTOR = ThreadPoolExecutor(max_workers=MAX_WORKERS)
CPU_EXECUTOR = ThreadPoolExecutor(max_workers=MAX_WORKERS)

# Traffic shaping
MIN_DELAY = 0.3  # 300ms minimum between requests
MAX_DELAY = 1.8  # Max jittered delay
BATCH_SIZE = 16  # Panels per batch
BATCH_DELAY = 1.5  # Cool-off between batches
CONCURRENCY = 8  # Max parallel panel processing

# Path resolution
_JS_DIR = Path(__file__).parent.resolve()
DOWNLOAD_JS = _JS_DIR / "download_panel.js"
EXPAND_JS = _JS_DIR / "expand_all.js"
PANELS_JS = _JS_DIR / "get_all_panels.js"

# Validation sets
RESTRICTED_FILES = {"Ground_Stations", "Last_Frame_Received"}
SEEN_PANELS: Set[str] = set()
PROCESSED_PANELS: Set[str] = set()


async def _load_script(script_path: Path) -> str:
    loop = asyncio.get_running_loop()
    return await loop.run_in_executor(
        IO_EXECUTOR, lambda: script_path.read_text(encoding="utf-8")
    )


async def _process_csv(file_path: Path) -> pd.DataFrame:
    loop = asyncio.get_running_loop()

    def _cpu_task():
        start = time.monotonic()
        if any(r in file_path.name for r in RESTRICTED_FILES):
            raise ValueError("restricted file access attempted")

        df = pd.read_csv(file_path)
        parser = DataFrameParser()
        df = parser.sanitize_columns(df)
        df = parser.parse_units(df)

        df = df.select_dtypes(include=["number", "bool", "datetime"])
        if df.columns.size < 2:
            raise ValueError(
                f"insufficient columns after processing {df.columns}"
            )

        logging.debug(
            f"formatted '{file_path}' in {time.monotonic()-start:.2f}s"
        )
        return df

    return await loop.run_in_executor(CPU_EXECUTOR, _cpu_task)


async def download_with_retries(page, script):
    max_attempts = 3

    for attempt in range(1, max_attempts + 1):
        try:
            async with page.expect_download(timeout=1000) as dl:
                await page.evaluate(script)
            download = await dl.value
            return download
        except Exception as e:
            if attempt == max_attempts:
                raise TimeoutError(
                    f"Failed to download in {max_attempts} attempts"
                ) from e
            await asyncio.sleep(1)  # Optional: Add a delay before retrying


async def _download_panel(page, output_dir: Path) -> Path:
    script = await _load_script(DOWNLOAD_JS)
    dest = None

    try:
        download = await download_with_retries(page, script)
        dest = output_dir / download.suggested_filename
        await download.save_as(dest)

        df = await _process_csv(dest)
        df.to_csv(dest, index=False)

        logging.info(f"saved '{dest}' sucessfully")
        return dest

    except Exception as e:
        logging.error(f"failed to download page '{page.url}': {str(e)}")
        if dest and dest.exists():
            os.remove(dest)
        raise


async def _process_panel(context, panel_url: str, output_dir: Path):
    await asyncio.sleep(random.uniform(0.1, 0.5))  # Initial jitter

    page = await context.new_page()
    try:
        await page.goto(panel_url, wait_until="domcontentloaded", timeout=15000)

        await asyncio.sleep(random.uniform(0.2, 0.7))  # Render jitter
        saved_path = await _download_panel(page, output_dir)

        await asyncio.sleep(random.uniform(0.1, 0.3))  # Post-download cooldown

        PROCESSED_PANELS.add(panel_url)
        return saved_path

    except Exception as e:
        logging.error(f"panel '{panel_url}' processing failed: {str(e)}")
    finally:
        await page.close()


async def _scrape_panels(browser, url: str, output_dir: Path):
    context = await browser.new_context(
        accept_downloads=True,
        user_agent="Mozilla/5.0 (X11; Linux x86_64) Playwright/Scraper",
    )

    try:
        page = await context.new_page()
        await page.goto(url, wait_until="networkidle", timeout=30000)

        await page.evaluate(await _load_script(EXPAND_JS))
        panels = await page.evaluate(await _load_script(PANELS_JS))
        logging.debug("Discovered %d panels", len(panels))

        sem = asyncio.Semaphore(CONCURRENCY)

        async def worker(panel):
            async with sem:
                if panel["id"] in SEEN_PANELS:
                    return
                SEEN_PANELS.add(panel["id"])

                parsed_url_data = parse_grafana_url(url)
                panel_url = build_inspection_url(
                    parsed_url_data["base_url"],
                    panel["id"],
                    parsed_url_data["from"],
                    parsed_url_data["to"],
                )
                logging.debug(
                    "Processing panel '%s' with URL '%s'",
                    panel["title"],
                    panel_url,
                )

                try:
                    return await _process_panel(context, panel_url, output_dir)
                except Exception as e:
                    logging.error(
                        f"failed to process '{panel["title"]}' failed: {str(e)}"
                    )
                finally:
                    await asyncio.sleep(random.uniform(MIN_DELAY, MAX_DELAY))

        results = []
        for i in range(0, len(panels), BATCH_SIZE):
            batch = panels[i : i + BATCH_SIZE]
            logging.debug("Processing batch %d-%d", i + 1, i + len(batch))

            batch_tasks = [worker(p) for p in batch if p["type"] == "panel"]
            batch_results = await asyncio.gather(
                *batch_tasks, return_exceptions=True
            )
            results += [
                r for r in batch_results if not isinstance(r, Exception)
            ]

            await asyncio.sleep(BATCH_DELAY)

        return results

    finally:
        await context.close()


async def grafana_fetch(url: str, output_dir: Path):
    output_dir = Path(output_dir).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    async with async_playwright() as p:
        browser = await p.chromium.launch(
            headless=True,
            args=["--disable-gpu", "--no-sandbox"],
        )

        start_time = time.monotonic()
        try:
            await _scrape_panels(browser, url, output_dir)
        finally:
            await browser.close()

        logging.info(
            f"downloaded {len(PROCESSED_PANELS)}/{len(SEEN_PANELS)} panels in {time.monotonic() - start_time:.2f}s"
        )


def run_grafana_fetch(url: str, output_dir: Path, time_from: str, time_to: str):
    if time_from or time_to:
        parsed_data = parse_grafana_url(url)

        url = build_inspection_url(
            base_url=parsed_data["base_url"],
            panel_id="",  # Empty since this is the main dashboard URL
            time_from=time_from or parsed_data["from"],
            time_to=time_to or parsed_data["to"],
        )

    asyncio.run(grafana_fetch(url, output_dir))
