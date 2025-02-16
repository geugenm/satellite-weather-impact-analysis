# InfluxDB Docker Setup

This setup provides a containerized InfluxDB 2.x instance with persistent storage.

## Prerequisites

- Docker
- Docker Compose

## Directory Structure

```
project-root/
├── influxdb.yml
├── influxdb/
    ├── data/
    └── config/
```

## Quick Start

1. Create required directories:

```bash
mkdir -p ./influxdb/{data,config}
```

2. Set correct permissions:

```bash
sudo chown -R 1000:1000 ./influxdb
sudo chmod -R 777 ./influxdb
```

3. Start InfluxDB (from project root):

```bash
docker compose -f docker/influxdb.yml up -d
```

## Management Commands

- Stop the service:

```bash
docker compose -f docker/influxdb.yml down
```

- View logs:

```bash
docker compose -f docker/influxdb.yml logs -f
```

## Access

- UI: `http://localhost:8086`
- Default credentials:
  - Username: ejk
  - Password: 11111111
  - Organization: org
  - Default bucket: default-bucket

## Important Notes

- Always run commands from project root directory
- Data persists in `./influxdb` directory
- Port 8086 must be available on host machine
- Admin token is set to: `my_super_secret_token`

## Troubleshooting

If you encounter permission errors:

```bash
sudo chown -R 1000:1000 ./influxdb
sudo chmod -R 777 ./influxdb
```

---
