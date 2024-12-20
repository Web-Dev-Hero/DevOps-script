#!/bin/bash

# Jenkins Installation Script for Root User
# Run this script as root (superuser).

echo "Updating system packages..."
apt update && apt upgrade -y

echo "Installing Java (OpenJDK 11)..."
apt install openjdk-11-jdk -y
if java -version; then
    echo "Java installed successfully."
else
    echo "Java installation failed. Exiting."
    exit 1
fi

echo "Adding Jenkins repository and GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins repository to sources list..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating package list with Jenkins repository..."
apt update

echo "Installing Jenkins..."
apt install jenkins -y
if systemctl status jenkins | grep -q "active (running)"; then
    echo "Jenkins installed and running successfully."
else
    echo "Jenkins installation failed. Check logs for details."
    exit 1
fi

echo "Starting and enabling Jenkins service..."
systemctl start jenkins
systemctl enable jenkins

echo "Fetching initial admin password..."
ADMIN_PASSWORD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)

echo "Installation complete."
echo "Access Jenkins at: http://<your-server-ip>:8080"
echo "Initial admin password: $ADMIN_PASSWORD"

