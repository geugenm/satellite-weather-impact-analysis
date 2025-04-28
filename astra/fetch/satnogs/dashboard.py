import asyncio
import logging
import os
import time
from pathlib import Path
from typing import List, Optional, Set

import pandas as pd
from playwright.async_api import async_playwright
from tqdm.asyncio import tqdm

from astra.fetch.format import DataFrameParser
from astra.fetch.satnogs.url import build_inspection_url, parse_grafana_url

CONCURRENCY = 8
BATCH_SIZE = 24

_JS_DIR = Path(__file__).parent.resolve()
DOWNLOAD_JS = _JS_DIR / "download_panel.js"
EXPAND_JS = _JS_DIR / "expand_all.js"
PANELS_JS = _JS_DIR / "get_all_panels.js"

RESTRICTED_FILES = {
    "Ground_Stations",
    "Last_Frame_Received",
    "Last Frame Time",
    "Frame Count",
    "Framecount",
    "Ground Stations",
    "Last Frame Received",
}
SEEN_PANELS: Set[str] = set()
PROCESSED_PANELS: Set[str] = set()

logging = logging.getLogger(__name__)

BROWSER_ARGS = [
    "--no-sandbox",
    "--disable-dev-shm-usage",
    "--disable-web-security",
    "--js-flags=--max-old-space-size=512",
    "--disable-extensions",
    "--disable-sync",
    "--blink-settings=imagesEnabled=true",
    "--disable-notifications",
    "--disable-popup-blocking",
    "--disable-ipc-flooding-protection",
    "--mute-audio",
    "--disable-features=TranslateUI",
    "--disable-infobars",
]


async def load_script(path: Path) -> str:
    return await asyncio.to_thread(path.read_text, encoding="utf-8")


async def process_csv(file_path: Path) -> pd.DataFrame:
    if any(r in file_path.name for r in RESTRICTED_FILES):
        raise ValueError(f"file '{file_path}' is in restricted list")

    def _process():
        df = pd.read_csv(file_path)
        parser = DataFrameParser()
        df = parser.sanitize_columns(df)
        df = parser.parse_units(df)
        df = df.select_dtypes(include=["number", "bool", "datetime"])
        if df.columns.size < 2:
            raise ValueError("insufficient columns after processing")
        return df

    return await asyncio.to_thread(_process)


async def download_panel(page, output_dir: Path) -> Optional[Path]:
    script = await load_script(DOWNLOAD_JS)
    dest = None

    try:
        async with page.expect_download(timeout=10000) as dl:
            await page.evaluate(script)
        download = await dl.value
        dest = output_dir / download.suggested_filename
        await download.save_as(dest)

        df = await process_csv(dest)
        await asyncio.to_thread(df.to_csv, dest, index=False)

        logging.info(f"saved '{dest}' successfully")
        return dest
    except Exception as e:
        logging.error(f"failed to download page '{page.url}': {str(e)}")
        if dest and dest.exists():
            os.remove(dest)
        return None


async def process_panel(
    context, panel_url: str, output_dir: Path
) -> Optional[Path]:
    page = await context.new_page()
    try:
        await page.goto(panel_url, wait_until="load", timeout=15000)

        saved_path = await download_panel(page, output_dir)
        if saved_path:
            PROCESSED_PANELS.add(panel_url)
        return saved_path
    except Exception as e:
        logging.error(f"panel '{panel_url}' processing failed: {str(e)}")
        return None
    finally:
        await page.close()


async def get_panels(browser, url: str, output_dir: Path) -> List[Path]:
    context = await browser.new_context(accept_downloads=True)

    try:
        page = await context.new_page()
        await page.goto(url, wait_until="load", timeout=40000)
        await asyncio.sleep(2)

        await page.evaluate(await load_script(EXPAND_JS))
        await asyncio.sleep(2)

        panels = [
            p
            for p in await page.evaluate(await load_script(PANELS_JS))
            if p["type"] == "panel" and p["id"] not in SEEN_PANELS
        ]

        if not panels:
            logging.debug("no new panels to process")
            return []

        SEEN_PANELS.update(p["id"] for p in panels)
        url_data = parse_grafana_url(url)

        sem = asyncio.Semaphore(CONCURRENCY)
        results = []

        for i in range(0, len(panels), BATCH_SIZE):
            batch = panels[i : i + BATCH_SIZE]
            batch_tasks = []

            for panel in batch:
                panel_url = build_inspection_url(
                    url_data["base_url"],
                    panel["id"],
                    url_data["from"],
                    url_data["to"],
                )

                async def process_with_sem(
                    p_url=panel_url, title=panel["title"]
                ):
                    async with sem:
                        logging.debug(f"processing '{title}'")
                        result = await process_panel(context, p_url, output_dir)
                        return result

                batch_tasks.append(asyncio.create_task(process_with_sem()))

            with tqdm(
                total=len(batch_tasks),
                desc=f"Batch {i//BATCH_SIZE+1}/{(len(panels)+BATCH_SIZE-1)//BATCH_SIZE}",
                bar_format="{desc} [{bar:40}] {percentage:3.0f}% {n_fmt}/{total_fmt}",
                ascii=" >=",
            ) as progress:
                for future in asyncio.as_completed(batch_tasks):
                    result = await future
                    progress.update(1)
                    if result:
                        results.append(result)

        return [r for r in results if r]
    finally:
        await context.close()


async def grafana_fetch(
    url: str, output_dir: Path, use_headless_browser_mode: bool
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    start_time = time.monotonic()

    async with async_playwright() as p:
        browser = await p.chromium.launch(
            headless=use_headless_browser_mode, args=BROWSER_ARGS, timeout=30000
        )

        try:
            await get_panels(browser, url, output_dir)
        finally:
            await browser.close()

        elapsed = time.monotonic() - start_time
        logging.info(
            f"downloaded {len(PROCESSED_PANELS)}/{len(SEEN_PANELS)} panels in {elapsed:.2f}s"
        )


def run_grafana_fetch(
    url: str,
    output_dir: Path,
    time_from: str = "",
    time_to: str = "",
    use_headless_browser_mode: bool = True,
):
    if time_from or time_to:
        parsed_data = parse_grafana_url(url)
        url = build_inspection_url(
            base_url=parsed_data["base_url"],
            panel_id="",  # Empty for dashboard URL
            time_from=time_from or parsed_data["from"],
            time_to=time_to or parsed_data["to"],
        )

    asyncio.run(grafana_fetch(url, output_dir, use_headless_browser_mode))
