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

# Disable Remote access protocols
echo("Disabling All Remote Access Tools")
systemctl stop ssh
systemctl disable ssh
echo("Disabled SSH")

# Install unattended-upgrades for automatic security updates
echo "Setting up automatic security updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Enable Strong Password Policy
echo("Enabling Stong Password Policy -   Needs Testing")
sudo vi /etc/pam.d/common-password

# Check All Packages That Are Installed
echo("Checking what Packages are installed")
sudo apt list --installed
sudo dpkg-query -l

# Display a message indicating the script has completed
echo "Security script execution completed."
