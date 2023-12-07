#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update
sudo apt upgrade -y

# Enable and configure the firewall (UFW)
echo "Configuring the firewall (UFW)..."
sudo apt install ufw -y
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable


# Install unattended-upgrades for automatic security updates
echo "Setting up automatic security updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades


# Check All Packages That Are Installed
echo "Checking what Packages are installed"
sudo apt list --installed
sudo dpkg-query -l

# Checks if packages have been modified than something other than APT OR DPKG
echo "Checking for modified packages"
sudo dpkg --verify

# Display a message indicating the script has completed
echo "Security script execution completed."
echo "Completed Execution READ THE README"
