#!/bin/bash -ex
# Update
sudo apt-get update
sudo apt-get install -y nginx git
# Temp Clone
sudo git clone https://github.com/JesterCloud/Web_App.git /tmp/web_app_clone
# Delete HTML Nginx
sudo rm /var/www/html/index.nginx-debian.html
# Move fromRepo to var
sudo mv /tmp/web_app_clone/Code_BaseHTMLCSS/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo rm -rf /tmp/web_app_clone
sudo systemctl restart nginx