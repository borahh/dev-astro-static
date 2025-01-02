# Use the official devcontainer image for Node.js
FROM mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

# Install additional utilities: figlet and lolcat
RUN apt-get update && \
    apt-get install -y figlet && \
    apt-get install -y lolcat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
