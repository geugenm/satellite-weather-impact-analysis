from pathlib import Path
import logging
import asyncio
import re
import pandas as pd
import random
from concurrent.futures import ThreadPoolExecutor
from playwright.async_api import async_playwright
from urllib.parse import urlparse, urlunparse, parse_qs, urlencode
import os
import time
from typing import Set

# Execution control
MAX_WORKERS = os.cpu_count() or 4
IO_EXECUTOR = ThreadPoolExecutor(max_workers=MAX_WORKERS)
CPU_EXECUTOR = ThreadPoolExecutor(max_workers=MAX_WORKERS)

# Traffic shaping
MIN_DELAY = 0.3  # 300ms minimum between requests
MAX_DELAY = 1.8  # Max jittered delay
BATCH_SIZE = 8  # Panels per batch
BATCH_DELAY = 1.5  # Cool-off between batches
CONCURRENCY = 6  # Max parallel panel processing

# Path resolution
_JS_DIR = Path(__file__).parent.resolve()
DOWNLOAD_JS = _JS_DIR / "download_panel.js"
EXPAND_JS = _JS_DIR / "expand_all.js"
PANELS_JS = _JS_DIR / "get_all_panels.js"

# Validation sets
RESTRICTED_FILES = {"Ground_Stations", "Last_Frame_Received"}
SEEN_PANELS: Set[str] = set()

# Measurement patterns
UNIT_PATTERN = (
    r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c|days|day)$"
)
UNIT_MAP = {
    "c": "celsius",
    "°c": "celsius",
    "v": "volts",
    "mv": "millivolts",
    "ma": "milliamps",
    "ms": "milliseconds",
    "s": "seconds",
    "m": "meters",
    "kg": "kilograms",
    "hz": "hertz",
    "db": "decibels",
    "rpm": "rpm",
    "days": "days",
    "day": "day",
}

# Configure enterprise-grade logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(name)s] %(message)s",
    datefmt="%Y-%m-%dT%H:%M:%S",
)
logger = logging.getLogger("engine")
browser_log = logging.getLogger("browser")


def parse_grafana_url(url: str) -> str:
    """Sanitize and normalize dashboard URL"""
    parsed = urlparse(url)
    if not parsed.scheme or not parsed.netloc:
        raise ValueError(f"invalid URL structure: {url}")

    clean_path = parsed.path.split("?")[0].rstrip("/")
    return urlunparse((parsed.scheme, parsed.netloc, clean_path, "", "", ""))


def build_inspection_url(base_url: str, panel_id: str) -> str:
    """Construct panel-specific inspection URL"""
    parsed = urlparse(base_url)
    params = {
        k: v
        for k, v in parse_qs(parsed.query).items()
        if k.startswith("var-") or k in ["from", "to"]
    }

    params.update(
        {
            "inspect": [panel_id],
            "inspectTab": ["data"],
            "viewPanel": [panel_id],
            "orgId": ["1"],
        }
    )

    return urlunparse(
        (
            parsed.scheme,
            parsed.netloc,
            parsed.path,
            "",
            urlencode(params, doseq=True),
            "",
        )
    )


async def _load_script(script_path: Path) -> str:
    """Parallel script loading with cache"""
    loop = asyncio.get_running_loop()
    return await loop.run_in_executor(
        IO_EXECUTOR, lambda: script_path.read_text(encoding="utf-8")
    )


async def _process_csv(file_path: Path) -> pd.DataFrame:
    """Thread-parallel CSV processing pipeline"""
    loop = asyncio.get_running_loop()

    def _cpu_task():
        start = time.monotonic()
        logger.info(
            f"operation 'process_csv' started with 'file': '{file_path.name}'"
        )

        if any(r in file_path.name for r in RESTRICTED_FILES):
            raise ValueError("restricted file access attempted")

        df = pd.read_csv(file_path)
        if df.empty or df.columns.size < 2:
            raise ValueError(f"invalid dataframe structure: {df.shape}")

        # Temporal normalization
        df = df.rename(columns=lambda c: "time" if c.lower() == "time" else c)
        df["time"] = pd.to_datetime(df["time"], errors="coerce").dt.normalize()

        # Unit parsing
        for col in (
            c for c in df.columns if c != "time" and df[c].dtype == "object"
        ):
            sample = df[col].dropna().astype(str).iloc[:100]
            if not sample.str.match(UNIT_PATTERN, case=False).any():
                continue

            cleaned = df[col].str.extract(UNIT_PATTERN, flags=re.IGNORECASE)
            if cleaned[0].notna().any():
                df[col] = pd.to_numeric(cleaned[0], errors="coerce")
                unit = cleaned[1].dropna().iloc[0].lower()
                df = df.rename(
                    columns={col: f"{col}_{UNIT_MAP.get(unit, unit)}"}
                )

        # Final dataframe sanitization
        df = df.select_dtypes(include=["number", "bool", "datetime"])
        if df.columns.size < 2:
            raise ValueError("insufficient numeric columns after processing")

        # Fixed string translation with equal length arguments
        df = df.rename(
            columns=lambda col: col.lower().translate(
                str.maketrans({c: "_" for c in " ,<>[]()#+"})
            )
        )

        df = df.groupby("time", as_index=False).agg("mean")

        logger.info(
            f"operation 'process_csv' completed in {time.monotonic()-start:.2f}s"
        )
        return df

    return await loop.run_in_executor(CPU_EXECUTOR, _cpu_task)


