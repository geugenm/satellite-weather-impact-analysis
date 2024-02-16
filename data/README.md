# Solar Cycle Indices: Recent and Predicted

## Observed Solar Cycle Indices

Data fields for recent solar indices of observed monthly mean values are provided in JSON format.

### Fields

- `time-tag`: yyyy-mm
- `ssn`: Mean monthly S.I.D.C. sunspot number
- `smoothed_ssn`: Smoothed S.I.D.C. sunspot number
- `observed_swpc_ssn`: Mean monthly SWPC/SWO sunspot number
- `smoothed_swpc_ssn`: Smoothed SWPC/SWO sunspot number
- `f10.7`: Mean monthly Penticton, B.C.  10.7cm radio flux values (sfu)
- `smoothed_f10.7`: Smoothed  10.7cm radio flux values (sfu)

### Sources

- SWPC Space Weather Operations (SWO), Daily Observations
- S.I.D.C. Brussels International Sunspot Number, Data Files (link is external)
- Penticton, B.C., Canada:  10.7cm radio flux values (sfu), Data Files (link is external)

## Predicted Solar Cycle Indices

Data fields for sunspot number and radio flux values with expected ranges are provided in JSON format.

### Fields

- `time-tag`: yyyy-mm
- `predicted_ssn`: Predicted sunspot number
- `high_ssn`: Predicted sunspot number high range
- `low_ssn`: Predicted sunspot number low range
- `predicted_f10.7`: Predicted f10.7cm value
- `high_f10.7`: Predicted f10.7cm high range
- `low_f10.7`: Predicted f10.7cm low range

### Sources

- S.I.D.C. Brussels International Sunspot Number, Data Files (link is external)
- Penticton, B.C., Canada:  10.7cm radio flux values (sfu), Data Files (link is external)
- Predicted values are based on the consensus of the Solar Cycle  25 Prediction Panel

## References

- [NOAA Solar Cycle Progression](https://www.swpc.noaa.gov/products/solar-cycle-progression)
