from pathlib import Path
import logging
import asyncio
import re
import pandas as pd
import random
from playwright.async_api import async_playwright
from urllib.parse import urlparse, urlunparse, parse_qs, urlencode
import os

# Anti-DDOS parameters
MIN_DELAY = 0.5  # Minimum delay between panel requests in seconds
MAX_DELAY = 2.5  # Maximum randomized delay
BATCH_SIZE = 5  # Number of panels to process before longer delay
BATCH_DELAY = 2  # Delay after each batch completion

# File resolution magic
_JS_DIR = Path(__file__).parent.resolve()
DOWNLOAD_JS = _JS_DIR / "download_panel.js"
EXPAND_JS = _JS_DIR / "expand_all.js"
PANELS_JS = _JS_DIR / "get_all_panels.js"


RESTRICTED_FILES = {"Ground_Stations", "Last_Frame_Received"}
UNIT_PATTERN = r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c)$"
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
}


async def extract_base_url(url: str) -> str:
    """Extract canonical base URL without query parameters or fragments"""
    parsed = urlparse(url)
    # Clean path by removing any existing viewPanel params in path (defense in depth)
    clean_path = parsed.path.split("?")[0]
    return urlunparse(
        (
            parsed.scheme,
            parsed.netloc,
            clean_path,
            "",  # params
            "",  # query
            "",  # fragment
        )
    )


async def _load_script(script_path: Path) -> str:
    return script_path.read_text(encoding="utf-8")


async def _transform_url(url: str, panel_id: int) -> str:
    """Mangle Grafana URL into data inspection view"""
    parsed = urlparse(url)
    params = parse_qs(parsed.query, keep_blank_values=True)

    data_params = {
        "inspect": panel_id,
        "inspectTab": ["data"],
        "orgId": ["1"],
        "from": params.get("from", ["now-2y"]),
        "to": params.get("to", ["now"]),
    }
    data_params.update(
        {k: v for k, v in params.items() if k.startswith("var-")}
    )

    return f"{parsed.scheme}://{parsed.netloc}{parsed.path}?{urlencode(data_params, doseq=True)}"


async def _process_csv(file_path: Path) -> pd.DataFrame:
    """Parse CSV and normalize units"""
    if any(r in file_path.name for r in RESTRICTED_FILES):
        raise ValueError("restricted files")

    df = pd.read_csv(file_path)
    if df.empty or df.columns.size < 2:
        raise ValueError(
            f"invalid dataframe structure, df.empty or df.columns.size < 2: {df.info()}"
        )

    # Normalize time column
    df = df.rename(columns=lambda col: "time" if col.lower() == "time" else col)
    df["time"] = pd.to_datetime(df["time"]).dt.normalize()

    # Process units for non-time string columns
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
            df = df.rename(columns={col: f"{col}_{UNIT_MAP.get(unit, unit)}"})

    # Filter numeric columns and validate
    df = df.select_dtypes(include=["number", "bool", "datetime"])
    if df.columns.size < 2:
        raise ValueError("insufficient numeric columns")

    df = df.rename(
        columns=lambda col: col.lower().translate(
            str.maketrans({c: "_" for c in " ,<>[]()#+"})
        )
    )

    # Group by time and take mean of duplicate timestamps
    df = df.groupby("time", as_index=False).agg("mean")

    return df


async def _download_panel(page, output_dir: Path) -> Path:
    """Execute download JS and capture CSV in memory"""
    script = await _load_script(DOWNLOAD_JS)
    async with page.expect_download() as dl:
        await page.evaluate(script)

    download = await dl.value
    await download.save_as(output_dir / download.suggested_filename)

    try:
        df = await _process_csv(output_dir / download.suggested_filename)
    except Exception as e:
        os.remove(output_dir / download.suggested_filename)
        raise e

    output_file = output_dir / download.suggested_filename
    df.to_csv(output_file, index=False)

    return output_file


async def _scrape_panels(browser, url: str, output_dir: Path):
    """Orchestrate panel discovery with rate limiting"""
    context = await browser.new_context(accept_downloads=True)
    page = await context.new_page()

    try:
        await page.goto(url, wait_until="networkidle")

        expand_script = await _load_script(EXPAND_JS)
        await page.evaluate(expand_script)

        panels_script = await _load_script(PANELS_JS)
        panels = await page.evaluate(panels_script)
        logging.info(f"discovered {len(panels)} panels")

        # Rate limited processing
        tasks = []
        for idx, panel in enumerate(p for p in panels if p["type"] == "panel"):
            panel_url = await _transform_url(url, panel["id"])
            logging.info("panel URL: %s", panel_url)

            # Add jittered delay before each task
            if idx > 0:
                delay = random.uniform(MIN_DELAY, MAX_DELAY)
                await asyncio.sleep(delay)

            tasks.append(_process_single_panel(context, panel_url, output_dir))

            # Insert batch delay
            if idx % BATCH_SIZE == 0 and idx > 0:
                await asyncio.sleep(BATCH_DELAY)
                logging.debug(f"Processed {idx} panels - cooling down")

        await asyncio.gather(*tasks)

    finally:
        await context.close()


async def _process_single_panel(context, panel_url: str, output_dir: Path):
    """Process individual panel with randomized delays"""
    # Initial random delay
    await asyncio.sleep(random.uniform(0.1, 0.5))

    page = await context.new_page()
    try:
        # Randomize wait strategy
        wait_strategy = (
            "networkidle" if random.random() > 0.5 else "domcontentloaded"
        )
        await page.goto(panel_url, wait_until=wait_strategy)

        # Add jitter before download
        await asyncio.sleep(random.uniform(0.2, 1.0))

        saved_path = await _download_panel(page, output_dir)
        logging.info(f"processed panel -> {saved_path}")

        # Post-download cooloff
        await asyncio.sleep(random.uniform(0.1, 0.3))

    except Exception as e:
        logging.error(f"failed {panel_url}: {str(e)}")
    finally:
        await page.close()


async def grafana_fetch(url: str, output_dir: Path):
    """Main async entry point"""
    output_dir = Path(output_dir).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    transformed_url = await extract_base_url(url)

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        await _scrape_panels(browser, transformed_url, output_dir)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Async Grafana panel scraper with in-memory processing",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
            %(prog)s "https://dashboard.satnogs.org/d/abEVHMIIk/veronika" ./output
            %(prog)s "https://network.satnogs.org/d/SATNOGS-5678" /var/lib/satdata
        """,
    )
    parser.add_argument("url", help="Grafana dashboard URL")
    parser.add_argument("output_dir", help="Directory for processed CSVs")

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
    )

    asyncio.run(grafana_fetch(args.url, args.output_dir))