async def _download_panel(page, output_dir: Path) -> Path:
    """Async-safe panel download handler"""
    logger.info("operation 'download' started with 'panel': '%s'", page.url)
    script = await _load_script(DOWNLOAD_JS)
    dest = None

    try:
        async with page.expect_download(timeout=15000) as dl:
            await page.evaluate(script)
        download = await dl.value

        dest = output_dir / download.suggested_filename
        await download.save_as(dest)

        df = await _process_csv(dest)
        df.to_csv(dest, index=False)

        logger.info("operation 'download' completed for '%s'", dest.name)
        return dest

    except Exception as e:
        browser_log.error(
            "operation 'download' failed with error: '%s'", str(e)
        )
        if dest and dest.exists():
            os.remove(dest)
        raise


async def _process_panel(context, panel_url: str, output_dir: Path):
    """Parallel panel processing with jittered delays"""
    await asyncio.sleep(random.uniform(0.1, 0.5))  # Initial jitter

    page = await context.new_page()
    try:
        await page.goto(panel_url, wait_until="domcontentloaded", timeout=15000)

        await asyncio.sleep(random.uniform(0.2, 0.7))  # Render jitter
        saved_path = await _download_panel(page, output_dir)

        await asyncio.sleep(random.uniform(0.1, 0.3))  # Post-download cooldown
        return saved_path

    except Exception as e:
        logger.error("panel processing failed: %s", str(e))
        raise
    finally:
        await page.close()


async def _scrape_panels(browser, url: str, output_dir: Path):
    """Orchestrated parallel scraping engine"""
    context = await browser.new_context(
        accept_downloads=True,
        user_agent="Mozilla/5.0 (X11; Linux x86_64) Playwright/Scraper",
    )

    try:
        page = await context.new_page()
        await page.goto(url, wait_until="networkidle", timeout=30000)

        await page.evaluate(await _load_script(EXPAND_JS))
        panels = await page.evaluate(await _load_script(PANELS_JS))
        logger.info("discovered %d panels", len(panels))

        sem = asyncio.Semaphore(CONCURRENCY)

        async def worker(panel):
            async with sem:
                if panel["id"] in SEEN_PANELS:
                    return
                SEEN_PANELS.add(panel["id"])

                panel_url = build_inspection_url(url, panel["id"])
                logger.debug("processing panel '%s'", panel["title"])

                try:
                    return await _process_panel(context, panel_url, output_dir)
                except Exception as e:
                    logger.error(
                        "panel '%s' failed: %s", panel["title"], str(e)
                    )
                finally:
                    await asyncio.sleep(random.uniform(MIN_DELAY, MAX_DELAY))

        # Batch processing with cooling periods
        results = []
        for i in range(0, len(panels), BATCH_SIZE):
            batch = panels[i : i + BATCH_SIZE]
            logger.info("processing batch %d-%d", i + 1, i + len(batch))

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
    """Main entrypoint with resource management"""
    output_dir = Path(output_dir).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    base_url = parse_grafana_url(url)
    logger.info("operation 'scrape' started for '%s'", base_url)

    async with async_playwright() as p:
        browser = await p.chromium.launch(
            headless=True, args=["--disable-gpu", "--no-sandbox"]
        )

        start_time = time.monotonic()
        try:
            await _scrape_panels(browser, base_url, output_dir)
        finally:
            await browser.close()

    logger.info(
        "operation 'scrape' completed in %.2fs with %d panels",
        time.monotonic() - start_time,
        len(SEEN_PANELS),
    )


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Enterprise Grafana Scraper",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika" ./output
  %(prog)s "https://network.satnogs.org/d/SATNOGS-5678" /var/lib/satdata
""",
    )
    parser.add_argument("url", help="Dashboard URL")
    parser.add_argument("output_dir", help="Output directory")
    parser.add_argument(
        "--debug", action="store_true", help="Enable debug logging"
    )

    args = parser.parse_args()

    if args.debug:
        logger.setLevel(logging.DEBUG)
        browser_log.setLevel(logging.DEBUG)

    asyncio.run(grafana_fetch(args.url, args.output_dir))
