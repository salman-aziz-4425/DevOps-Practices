#!/bin/bash

# One time manual deployment script

# Change permissions of the host directory
sudo chmod -R 755 ~/.volumes

# Change ownership of the host directory to a specific user and group
sudo chown -R ubuntu:docker ~/.volumes

# Start Docker Compose services
docker-compose up -d