from dataclasses import dataclass
from pathlib import Path
from typing import Final, Optional
import logging
import sys

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
    """Query data from InfluxDB with optional measurement filter"""
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


def main() -> None:
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
            df = get_all_data(client, start="-2y")

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
