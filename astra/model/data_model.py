import numpy as np
from pydantic import BaseModel, Field, model_validator


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
            raise ValueError("source and target must be different")
        return self


class SatelliteGraphData(BaseModel):
    satellite: str = Field(
        ..., min_length=3, description="Official satellite designation name"
    )
    links: list[LinkEntry] = Field(
        default_factory=list,
        description="Non-directional relationships between components",
    )
    graph_link_threshold: float = Field(
        ..., description="Threshold for graph link"
    )

    @model_validator(mode="after")
    def check_nan_values(self):
        if any(np.isnan(link.coefficient) for link in self.links):
            raise ValueError("coefficient cannot be NaN")

        if not self.links:
            raise ValueError("at least one link is required")

        return self
