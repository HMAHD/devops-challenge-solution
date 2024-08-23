#!/bin/bash

# Name of our Docker container
CONTAINER_NAME="devops-challenge-apps-web-1"

# File we want to update
FILE_TO_UPDATE="/app/data/daily_message.txt"

# Create a message with today's date
NEW_MESSAGE="Daily update: $(date)"

# Check if our container is running
docker ps | grep $CONTAINER_NAME
if [ $? -ne 0 ]; then
    echo "Oops! Container not found or not running."
    exit 1
fi

# Try to update the file in the container
docker exec $CONTAINER_NAME bash -c "mkdir -p /app/data && echo '$NEW_MESSAGE' > $FILE_TO_UPDATE"
if [ $? -ne 0 ]; then
    echo "Oops! Couldn't update the file."
    exit 1
fi

# Check if the file exists now
docker exec $CONTAINER_NAME bash -c "ls $FILE_TO_UPDATE"
if [ $? -ne 0 ]; then
    echo "Oops! File doesn't exist after update."
    exit 1
fi

# Restart the container
docker restart $CONTAINER_NAME
if [ $? -ne 0 ]; then
    echo "Oops! Couldn't restart the container."
    exit 1
fi

# All done!
echo "Yay! Updated the file on $(date)"
