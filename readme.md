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

## 🛠️ Getting Started

### 🐍 Prerequisites

Python Version

```bash
python --version
```

### ⚡ Quick Install

1. **Clone Repository**

```bash
git clone https://github.com/geugenm/satellite-weather-impact-analysis.git
cd satellite-weather-impact-analysis
```

2. **Install Dependencies**

Choose your preferred package manager:

**pip** (standard)

```bash
pip install -e ".[dev]"  # Unix/Windows
pip install -e '.[dev]'  # Zsh
```

**uv** (high performance)

```bash
uv pip install -e ".[dev]"
```

**poetry** (modern)

```bash
poetry install --with dev
```

> The `-e` flag enables editable mode - source changes reflect immediately

### 🛰️ Satellite Data Tools

Using [satnogs-decoders](https://gitlab.com/librespacefoundation/satnogs/satnogs-decoders):

```bash
# Fetch satellite frames
satnogs-decoders-master/contrib/manage/fetch_frames_from_network.py \
    40967 \
    2018-10-26T00:00:00 \
    2018-10-26T01:00:00 \
    ./fox1a/

# Decode frames
decode_frame fox1a fox1a/data_XXXX
```

## 🤝 Contributing

We welcome contributions! For major changes:

1. Fork the repository
2. Create a feature branch
3. Open an issue for discussion
4. Submit a pull request

## 📜 License

Released under [MIT](license.md) by [@geugenm](https://github.com/geugenm)

<div align="center">

---

<sub>Built with 💫 by space enthusiasts</sub>

</div>
