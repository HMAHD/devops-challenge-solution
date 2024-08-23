#!/bin/bash

# Set variables
CONTAINER_NAME="web_service"
FILE_TO_UPDATE="/app/data/daily_message.txt"

# Generate new content
NEW_MESSAGE="Daily update: $(date)"

# Update the file inside the Docker container
docker exec $CONTAINER_NAME /bin/bash -c "echo '$NEW_MESSAGE' > $FILE_TO_UPDATE"

# Restart the container to apply changes (if necessary)
docker restart $CONTAINER_NAME

echo "Content updated successfully on $(date)"
