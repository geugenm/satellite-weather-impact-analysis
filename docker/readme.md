# Docker Compose for MLflow 📦

Welcome to the **Docker Compose** setup for **MLflow**! This project provides a streamlined way to deploy and manage these powerful tools for time-series data storage and machine learning lifecycle management. Here's how to get started:

## Overview 📝

This Docker Compose configuration sets up:

- **MLflow**: An open-source platform to manage the end-to-end machine learning lifecycle, including experiment tracking, model packaging, and serving.

## Prerequisites 🛠️

Before you begin, ensure you have:

- Docker installed on your system (version 20.10.0 or later)
- Docker Compose installed (version 1.29.0 or later)
- Basic understanding of Docker and containerization

## Usage 🚀

### Start the Services

To start the MLflow service, run:

```

sudo docker compose -f docker/compose.yml up

```

This command will:

- Pull the latest image for MLflow if not already present.
- Start the containers in detached mode.
- Map the necessary ports for external access.

### Accessing Services

- **MLflow**: Access the MLflow UI at `http://localhost:5000`.

### Stopping Services

To stop the services:

```bash
sudo docker compose -f docker/compose.yml down
```

## Configuration Details ⚙️

### Networks

- **default**: Uses the `bridge` driver for internal communication between containers.

### Services

#### MLflow

- **Image**: `ghcr.io/mlflow/mlflow:latest`
- **Container Name**: `mlflow`
- **Restart Policy**: `unless-stopped`
- **Ports**: `5000:5000`
- **Volumes**: `./mlruns:/mlruns:Z`
- **Command**:

```

bash -c "mlflow server --host 0.0.0.0 --port 5000"

```
