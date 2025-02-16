from dataclasses import dataclass
from datetime import datetime
import pandas as pd
from influxdb_client import InfluxDBClient


@dataclass
class InfluxWrapper:
    url: str
    token: str
    org: str

    def __post_init__(self):
        self.client = InfluxDBClient(
            url=self.url, token=self.token, org=self.org
        )
        self.query_api = self.client.query_api()

    def __del__(self):
        self.client.close()

    def get_bucket_df(
        self,
        time_from: str | datetime,
        time_to: str | datetime,
        bucket_list: list[str] | str,
    ) -> pd.DataFrame:
        buckets = [bucket_list] if isinstance(bucket_list, str) else bucket_list
        start = (
            time_from if isinstance(time_from, str) else time_from.isoformat()
        )
        stop = time_to if isinstance(time_to, str) else time_to.isoformat()

        all_data = pd.DataFrame()
        for bucket in buckets:
            query = f"""
                from(bucket: "{bucket}")
                    |> range(start: {start}, stop: {stop})
                    |> pivot(rowKey:["_time"],
                            columnKey: ["_field"],
                            valueColumn: "_value")
            """
            try:
                result = self.query_api.query_data_frame(query)
                if isinstance(result, list):
                    df = pd.concat(result)
                else:
                    df = result

                if not df.empty:
                    df = df.drop(
                        columns=[
                            "result",
                            "table",
                            "_start",
                            "_stop",
                            "_measurement",
                        ]
                    )
                    df = df.rename(columns={"_time": "time"}).set_index("time")
                    all_data = pd.concat([all_data, df])
            except Exception as e:
                print(f"query failed for bucket {bucket}: {e}")

        return (
            all_data.groupby("time").mean().sort_index()
            if not all_data.empty
            else pd.DataFrame()
        )

    def get_bucket_sources(
        self, bucket_list: list[str] | str
    ) -> dict[str, str]:
        buckets = [bucket_list] if isinstance(bucket_list, str) else bucket_list
        result = {}

        for bucket in buckets:
            query = f"""
                from(bucket: "{bucket}")
                    |> range(start: -10y)
                    |> group(columns: ["_field", "_measurement"])
                    |> distinct(column: "_field")
            """
            tables = self.query_api.query(query)
            result.update(
                {
                    record.get_value(): record.values["_measurement"]
                    for table in tables
                    for record in table.records
                }
            )
        return result
