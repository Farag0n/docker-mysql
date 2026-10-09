# Docker MySql

MySQL configuration using Docker Compose for local development.

## Requirements

* Docker Desktop or Docker Engine
* Docker Compose v2

## Configuration

1. Copy `.env.example` to `.env`.
2. Configure the required environment variables with secure local values.

## Commands

### Start the service

Start MySql in detached mode:

```bash
docker compose up -d
```

### Check the service status

```bash
docker compose ps
```

### View logs

Follow the service logs in real time:

```bash
docker compose logs -f
```

### Pause the service

Temporarily suspend the running containers:

```bash
docker compose pause
```

### Resume the service

Resume the paused containers:

```bash
docker compose unpause
```

### Stop the service

Stop the containers without removing them:

```bash
docker compose stop
```

### Remove the containers

Stop and remove the containers and networks created by Docker Compose:

```bash
docker compose down
```

### Remove the containers and persistent data

**Warning:** This command also removes the named volumes declared in the Compose file, permanently deleting the MongoDB data stored in those volumes.

```bash
docker compose down -v
```

## Data Persistence

MySQL data is persisted through the named volume defined in `compose.yaml`.

The data remains available when containers are stopped, paused, resumed, or removed using `docker compose down`, as long as the volume is not deleted.

Removing the volume with `docker compose down -v` deletes the persisted database data.
