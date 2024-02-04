#!/usr/bin/env bash
# Install Nginx if not already installed
sudo apt-get update
sudo apt-get -y install nginx

# Create necessary directories if they don't exist
sudo mkdir -p /data/web_static/releases/test
sudo mkdir -p /data/web_static/shared

# Create a fake HTML file for testing
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html

# Create symbolic link and give ownership of /data/ to ubuntu user and group
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu /data/
sudo chgrp -R ubuntu /data/

# Update Nginx configuration to serve content of /data/web_static/current/ to hbnb_static
printf %s "server {
    listen 80 default_server;
    listen [::]:80 default_server;
    add_header X-Served-By $HOSTNAME;
    root   /var/www/html;
    index  index.html index.htm;

    location /hbnb_static {
        alias /data/web_static/current;
        index index.html index.htm;
    }

    location /redirect_me {
        return 301 https://sites.google.com/view/mederhoo-portfolio/home;
    }

    error_page 404 /404.html;
    location /404 {
      root /var/www/html;
      internal;
    }
}" > /etc/nginx/sites-available/default
# Restart Nginx to apply changes
sudo service nginx restart
