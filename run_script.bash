#!/bin/bash
# This script runs terraform and ansible playbook to set up a server.
set -e
# Ensure Terraform and Ansible are installed
if ! command -v terraform &> /dev/null; then
  echo "Terraform is not installed. Please install Terraform to run this script."
  exit 1
fi
if ! command -v ansible-playbook &> /dev/null; then
  echo "Ansible is not installed. Please install Ansible to run this script."
  exit 1
fi
# Run Terraform to set up the infrastructure
terraform init
terraform apply -auto-approve
# Get the public IP of the server from Terraform output
PUBLIC_IP=$(terraform output -raw instance_public_ip)
# Check if the public IP is empty
if [ -z "$PUBLIC_IP" ]; then
  echo "Error: Public IP is empty. Terraform output may have failed."
  exit 1
fi
# change to the directory where the Ansible playbook is located
cd ~/terraform_minecraft_server/ansible

echo "Initializing Terraform and applying the configuration..."
sleep 10 # Wait for the server to be ready
# This sleep is necessary to ensure the server is fully up before Ansible tries to connect
# Run Ansible playbook to configure the server
ansible-playbook -i "$PUBLIC_IP," playbook.yml \
  --private-key=~/terraform_minecraft_server/.aws/keys/minecraft_project_2 \
  -u ubuntu \
  --extra-vars "ansible_python_interpreter=/usr/bin/python3"

# Check if the Ansible playbook ran successfully
if [ $? -ne 0 ]; then
  echo "Error: Ansible playbook failed."
  exit 1
fi
# Output the public IP of the server
echo "Server is set up successfully. Public IP: $PUBLIC_IP"
# Optionally, you can add a cleanup step to destroy the infrastructure
# Uncomment the following line if you want to destroy the infrastructure after setup
# terraform destroy -auto-approve
# End of script
