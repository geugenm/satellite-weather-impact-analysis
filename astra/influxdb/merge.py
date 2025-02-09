from pathlib import Path
import argparse
import logging
import pandas as pd
from influxdb_client import InfluxDBClient, Point, WritePrecision
from influxdb_client.client.write_api import SYNCHRONOUS

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def parse_csv(file_path: Path) -> pd.DataFrame:
    try:
        df = pd.read_csv(file_path)
        df = df.rename(
            columns=lambda col: "time" if col.lower() == "time" else col
        )
        df["time"] = pd.to_datetime(df["time"])
        df = df.set_index("time")
        return df
    except Exception as e:
        logger.error(f"failed to parse {file_path}: {e}")
        return pd.DataFrame()


def write_to_influx(
    df: pd.DataFrame, measurement: str, client: InfluxDBClient
) -> None:
    try:
        write_api = client.write_api(write_options=SYNCHRONOUS)

        for timestamp, row in df.iterrows():
            point = Point(measurement)
            point.time(timestamp, WritePrecision.NS)

            for column, value in row.items():
                if pd.notna(value):
                    point.field(column, value)

            write_api.write(bucket="telemetry", org="org", record=point)

    except Exception as e:
        logger.error(f"failed to write to influxdb: {e}")


def init_influx_db(client: InfluxDBClient) -> None:
    try:
        buckets_api = client.buckets_api()
        bucket = buckets_api.find_bucket_by_name("telemetry")

        if bucket:
            buckets_api.delete_bucket(bucket)
            logger.info("telemetry bucket dropped")

        # Create new bucket
        buckets_api.create_bucket(bucket_name="telemetry", org="org")
        logger.info("new telemetry bucket created")

    except Exception as e:
        logger.error(f"failed to initialize influxdb: {e}")


def process_directory(input_dir: Path, username: str, password: str) -> None:
    try:
        csv_files = list(input_dir.glob("*.csv"))
        if not csv_files:
            logger.error(f"no csv files found in '{input_dir}'")
            return

        logger.info(f"processing {len(csv_files)} files from '{input_dir}'")

        client = InfluxDBClient(
            url="http://localhost:8086",
            username=username,
            password=password,
            org="org",
        )

        init_influx_db(client)

        for file in csv_files:
            df = parse_csv(file)
            if not df.empty:
                measurement = file.stem
                write_to_influx(df, measurement, client)
                logger.info(f"wrote {len(df)} points from '{file}' to influxdb")

        client.close()

    except Exception as e:
        logger.error(f"failed to process directory: {e}")


def main():
    parser = argparse.ArgumentParser(description="Import CSV files to InfluxDB")
    parser.add_argument(
        "input_dir", type=Path, help="directory containing CSV files"
    )
    parser.add_argument("--username", default="admin", help="influxdb username")
    parser.add_argument("--password", default="admin", help="influxdb password")

    args = parser.parse_args()
    process_directory(args.input_dir, args.username, args.password)


if __name__ == "__main__":
    main()
