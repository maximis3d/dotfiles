#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Update and install LAMP stack + unzip
sudo apt-get update -y
sudo apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql unzip

# Enable and start services
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl enable mysql
sudo systemctl start mysql

# Allow HTTP/HTTPS traffic via UFW
sudo ufw allow OpenSSH
sudo ufw allow 'Apache Full'
sudo ufw --force enable

# Download your app from raw GitHub URL
curl -L -o /tmp/cloud-computing.zip https://raw.githubusercontent.com/maximis3d/cloud-dashboard-iac/main/cloud-computing.zip

# Extract app to web root, overwrite existing files
sudo unzip -o /tmp/cloud-computing.zip -d /var/www/html/

# Set proper ownership and permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
