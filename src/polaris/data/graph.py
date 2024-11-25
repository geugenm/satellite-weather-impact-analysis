import json

import numpy as np

from src.polaris.common import constants
from src.polaris.common.json_serializable import JsonSerializable
from src.polaris.dataset.metadata import PolarisMetadata


class PolarisGraph(dict, JsonSerializable):
    DEFAULT_GRAPH_LINK_THRESHOLD = 0.1

    # The original format looked like this:
    #
    # {"nodes": [ ...], "links": [ ... ]}
    #
    # This was to match what is needed by the ForceGraph3D library.
    # We'll designate that format as '0'.
    DATA_FORMAT_VERSION = 1

    def __init__(self, metadata=None, **kwargs):
        """Initialize a new object

        :param **kwargs: optional dictionary giving names for building the keys
        to the graph
        """
        dict.__init__(self)
        JsonSerializable.__init__(self)

        self._links_key = kwargs.get("links", "links")
        self._target_key = kwargs.get("target", "target")
        self._source_key = kwargs.get("source", "source")
        self._value_key = kwargs.get("value", "value")
        self.metadata = PolarisMetadata(metadata)
        self.graph = {
            self._links_key: [],
        }

    def from_heatmap(self, heatmap, graph_link_threshold=DEFAULT_GRAPH_LINK_THRESHOLD):
        """Load from heatmap

        :param heatmap: The map to transform to graph
        :param graph_link_threshold: Only keeps links with value greater
        than this threshold.
        """
        if heatmap is None:
            return

        self._add_links(heatmap, graph_link_threshold)

    def _add_links(self, heatmap, graph_link_threshold=DEFAULT_GRAPH_LINK_THRESHOLD):
        """Add links as appropriate"""
        # Adding all edges to graph
        mdict = heatmap.to_dict("dict")
        for source in heatmap.to_dict("dict"):
            for target in mdict[source]:
                if target == source:
                    continue
                if np.isnan(mdict[source][target]) or isinstance(
                    mdict[source][target], str
                ):
                    continue
                if mdict[source][target] >= graph_link_threshold:
                    self.graph[self._links_key].append(
                        {
                            self._source_key: source,
                            self._target_key: target,
                            self._value_key: mdict[source][target],
                        }
                    )

    def __repr__(self):
        return self.to_json()

    def __str__(self):
        return self.to_json()

    def to_json(self):
        """Write a dataset object to JSON."""
        return json.dumps(
            {"metadata": self.metadata, "graph": self.graph},
            indent=constants.JSON_INDENT,
        )
