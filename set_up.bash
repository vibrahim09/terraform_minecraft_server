#!/bin/bash
# This script sets up the environment for running the Terraform and Ansible scripts.
set -e
# Ensure the necessary directories exist
mkdir -p ~/terraform_minecraft_server/.aws/keys
# change to the terraform_minecraft_server keys directory
cd ~/terraform_minecraft_server/.aws/keys

# make a private key for the project
if [ ! -f minecraft_project_2 ]; then
  echo "Creating private key for the project..."
  ssh-keygen -t ed25519 -f minecraft_project_2 -N "" -C "minecraft_project_2"
else
  echo "Private key minecraft_project_2 already exists."
fi

# Ensure the private key has the correct permissions
chmod 600 ~/terraform_minecraft_server/.aws/keys/minecraft_project_2

#End of script
echo "Environment setup complete. You can now run the Terraform and Ansible scripts."
