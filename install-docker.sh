#!/bin/sh

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Clean
rm get-docker.sh

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add user to the Docker group / To simply execute Docker commands without sudo
sudo usermod -aG docker $(whoami) && newgrp docker

# Install Docker-Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
