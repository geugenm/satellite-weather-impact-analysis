"""This module holds the PolarisMetadata class.
"""

from src.polaris.common.json_serializable import JsonSerializable


class PolarisMetadata(dict, JsonSerializable):
    """Class for Polaris metadata"""

    DATA_FORMAT_VERSION = 1

    def __init__(self, *initial_data, **kwargs):
        """Initialize a PolarisMetadata object"""
        dict.__init__(self)
        JsonSerializable.__init__(self)
        self["data_format_version"] = self.DATA_FORMAT_VERSION
        for dictionary in initial_data:
            try:
                for key in dictionary:
                    self[key] = dictionary[key]
            except TypeError:
                pass
        for key in kwargs:
            self[key] = kwargs[key]
