#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update
sudo apt upgrade -y

# Enable and configure the firewall (iptables)
echo "Configuring the firewall (iptables)..."
sudo apt install iptables-persistent -y
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo netfilter-persistent save

# Secure SSH
echo "Securing SSH..."
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl reload ssh

# Install and configure Fail2ban
echo "Installing and configuring Fail2ban..."
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Install unattended-upgrades for automatic security updates
echo "Setting up automatic security updates..."
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades

# Harden file permissions (customize as needed)
echo "Harden file permissions (customize as needed)..."

# Additional security measures can be added here...

# Display a message indicating the script has completed
echo "Security script execution completed."
