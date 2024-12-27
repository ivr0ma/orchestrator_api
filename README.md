# Orchestrator API Project

## Overview
The `orchestrator_api` repository contains a set of services that work together to provide task management, URL shortening, and a unified interface for interacting with them. The services are deployed using Docker Compose and include the following:

1. **Todo-SQLite**: A service for managing tasks.
2. **Short URL**: A service for shortening URLs.
3. **Orchestrator API Interface**: A Streamlit-based web interface to interact with the other services.

## Prerequisites
- **Git**: [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).
- **Docker**: [Install Docker](https://docs.docker.com/get-docker/).
- **Docker Compose**: If using Docker Desktop, Compose is included. Otherwise, [install Docker Compose](https://docs.docker.com/compose/install/).

## Repository Structure
```
.
├── docker-compose.yml        # Docker Compose configuration
├── build.sh                  # Script to build or pull images
├── start.sh                  # Script to start services
├── stop.sh                   # Script to stop services
├── README.md                 # Documentation for the repository
├── todo-sqlite/              # Todo-SQLite service code
├── short_url/                # Short URL service code
└── orchestrator_api_interface/  # Unified interface code
```

## Setup and Usage

### 1. Clone the repository and initialize submodules
```bash
git clone https://github.com/ivr0ma/orchestrator_api.git
cd orchestrator_api
git submodule update --init --recursive
```

### 2. Build or Pull Images
Run the `build.sh` script to pull images from Docker Hub or build them locally if unavailable:
```bash
./build.sh
```

### 3. Start Services
Use the `start.sh` script to start all services:
```bash
./start.sh
```
Once the services are running, you can access the interface at:
- [http://localhost:8501](http://localhost:8501) (Streamlit interface)

### 4. Stop Services
Use the `stop.sh` script to stop and clean up services:
```bash
./stop.sh
```

## Accessing Services
- **[Todo-SQLite API](https://github.com/ivr0ma/todo_app)**:
  - Base URL: `http://localhost:8000`
  - Example: `GET /items`
- **[Short URL API](https://github.com/ivr0ma/shorturl_app)**:
  - Base URL: `http://localhost:8001`
  - Example: `POST /shorten`
- **[Unified Interface](https://github.com/ivr0ma/orchestrator_api_interface)**:
  - URL: [http://localhost:8501](http://localhost:8501)
