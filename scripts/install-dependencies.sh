#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting setup script..."

# Function to install dependencies using npm
install_dependencies() {
  echo "Installing dependencies with npm..."
  if [ -f "package.json" ]; then
    npm install
    echo "Dependencies installed successfully."
  else
    echo "No package.json found. Skipping npm install."
  fi
}

# Function to initialize a new Astro project
initialize_astro_project() {
  echo "Initializing a new Astro project in the current directory..."
  if [ ! -f "package.json" ]; then
    echo "No package.json found. Creating a new Astro project..."
    npm create astro@latest . -- --yes
    echo "Astro project created successfully."
  else
    echo "package.json already exists. Skipping Astro initialization."
  fi
}

# Main script execution
install_dependencies
initialize_astro_project

echo "Setup completed successfully."
