#!/bin/bash

# One time manual deployment script

# Start Docker Compose services
docker compose up -d

# Change permissions of the host directory
sudo chmod -R 755 ~/.volumes

# Change ownership of the host directory to a specific user and group
sudo chown -R ubuntu:docker ~/.volumes