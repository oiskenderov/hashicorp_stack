#!/bin/bash

# Ensure the script is executable
#chmod +x .redis.sh

#Docker Prune
docker stop redis
docker rm redis
yes | sudo docker system prune -a
yes | sudo docker system prune --volumes

# Install Redis
docker run -d --name redis-server -p 6379:6379 redis:latest

# Check if Redis container is running
if docker ps | grep -q redis-server; then
    echo "Redis container is running."
else
    echo "Failed to start Redis container."
fi

