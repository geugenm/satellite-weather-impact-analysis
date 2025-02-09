from influxdb_client import InfluxDBClient
import pandas as pd
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname).1s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
logger = logging.getLogger(__name__)


def get_all_data(measurement: str = None, start: str = "-1h") -> pd.DataFrame:
    client = InfluxDBClient(
        url="http://localhost:8086",
        username="ejk",
        password="11111111",
        org="org",
    )

    query_api = client.query_api()

    measurement_filter = (
        f'r["_measurement"] == "{measurement}"' if measurement else "true"
    )

    query = f"""
    from(bucket: "telemetry")
        |> range(start: {start})
        |> filter(fn: (r) => {measurement_filter})
        |> pivot(rowKey:["_time"],
                columnKey: ["_field"],
                valueColumn: "_value")
    """

    try:
        result = query_api.query_data_frame(query)

        # Handle both single dataframe and list of dataframes
        if isinstance(result, list):
            if not result:
                logger.warning("no data found in influxdb")
                return pd.DataFrame()
            df = pd.concat(result)
        else:
            df = result

        if df.empty:
            logger.warning("no data found in influxdb")
            return pd.DataFrame()

        # Clean up the dataframe
        drop_cols = ["result", "table", "_start", "_stop", "_measurement"]
        df = df.drop(columns=[col for col in drop_cols if col in df.columns])
        df = df.rename(columns={"_time": "time"})
        df = df.set_index("time")

        logger.info(f"retrieved {len(df)} rows with {len(df.columns)} columns")
        return df

    except Exception as e:
        logger.error(f"failed to query influxdb: {e}")
        return pd.DataFrame()
    finally:
        client.close()


if __name__ == "__main__":
    df = get_all_data(start="-2y")

    if not df.empty:
        print("\nFirst few rows:")
        print(df.head())
        print("\nColumns:", df.columns.tolist())
        print("\nDataframe info:")
        print(df.info())
    else:
        print("no data retrieved")
