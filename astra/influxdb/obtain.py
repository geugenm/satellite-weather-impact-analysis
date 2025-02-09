from dataclasses import dataclass
from pathlib import Path
from typing import Final, Optional
import logging
import sys
import argparse
from datetime import datetime

import pandas as pd
from influxdb_client import InfluxDBClient
from dotenv import load_dotenv
from os import getenv

# Constants
QUERY_TEMPLATE: Final[
    str
] = """
    from(bucket: "{bucket}")
        |> range(start: {start})
        |> filter(fn: (r) => {filter})
        |> pivot(rowKey:["_time"],
                columnKey: ["_field"],
                valueColumn: "_value")
"""

DROP_COLUMNS: Final[list] = [
    "result",
    "table",
    "_start",
    "_stop",
    "_measurement",
]


@dataclass
class InfluxConfig:
    url: str
    user: str
    password: str
    org: str
    bucket: str


def setup_logging() -> None:
    logging.basicConfig(
        level=getenv("LOG_LEVEL", "INFO"),
        format="%(asctime)s [%(levelname).1s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        stream=sys.stdout,
    )


def load_config() -> InfluxConfig:
    if not Path(".env").exists():
        raise FileNotFoundError("missing .env file")

    load_dotenv()
    return InfluxConfig(
        url=getenv("INFLUX_URL", "http://localhost:8086"),
        user=getenv("INFLUX_USER", "admin"),
        password=getenv("INFLUX_PASS", "admin"),
        org=getenv("INFLUX_ORG", "org"),
        bucket=getenv("INFLUX_BUCKET", "bucket"),
    )


def process_dataframe(df: pd.DataFrame) -> pd.DataFrame:
    if df.empty:
        return pd.DataFrame()
    df = df.drop(columns=[col for col in DROP_COLUMNS if col in df.columns])
    df = df.rename(columns={"_time": "time"})
    return df.set_index("time")


def get_all_data(
    client: InfluxDBClient,
    measurement: Optional[str] = None,
    start: str = "-1h",
) -> pd.DataFrame:
    logger = logging.getLogger(__name__)
    try:
        query = QUERY_TEMPLATE.format(
            bucket=client.bucket,
            start=start,
            filter=(
                f'r["_measurement"] == "{measurement}"'
                if measurement
                else "true"
            ),
        )
        result = client.query_api().query_data_frame(query)

        if isinstance(result, list):
            df = pd.concat(result) if result else pd.DataFrame()
        else:
            df = result

        df = process_dataframe(df)
        if not df.empty:
            logger.info(
                f"retrieved {len(df)} rows with {len(df.columns)} columns"
            )
        return df

    except Exception as e:
        logger.error(f"query failed: {e}")
        return pd.DataFrame()


def parse_time(time_str: str) -> str:
    if time_str.startswith("-"):  # Relative time like -1h
        return time_str
    try:
        datetime.strptime(time_str, "%Y-%m-%d")
        return time_str
    except ValueError:
        raise argparse.ArgumentTypeError(
            "time must be either relative (-1h, -2d) or YYYY-MM-DD format"
        )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract data from InfluxDB like a boss",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Get everything (hope you have enough RAM)
    %(prog)s

    # Get last hour of data
    %(prog)s --start -1h

    # Get specific measurement since yesterday
    %(prog)s --start -1d --measurement your_measurement

    # Get data since specific date
    %(prog)s --start 2024-01-01

Environment:
    INFLUX_URL       InfluxDB URL (default: http://localhost:8086)
    INFLUX_USER      Username for your precious data
    INFLUX_PASS      Password (handle with care)
    INFLUX_ORG       Organization (default: org)
    INFLUX_BUCKET    Bucket name (default: bucket)
    LOG_LEVEL        Logging level (default: INFO)
    """,
    )
    parser.add_argument(
        "--start",
        type=parse_time,
        default="-10y",
        help="start time (relative like -1h or YYYY-MM-DD, default: -10y)",
    )
    parser.add_argument(
        "--measurement",
        help="specific measurement to extract (default: all measurements)",
    )

    args = parser.parse_args()
    setup_logging()
    logger = logging.getLogger(__name__)

    try:
        config = load_config()
        with InfluxDBClient(
            url=config.url,
            username=config.user,
            password=config.password,
            org=config.org,
        ) as client:
            client.bucket = config.bucket
            df = get_all_data(
                client, measurement=args.measurement, start=args.start
            )

            if df.empty:
                logger.warning("no data retrieved")
                return

            print("\nFirst few rows:")
            print(df.head())
            print("\nColumns:", df.columns.tolist())
            print("\nDataframe info:")
            print(df.info())

    except Exception as e:
        logger.error(f"execution failed: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
