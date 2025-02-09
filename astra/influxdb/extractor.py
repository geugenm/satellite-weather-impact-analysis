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
    buckets: list[str]


def setup_logging() -> None:
    logging.basicConfig(
        level=getenv("LOG_LEVEL", "INFO"),
        format="%(asctime)s [%(levelname).1s] %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        stream=sys.stdout,
    )


def load_config(args: argparse.Namespace) -> InfluxConfig:
    if not Path(".env").exists():
        raise FileNotFoundError("missing .env file")

    load_dotenv()
    return InfluxConfig(
        url=getenv("INFLUX_URL", "http://localhost:8086"),
        user=getenv("INFLUX_USER", "admin"),
        password=getenv("INFLUX_PASS", "admin"),
        org=getenv("INFLUX_ORG", "org"),
        buckets=(
            args.buckets.split(",")
            if args.buckets
            else getenv("INFLUX_BUCKET", "bucket").split(",")
        ),
    )


def process_dataframe(df: pd.DataFrame) -> pd.DataFrame:
    if df.empty:
        return pd.DataFrame()
    df = df.drop(columns=[col for col in DROP_COLUMNS if col in df.columns])
    return df.rename(columns={"_time": "time"}).set_index("time")


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
        return process_dataframe(
            pd.concat(result) if isinstance(result, list) else result
        )
    except Exception as e:
        logger.error(f"query failed for bucket {client.bucket}: {e}")
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
    # Get everything from all buckets
    %(prog)s

    # Get last hour of data from specific buckets
    %(prog)s --buckets "bucket1,bucket2" --start -1h

    # Get specific measurement since yesterday
    %(prog)s --start -1d --measurement Battery_1739049680

    # Get data since specific date
    %(prog)s --start 2024-01-01

Environment:
    INFLUX_URL       InfluxDB URL (default: http://localhost:8086)
    INFLUX_USER      Username for your precious data
    INFLUX_PASS      Password (handle with care)
    INFLUX_ORG       Organization (default: org)
    INFLUX_BUCKET    Comma-separated bucket names (default: bucket)
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
    parser.add_argument(
        "--buckets",
        help="comma-separated bucket list (overrides INFLUX_BUCKET)",
    )

    args = parser.parse_args()
    setup_logging()
    logger = logging.getLogger(__name__)

    try:
        config = load_config(args)
        with InfluxDBClient(
            url=config.url,
            username=config.user,
            password=config.password,
            org=config.org,
        ) as client:
            all_data = pd.DataFrame()

            for bucket in config.buckets:
                client.bucket = bucket.strip()
                df = get_all_data(
                    client, measurement=args.measurement, start=args.start
                )
                if not df.empty:
                    all_data = pd.concat([all_data, df])
                    logger.info(
                        f"retrieved {len(df)} rows from {client.bucket} "
                        f"with {len(df.columns)} columns"
                    )

            if all_data.empty:
                logger.warning("no data retrieved")
                return

            # Merge and deduplicate time index
            merged_data = all_data.groupby("time").mean().sort_index()

            print("\nMerged data summary:")
            print(merged_data.head())
            print("\nColumns:", merged_data.columns.tolist())
            print("\nDataframe info:")
            print(merged_data.info())

            merged_data.to_csv("merged_output.csv", index=True)
            logger.info(
                f"saved {len(merged_data)} rows with {len(merged_data.columns)} "
                f"columns to merged_output.csv"
            )

    except Exception as e:
        logger.error(f"execution failed: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
