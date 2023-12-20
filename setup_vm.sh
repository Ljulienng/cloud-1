#!/bin/bash

# Update and upgrade the system
sudo apt update -y && sudo apt upgrade -y

# Install necessary packages
sudo apt install -y wget unzip

# Download and install Terraform (Adjust version as necessary)
wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
sudo unzip terraform_0.12.24_linux_amd64.zip -d /usr/local/bin

# Generate SSH keys for Terraform (No passphrase)
ssh-keygen -t rsa -b 2048 -f ~/terraform/terraform -q -N ""

# Set proper permissions for the private key
chmod 400 ~/terraform/terraform