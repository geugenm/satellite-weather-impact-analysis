<h1 align="center">Satellite Weather Impact Analysis</h1>

<div align="center">
  <div>
    <a href="https://github.com/geugenm/satellite-weather-impact-analysis/issues">
      <img alt="GitHub Issues" src="https://img.shields.io/github/issues/geugenm/satellite-weather-impact-analysis?style=for-the-badge">
    </a>
    <img src="https://img.shields.io/badge/python-3.12+-green?style=for-the-badge&logo=python&logoColor=yellow" alt="Python" />
    <img src="https://img.shields.io/badge/Latex-LuaTeX-green?style=for-the-badge&logo=latex" alt="LaTeX" />
    <img src="https://img.shields.io/badge/License-GPU--GPL3.0-green?style=for-the-badge" alt="License" />
  </div>
  <br />
  <a href="https://github.com/geugenm/satellite-weather-impact-analysis">
    <img src="img/logo.png" alt="Logo" width="80" height="80">
  </a>
  <h3 align="center">Satellite Weather Impact Analysis</h3>
  <p align="center">
    This repository includes the code for a study that examines the effects of space weather on operational satellite systems. The analysis involves comparing solar data with active satellite data to uncover correlations between the two.
    <br />
    <a href="https://github.com/geugenm/satellite-weather-impact-analysis/docs"><strong>Explore the docs »</strong></a>
    <br /><br />
    <a href="https://github.com/geugenm/satellite-weather-impact-analysis/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/geugenm/satellite-weather-impact-analysis/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

### Prerequisites

python 3.11+
```sh
python --version
```

### Installation

1. Clone the repo
   ```shell
   git clone https://github.com/geugenm/satellite-weather-impact-analysis.git
   ```
2. Install pip requirements
   ```shell
   pip install -r requirements.txt
   ```

## Observed Solar Cycle Indices

Data fields for recent solar indices of observed monthly mean values are provided in JSON format.

| Field                  | Description                                         |
|------------------------|-----------------------------------------------------|
| `time-tag`             | yyyy-mm                                            |
| `ssn`                  | Mean monthly S.I.D.C. sunspot number               |
| `smoothed_ssn`        | Smoothed S.I.D.C. sunspot number                   |
| `observed_swpc_ssn`   | Mean monthly SWPC/SWO sunspot number               |
| `smoothed_swpc_ssn`   | Smoothed SWPC/SWO sunspot number                   |
| `f10.7`                | Mean monthly Penticton, B.C. 10.7cm radio flux values (sfu) |
| `smoothed_f10.7`      | Smoothed 10.7cm radio flux values (sfu)           |

### Sources

- SWPC Space Weather Operations (SWO), Daily Observations
- S.I.D.C. Brussels International Sunspot Number, Data Files
- Penticton, B.C., Canada: 10.7cm radio flux values (sfu), Data Files

---

## Predicted Solar Cycle Indices

Data fields for sunspot number and radio flux values with expected ranges are provided in JSON format.

| Field                  | Description                                         |
|------------------------|-----------------------------------------------------|
| `time-tag`             | yyyy-mm                                            |
| `predicted_ssn`        | Predicted sunspot number                           |
| `high_ssn`             | Predicted sunspot number high range                |
| `low_ssn`              | Predicted sunspot number low range                 |
| `predicted_f10.7`      | Predicted f10.7cm value                            |
| `high_f10.7`          | Predicted f10.7cm high range                       |
| `low_f10.7`           | Predicted f10.7cm low range                        |

### Sources

- S.I.D.C. Brussels International Sunspot Number, Data Files
- Penticton, B.C., Canada: 10.7cm radio flux values (sfu), Data Files
- Predicted values are based on the consensus of the Solar Cycle 25 Prediction Panel.

---

## References

- [NOAA Solar Cycle Progression](https://www.swpc.noaa.gov/products/solar-cycle-progression)

---

## Contributing

Pull requests and issues are welcome! For significant changes, please open an issue first to discuss your ideas.

## License

Released under [GNU GPL](/license.md) by [@geugenm](https://github.com/geugenm)
