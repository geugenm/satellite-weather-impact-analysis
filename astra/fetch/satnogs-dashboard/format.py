from pathlib import Path
import pandas as pd
import logging
import argparse
import re
from typing import Final

DOWNLOAD_BASE = Path("downloads/sat").absolute()
RESTRICTED_FILES: Final = {"Ground_Stations", "Last_Frame_Received"}
UNIT_PATTERN: Final = (
    r"^(-?\d*\.?\d+)\s*(v|mv|ma|ms|s|m|kg|hz|db|rpm|celsius|c|°c)$"
)
UNIT_MAP: Final = {
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

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def get_available_satellites() -> list:
    """Get list of satellites that haven't failed yet"""
    return [d.name for d in DOWNLOAD_BASE.iterdir() if d.is_dir()]


def init_argparse() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Filter and normalize satellite data because engineers can't agree on standards",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Operations:
    Filter Mode
        Cleans up your messy CSV files and normalizes units
        Output: filtered/<original_filename>.csv

    Format Mode
        Enforces specific column formats (because standards exist)
        Output: formatted/<original_filename>.csv

    List Mode
        Shows available satellites (for your goldfish memory)

Usage Examples:
    # Filter specific satellite data
    %(prog)s --filter veronika --output filtered

    # Format all satellites with strict rules
    %(prog)s --format all --strict --output formatted

    # List available satellites
    %(prog)s --list
    """,
    )

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "--filter",
        help="satellite name or 'all' to clean everything",
        metavar="NAME",
    )
    group.add_argument(
        "--format",
        help="satellite name or 'all' to format everything",
        metavar="NAME",
    )
    group.add_argument(
        "--list",
        action="store_true",
        help="list available satellites",
    )

    parser.add_argument(
        "--output",
        type=Path,
        help="output directory for processed files",
        default=Path("filtered"),
    )
    parser.add_argument(
        "--strict",
        action="store_true",
        help="enforce strict formatting rules",
    )
    return parser


def custom_parse(file_path: Path, strict: bool = False) -> pd.DataFrame:
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

    # Apply strict naming if requested
    if strict:
        df = df.rename(
            columns=lambda col: col.lower().translate(
                str.maketrans({c: "_" for c in " ,<>[]()#+"})
            )
        )

    # Group by time and take mean of duplicate timestamps
    df = df.groupby("time", as_index=False).agg("mean")
    df = df.sort_values("time")

    return df


def process_satellites(
    satellites: list, output_dir: Path, strict: bool = False
) -> None:
    output_dir.mkdir(exist_ok=True)

    for sat in satellites:
        logger.info(f"processing '{sat}'")
        sat_dir = DOWNLOAD_BASE / sat

        if not sat_dir.exists():
            logger.error(f"satellite '{sat}' not found in {DOWNLOAD_BASE}")
            continue

        for file in sat_dir.glob("*.csv"):
            try:
                df = custom_parse(file, strict)
                output_file = output_dir / file.name
                df.to_csv(output_file, index=False)
                logger.info(f"processed '{file.name}' -> '{output_file}'")
            except Exception as e:
                logger.error(f"failed to process {file}, skipping, error: {e}")


def main() -> None:
    parser = init_argparse()
    args = parser.parse_args()

    if args.list:
        sats = get_available_satellites()
        if not sats:
            logger.error("no satellites found. try downloading some data first")
            return
        print("\nAvailable satellites:")
        for sat in sats:
            print(f"  • {sat}")
        return

    satellites = (
        get_available_satellites()
        if args.filter == "all" or args.format == "all"
        else [args.filter or args.format]
    )
    process_satellites(satellites, args.output, args.strict)


if __name__ == "__main__":
    main()
