# InfluxDB Docker Setup

Simple and efficient InfluxDB deployment using Docker.

## Quick Start

```bash
sudo docker run -d -p 8086:8086 \
    -e DOCKER_INFLUXDB_INIT_MODE=setup \
    -e DOCKER_INFLUXDB_INIT_USERNAME=ejk \
    -e DOCKER_INFLUXDB_INIT_PASSWORD=11111111 \
    -e DOCKER_INFLUXDB_INIT_ORG=org \
    -e DOCKER_INFLUXDB_INIT_BUCKET=default-bucket \
    influxdb:latest
```

## Configuration

| Parameter    | Value          | Description            |
| ------------ | -------------- | ---------------------- |
| Port         | 8086           | HTTP API and UI port   |
| Username     | ejk            | Admin user             |
| Organization | org            | Primary organization   |
| Bucket       | default-bucket | Default storage bucket |

## Access

- UI: `http://localhost:8086`
- API endpoint: `http://localhost:8086/api/v2`

## Environment Variables

```bash
DOCKER_INFLUXDB_INIT_MODE=setup        # Enables first-run setup
DOCKER_INFLUXDB_INIT_USERNAME=ejk      # Admin username
DOCKER_INFLUXDB_INIT_PASSWORD=11111111 # Admin password
DOCKER_INFLUXDB_INIT_ORG=org          # Organization name
DOCKER_INFLUXDB_INIT_BUCKET=default-bucket  # Initial bucket
```

## Health Check

```bash
curl -I http://localhost:8086/health
```

## Container Management

```bash
# Check logs
sudo docker logs $(docker ps -q --filter ancestor=influxdb:latest)

# Stop container
sudo docker stop $(docker ps -q --filter ancestor=influxdb:latest)

# Remove container
sudo docker rm $(docker ps -aq --filter ancestor=influxdb:latest)
```

## Security Note

- Change default password in production
- Consider adding volume mounts for data persistence
- Use TLS in production environments

For production deployment, consider adding data persistence:

```bash
sudo docker run -d -p 8086:8086 \
    -v influxdb-data:/var/lib/influxdb2 \
    -v influxdb-config:/etc/influxdb2 \
    [... environment variables ...] \
    influxdb:latest
```

---
