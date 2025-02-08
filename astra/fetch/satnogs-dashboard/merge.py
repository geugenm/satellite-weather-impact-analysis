from pathlib import Path
import pandas as pd
import logging
import argparse

from astra.analyzer import (
    merge_dataframes,
    build_file_database,
    get_csv_files,
)

# Configuration
DOWNLOAD_BASE = Path("downloads/sat").absolute()

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def get_available_satellites() -> list:
    """Get list of satellites with downloaded data"""
    return [d.name for d in DOWNLOAD_BASE.iterdir() if d.is_dir()]


def merge_satellite_data(sat_name: str) -> pd.DataFrame:
    satellite_files = get_csv_files(DOWNLOAD_BASE / sat_name)

    dataset_files_db = build_file_database(satellite_files)

    return merge_dataframes(dataset_files_db)


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Merge satellite telemetry data because your disk is a mess",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Operations:
    Merge Mode
        Combines CSV files by time alignment (because time is money)
        Output: merged/<satellite>_merged.csv

    List Mode
        Shows available satellites (in case your memory sucks)

Usage Examples:
    # Merge specific satellite data (if you can remember its name)
    %(prog)s --merge veronika

    # Merge all satellites (because why not?)
    %(prog)s --merge all

    # List available satellites (for the memory-impaired)
    %(prog)s --list
    """,
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "--merge",
        help="satellite name or 'all' to merge everything like a boss",
        metavar="NAME",
    )
    group.add_argument(
        "--list",
        action="store_true",
        help="list available satellites (use when drunk)",
    )
    return parser


def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    if args.list:
        sats = get_available_satellites()
        if not sats:
            print("No satellites found. Did you even download anything?")
            return
        print("\nAvailable satellites:")
        for sat in sats:
            print(f"  • {sat}")
        print()
        return

    if args.merge == "all":
        satellites = get_available_satellites()
    else:
        satellites = [args.merge]

    output_dir = Path("merged")
    output_dir.mkdir(exist_ok=True)

    for sat in satellites:
        logger.info(f"processing '{sat}'")
        merged = merge_satellite_data(sat)
        if merged is not None:
            output_file = output_dir / f"{sat}_merged.csv"
            merged.to_csv(output_file, index=False)
            logger.info(f"saved to '{output_file}' → {len(merged)} rows")


if __name__ == "__main__":
    main()
