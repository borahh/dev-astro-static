#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Display welcome message using figlet
clear
figlet -c "Setup Script"

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
    echo "No package.json found. Creating a new Astro project in a temporary branch..."
    
    # Create a temporary branch for Astro setup
    TEMP_BRANCH="astro-setup-temp"
    DEFAULT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    git checkout -b "$TEMP_BRANCH"
    
    # Initialize Astro project
    npm create astro@latest . -- --yes
    echo "Astro project created successfully in the temporary branch."

    # Merge the temporary branch into the default branch
    git add .
    git commit -m "Initial Astro project setup"
    git checkout "$DEFAULT_BRANCH"
    git merge -X theirs "$TEMP_BRANCH" --no-edit
    echo "Merged Astro setup into the default branch."

    # Delete the temporary branch
    git branch -D "$TEMP_BRANCH"
    echo "Deleted the temporary branch."
  else
    echo "package.json already exists. Skipping Astro initialization."
  fi
}

# Main script execution
install_dependencies
initialize_astro_project

figlet -c "Setup Complete"
echo "Setup completed successfully."
