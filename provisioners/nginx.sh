#!/bin/bash

echo "Installing Nginx..."
apt-get install -y nginx

echo "Creating Nginx directories..."
mkdir -p /etc/nginx/sites-available
mkdir -p /etc/nginx/sites-enabled

# echo "Removing default Nginx site..."
# rm -rf /etc/nginx/sites-enabled/default

echo "Copying custom Nginx configuration..."
cp /tmp/unir.conf /etc/nginx/sites-available/unir.conf

# echo "Creating symlink to enable custom Nginx configuration..."
# ln -s /etc/nginx/sites-available/unir.conf /etc/nginx/sites-enabled/unir.conf

echo "Restarting Nginx..."
service nginx restart