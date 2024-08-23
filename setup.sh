#!/bin/bash

# Update the package list
echo "Updating packages..."
sudo yum update -y

# Install Nginx
echo "Installing Nginx..."
sudo amazon-linux-extras install nginx1 -y

# Start and enable Nginx to run at startup
echo "Starting Nginx..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Install Docker
echo "Installing Docker..."
sudo yum install docker -y

# Start and enable Docker to run at startup
echo "Starting Docker..."
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installation
echo "Verifying Docker and Docker Compose installations..."
docker --version
docker-compose --version

echo "Setup completed!"

