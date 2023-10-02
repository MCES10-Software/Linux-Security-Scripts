#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo dnf update -y

# Enable and configure the firewall (Firewalld)
echo "Configuring the firewall (Firewalld)..."
sudo dnf install firewalld -y
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --set-default-zone=public
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Secure SSH
echo "Securing SSH..."
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl reload sshd


# Install dnf-automatic for automatic security updates
echo "Setting up automatic security updates..."
sudo dnf install dnf-automatic -y
sudo sed -i 's/apply_updates = no/apply_updates = yes/' /etc/dnf/automatic.conf
sudo systemctl enable --now dnf-automatic.timer

# Harden file permissions (customize as needed)
echo "Harden file permissions (customize as needed)..."

# Additional security measures can be added here...

# Display a message indicating the script has completed
echo "Security script execution completed."
