"""This module holds the PolarisFrame class.
"""

from modules.common.json_serializable import JsonSerializable


class PolarisFrame(dict, JsonSerializable):
    """Class for Polaris frames"""

    def __init__(self, frame=None):
        """Initialize a Polaris Frame object"""
        dict.__init__(self)
        JsonSerializable.__init__(self)
        if frame is not None:
            for key, value in frame.items():
                self[key] = value
