from pydantic import BaseModel, Field, model_validator
import numpy as np


class LinkEntry(BaseModel):
    source: str = Field(..., description="Unique identifier for source node")
    target: str = Field(..., description="Unique identifier for target node")
    coefficient: float = Field(
        ...,
        ge=0.0,
        le=1.0,
        description="Normalized relationship strength between nodes",
    )

    @model_validator(mode="after")
    def check_self_reference(self):
        if self.source == self.target:
            raise ValueError("Source and target must be different")
        return self


class SatelliteGraphData(BaseModel):
    satellite: str = Field(
        ..., min_length=3, description="Official satellite designation name"
    )
    links: list[LinkEntry] = Field(
        ...,
        min_length=1,
        description="Non-directional relationships between components",
    )
    graph_link_threshold: float = Field(
        ..., description="Threshold for graph link"
    )

    @model_validator(mode="after")
    def check_nan_values(self):
        for link in self.links:
            if np.isnan(link.coefficient):
                raise ValueError("Coefficient cannot be NaN")
        return self
