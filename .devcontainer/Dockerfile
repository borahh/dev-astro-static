# Use the official devcontainer image for Node.js
FROM mcr.microsoft.com/devcontainers/javascript-node:1-22-bookworm

# Install figlet
RUN apt-get update && \
    apt-get install -y figlet && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
