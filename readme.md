<div align="center">

# 🛰️ ASTRA: Satellite Weather Impact Analysis

[![GitHub Issues](https://img.shields.io/github/issues/geugenm/satellite-weather-impact-analysis?style=for-the-badge&color=171b20&labelColor=171b20)](https://github.com/geugenm/satellite-weather-impact-analysis/issues)
[![Python](https://img.shields.io/badge/python-3.12+-171b20?style=for-the-badge&logo=python&logoColor=38bdae&labelColor=171b20)](https://www.python.org/downloads/)
[![Latex](https://img.shields.io/badge/LuaTeX-ready-171b20?style=for-the-badge&logo=latex&logoColor=38bdae&labelColor=171b20)](https://www.latex-project.org/)
[![License](https://img.shields.io/badge/license-MIT-171b20?style=for-the-badge&labelColor=171b20&color=171b20)](license.md)

[![Logo](img/logo.png)](https://github.com/geugenm/satellite-weather-impact-analysis)

> _Advanced Space-Time Research & Analysis Platform_

</div>

## 🚀 Overview

ASTRA is a high-performance analytical platform designed to uncover correlations between space weather patterns and operational satellite systems. Using advanced statistical methods and machine learning techniques, we process vast amounts of solar and satellite telemetry data to identify critical patterns and dependencies.

## ⚡ Key Features

- **Real-time Analysis**: Process satellite telemetry data in real-time
- **ML-powered Insights**: Advanced correlation detection using machine learning
- **High Performance**: Optimized for large-scale data processing
- **Scientific Visualization**: Beautiful interactive graphs and dashboards

## 🛠️ Tech Stack

- **Core**: Python 3.13+, NumPy, Pandas
- **ML**: mlflow, xgboost, scikit-learn
- **Visualization**: Plotly, pyecharts
- **Documentation**: LuaTeX, markdown, mermaid

## 📊 Preview

![Analysis Preview](img/preview.png)

<div align="center">

## 🔗 Quick Links

[📚 Documentation](docs) •
[🐛 Report Bug](https://github.com/geugenm/satellite-weather-impact-analysis/issues/new?labels=bug&template=bug-report---.md) •
[✨ Request Feature](https://github.com/geugenm/satellite-weather-impact-analysis/issues/new?labels=enhancement&template=feature-request---.md)

---

<sub>Built with 🚀 by space enthusiasts</sub>

</div>

### Prerequisites

- python 3.13+

    ```sh
    python --version
    ```

### Installation

1. Clone the repo

    ```shell
    git clone https://github.com/geugenm/satellite-weather-impact-analysis.git
    ```

2. To install development dependencies from pyproject.toml, use one of these commands:

```bash
pip install -e ".[dev]"
```

or if you're using uv (which is faster):

```bash
uv pip install -e ".[dev]"
```

For zsh users who might encounter quote issues, use:

```bash
pip install -e '.[dev]'
```

The -e flag makes it an "editable" install, which means changes in source files are immediately reflected without needing to reinstall.

#### Alternative Package Managers

**Poetry**:

```bash
poetry install --with dev
```

**uv**:

```bash
uv pip install --editable ".[dev]"
```

### Additional instruments on decoding and obtaining satellite data

To fetch more data use [satnogs-decoders](https://gitlab.com/librespacefoundation/satnogs/satnogs-decoders), example:

```sh
satnogs-decoders-master/contrib/manage/fetch_frames_from_network.py 40967 2018-10-26T00:00:00 2018-10-26T01:00:00 ./fox1a/

decode_frame fox1a fox1a/data_XXXX
```

## Contributing

Pull requests and issues are welcome. For major changes, please open an issue
first to discuss what you would like to change.

## License

Released under [MIT](license.md) by [@geugenm](https://github.com/geugenm).
