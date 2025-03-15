from dataclasses import dataclass
from pathlib import Path
from os import getenv
import argparse
import logging

import pandas as pd
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS
from dotenv import load_dotenv

WRITE_PRECISION = WritePrecision.NS
CSV_PATTERN = "*.csv"


@dataclass
class InfluxConfig:
    url: str
    org: str
    bucket: str
    token: str = ""
    user: str = ""
    password: str = ""


def load_config(args: argparse.Namespace) -> InfluxConfig:
    load_dotenv()
    return InfluxConfig(
        url=getenv("INFLUX_URL", "http://localhost:8086"),
        org=getenv("INFLUX_ORG", "org"),
        bucket=args.bucket or getenv("INFLUX_BUCKET", "telemetry"),
        token=args.token or getenv("INFLUX_TOKEN", ""),
    )


def parse_csv(file_path: Path) -> pd.DataFrame:
    df = pd.read_csv(file_path)
    df.rename(
        columns=lambda col: "time" if col.lower() == "time" else col,
        inplace=True,
    )
    df["time"] = pd.to_datetime(df["time"])
    return df.set_index("time")


def write_to_influx(
    df: pd.DataFrame,
    measurement: str,
    client: InfluxDBClient,
    bucket: str,
    org: str,
) -> None:
    write_api = client.write_api(write_options=SYNCHRONOUS)
    points = []
    # Build list of points from each row in the dataframe
    for timestamp, row in df.iterrows():
        point = Point(measurement).time(timestamp, WRITE_PRECISION)
        for field, value in row.items():
            if pd.notna(value):
                point.field(field, value)
        points.append(point)
    write_api.write(bucket=bucket, org=org, record=points)
    logging.info(f"Wrote {len(points)} points to measurement '{measurement}'.")


def init_influx_db(client: InfluxDBClient, bucket: str, org: str) -> None:
    buckets_api = client.buckets_api()
    bucket_obj = buckets_api.find_bucket_by_name(bucket)
    if bucket_obj:
        buckets_api.delete_bucket(bucket_obj)
        logging.info(f"Deleted existing bucket '{bucket}'.")
    buckets_api.create_bucket(bucket_name=bucket, org=org)
    logging.info(f"Created new bucket '{bucket}' in org '{org}'.")


def process_files(input_dir: Path, config: InfluxConfig) -> None:
    csv_files = list(input_dir.glob(CSV_PATTERN))
    if not csv_files:
        raise FileNotFoundError(f"No CSV files found in '{input_dir}'.")
    logging.info(f"Processing {len(csv_files)} CSV file(s) from '{input_dir}'.")

    if not config.token:
        return

    client = InfluxDBClient(url=config.url, token=config.token, org=config.org)
    with client:
        init_influx_db(client, config.bucket, config.org)
        for file in csv_files:
            try:
                df = parse_csv(file)
                if not df.empty:
                    write_to_influx(
                        df, file.stem, client, config.bucket, config.org
                    )
            except Exception as e:
                logging.error(f"Failed processing file '{file}': {e}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Load CSV files into InfluxDB using token or user/pass authentication.",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
                %(prog)s /path/to/csv/dir --token your_api_token --bucket "bucket_name"

                Environment variables:
                INFLUX_URL, INFLUX_ORG, INFLUX_TOKEN

                Notes:
                - Creates a new bucket, destroying any existing data.
                - Expects CSV files with a 'time' column.
                - Uses the filename (without extension) as the measurement name.
                """,
    )
    parser.add_argument(
        "input_dir", type=Path, help="Directory containing CSV files."
    )
    parser.add_argument("--bucket", type=str, help="Override INFLUX_BUCKET.")
    parser.add_argument("--token", type=str, help="Override INFLUX_TOKEN.")
    args = parser.parse_args()

    try:
        config = load_config(args)
        process_files(args.input_dir, config)
    except Exception as e:
        logging.exception(f"Execution failed: {e}")
