import json
from dataclasses import dataclass, field
import numpy as np


JSON_INDENT = 4


class JsonSerializable:
    def to_json(self) -> str:
        return json.dumps(self.__dict__, indent=JSON_INDENT)

    def from_json(self, json_string: str) -> None:
        self.__dict__.update(json.loads(json_string))


class PolarisMetadata(dict, JsonSerializable):
    def __init__(self, *initial_data: dict, **kwargs: dict) -> None:
        super().__init__(*initial_data, **kwargs)


@dataclass
class PolarisGraph(JsonSerializable):
    satellite_name: str = None
    graph: dict[str, list[dict[str, str]]] = field(
        default_factory=lambda: {"links": []}
    )

    def from_heatmap(self, heatmap, graph_link_threshold: float = 0.1) -> None:
        if heatmap is not None:
            self._add_links(heatmap, graph_link_threshold)

    def _add_links(self, heatmap, graph_link_threshold: float) -> None:
        for source, targets in heatmap.to_dict("dict").items():
            self.graph["links"].extend(
                {
                    "source": source,
                    "target": target,
                    "value": value,
                }
                for target, value in targets.items()
                if target != source
                and not np.isnan(value)
                and value >= graph_link_threshold
            )

    def __repr__(self) -> str:
        return self.to_json()

    def __str__(self) -> str:
        return self.to_json()
