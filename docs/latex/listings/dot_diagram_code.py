import json
import pandas as pd
from typing import Dict, List, Union, Any
from datetime import datetime as dt

with open(satellite_json, "r") as file:
    json_stream: str = file.read()

json_data: dict = json.loads(json_stream)

if not json_data:
    logger.error("Json data is empty")
    exit(1)


class Satellite:
    def __init__(self, norad_id: int, name: str, observations_amount: int):
        self.norad_id: int = norad_id
        self.name: str = name
        self.observations_amount: int = observations_amount


metadata: dict = json_data["metadata"]

satellite: Satellite = Satellite(
    metadata["satellite_norad"],
    metadata["satellite_name"],
    metadata["total_frames"],
)

solar_and_satellite_parameters_names: Dict[str, str] = metadata["analysis"][
    "column_tags"
]

solar_parameters_names: List[str] = metadata["analysis"]["feature_columns"]

satellite_parameters_names: List[str] = [
    value
    for value in solar_and_satellite_parameters_names
    if value not in solar_parameters_names
]

frames: dict = json_data["frames"]

allowed_types: Union = Union[int, float, bool, str]

observation_data: List[Dict[str, dt]] = []

for frame in frames:
    observation_time = pd.to_datetime(frame["time"])
    fields: Dict[Any, Any] = {
        key: value["value"]
        for key, value in frame["fields"].items()
        if isinstance(value, dict)
    }
    observation_data.append({"time": observation_time, **fields})

observation_dataframe: pd.DataFrame = (
    pd.DataFrame(observation_data)
    .set_index("time")
    .dropna()
    .select_dtypes(include=np.number)
)

observation_dataframe = observation_dataframe.loc[
    :, observation_dataframe.nunique() > 1
]
