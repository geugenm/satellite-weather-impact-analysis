from dataclasses import dataclass
from pathlib import Path
from typing import Final
import argparse
import logging
import sys

import pandas as pd
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS
from dotenv import load_dotenv
from os import getenv

# Constants
WRITE_PRECISION: Final = WritePrecision.NS
CSV_PATTERN: Final = "*.csv"


@dataclass
class InfluxConfig:
    url: str
    user: str
    password: str
    org: str
    bucket: str


def load_config(args: argparse.Namespace) -> InfluxConfig:
    load_dotenv()

    return InfluxConfig(
        url=getenv("INFLUX_URL", "http://localhost:8086"),
        user=args.username or getenv("INFLUX_USER", "admin"),
        password=args.password or getenv("INFLUX_PASS", "admin"),
        org=getenv("INFLUX_ORG", "org"),
        bucket=args.bucket or getenv("INFLUX_BUCKET", "unknown_bucket"),
    )


def parse_csv(file_path: Path) -> pd.DataFrame:
    try:
        df = pd.read_csv(file_path)
        df = df.rename(
            columns=lambda col: "time" if col.lower() == "time" else col
        )
        df["time"] = pd.to_datetime(df["time"])
        return df.set_index("time")
    except Exception as e:
        logging.error(f"failed to parse {file_path}: {e}")
        return pd.DataFrame()


def write_to_influx(
    df: pd.DataFrame, measurement: str, client: InfluxDBClient
) -> None:
    try:
        write_api = client.write_api(write_options=SYNCHRONOUS)
        points = []

        for timestamp, row in df.iterrows():
            point = Point(measurement).time(timestamp, WRITE_PRECISION)
            for column, value in row.items():
                if pd.notna(value):
                    point.field(column, value)
            points.append(point)

        write_api.write(bucket=client.bucket, org=client.org, record=points)
        logging.info(
            f"wrote {len(points)} points for measurement '{measurement}'"
        )

    except Exception as e:
        logging.error(f"failed to write to influxdb: {e}")


def init_influx_db(client: InfluxDBClient) -> None:
    try:
        buckets_api = client.buckets_api()
        bucket = buckets_api.find_bucket_by_name(client.bucket)

        if bucket:
            buckets_api.delete_bucket(bucket)
            logging.info(f"bucket '{client.bucket}' dropped")

        buckets_api.create_bucket(bucket_name=client.bucket, org=client.org)
        logging.info(f"new bucket '{client.bucket}' created")

    except Exception as e:
        logging.error(f"failed to initialize influxdb: {e}")
        raise


def process_files(input_dir: Path, config: InfluxConfig) -> None:
    csv_files = list(input_dir.glob(CSV_PATTERN))
    if not csv_files:
        raise FileNotFoundError(f"no csv files found in '{input_dir}'")

    logging.info(f"processing {len(csv_files)} files from '{input_dir}'")

    with InfluxDBClient(
        url=config.url,
        username=config.user,
        password=config.password,
        org=config.org,
    ) as client:
        client.bucket = config.bucket
        client.org = config.org

        init_influx_db(client)

        for file in csv_files:
            df = parse_csv(file)
            if not df.empty:
                write_to_influx(df, file.stem, client)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Load your CSV crap into InfluxDB without breaking everything",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    # Basic usage (if you trust .env defaults like an idiot)
    %(prog)s /path/to/csv/dir

    # Override credentials (slightly less idiotic)
    %(prog)s /path/to/csv/dir --username your_user --password your_pass

Environment:
    INFLUX_URL       InfluxDB URL (default: http://localhost:8086)
    INFLUX_USER      Username (can be overridden by --username)
    INFLUX_PASS      Password (can be overridden by --password)
    INFLUX_ORG       Organization (default: org)
    INFLUX_BUCKET    Bucket name (default: telemetry)
    LOG_LEVEL        Logging level (default: INFO)

Notes:
    - Creates a new bucket, destroying any existing data (you've been warned)
    - Expects CSV files with a 'time' column (case-insensitive)
    - Uses filename as measurement name, so don't use stupid filenames
    - All numeric columns will be stored as fields
    """,
    )
    parser.add_argument(
        "input_dir",
        type=Path,
        help="directory with your CSV files (they better exist)",
    )
    parser.add_argument(
        "--username",
        type=str,
        help="override .env username (in case you don't trust environment variables)",
    )
    parser.add_argument(
        "--password",
        type=str,
        help="override .env password (store this in your shell history, I dare you)",
    )
    parser.add_argument(
        "--bucket",
        type=str,
        help="override .env bucket",
    )

    args = parser.parse_args()

    try:
        config = load_config(args)
        process_files(args.input_dir, config)
    except Exception as e:
        logging.error(f"execution failed: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
