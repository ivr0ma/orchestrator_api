#!/bin/bash
echo \"Building Docker images...\"
docker build -t todo_sqlite:latest ./todo_app
docker build -t short_url:latest ./shorturl_app
docker build -t orchestrator_api_interface:latest ./orchestrator_api_interface
echo \"Build complete.\"
