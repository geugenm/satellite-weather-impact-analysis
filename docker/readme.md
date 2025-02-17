# Docker Compose for InfluxDB and MLflow 📦

Welcome to the **Docker Compose** setup for **InfluxDB** and **MLflow**! This project provides a streamlined way to deploy and manage these powerful tools for time-series data storage and machine learning lifecycle management. Here's how to get started:

## Overview 📝

This Docker Compose configuration sets up:

- **InfluxDB**: A scalable time-series database for storing and querying large volumes of time-stamped data.
- **MLflow**: An open-source platform to manage the end-to-end machine learning lifecycle, including experiment tracking, model packaging, and serving.

## Prerequisites 🛠️

Before you begin, ensure you have:

- Docker installed on your system (version 20.10.0 or later)
- Docker Compose installed (version 1.29.0 or later)
- Basic understanding of Docker and containerization

## Installation 📥

**Environment Variables**:

- Create a `default.env` file in the root directory with the following environment variables:

    ```
    DOCKER_INFLUXDB_INIT_MODE=setup
    DOCKER_INFLUXDB_INIT_USERNAME=ejk
    DOCKER_INFLUXDB_INIT_PASSWORD=11111111
    DOCKER_INFLUXDB_INIT_ORG=org
    DOCKER_INFLUXDB_INIT_BUCKET=default
    DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=my_super_secret_token
    DOCKER_INFLUXDB_INIT_RETENTION=0
    DOCKER_INFLUXDB_INIT_HOST=http://localhost:8086
    LOG_LEVEL=WARNING
    ```

## Usage 🚀

### Start the Services

To start the InfluxDB and MLflow services, run:

```

sudo docker compose -f docker/compose.yml up

```

This command will:

- Pull the latest images for InfluxDB and MLflow if not already present.
- Start the containers in detached mode.
- Map the necessary ports for external access.

### Accessing Services

- **InfluxDB**: Access the InfluxDB UI at `http://localhost:8086` with the credentials provided in the `default.env` file.
- **MLflow**: Access the MLflow UI at `http://localhost:5000`.

### Stopping Services

To stop the services:

```

sudo docker compose -f docker/compose.yml down

```

## Configuration Details ⚙️

### Networks

- **default**: Uses the `bridge` driver for internal communication between containers.

### Services

#### InfluxDB

- **Image**: `influxdb:latest`
- **Container Name**: `influxdb`
- **Restart Policy**: `unless-stopped`
- **Ports**: `8086:8086`
- **Volumes**:
  - `./influxdb/config:/etc/influxdb2:Z`
  - `./influxdb/data:/var/lib/influxdb2:Z`
- **Environment File**: `default.env`

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
