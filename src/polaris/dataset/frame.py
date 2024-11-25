from src.polaris.common.json_serializable import JsonSerializable


class PolarisFrame(dict, JsonSerializable):
    def __init__(self, frame=None):
        dict.__init__(self)
        JsonSerializable.__init__(self)
        if frame:
            self.update(frame)
