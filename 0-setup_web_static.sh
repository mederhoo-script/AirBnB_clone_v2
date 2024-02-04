#!/usr/bin/env bash
# Install Nginx if not already installed
apt-get update
apt-get -y install nginx

# Create necessary directories if they don't exist
mkdir -p /data/web_static/releases/test
mkdir -p /data/web_static/shared

# Create a fake HTML file for testing
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" > /data/web_static/releases/test/index.html

# Create symbolic link and give ownership of /data/ to ubuntu user and group
ln -sf /data/web_static/releases/test/ /data/web_static/current
chown -R ubuntu /data/
chgrp -R ubuntu /data/

# Update Nginx configuration to serve content of /data/web_static/current/ to hbnb_static
config="\n\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n"
sed -i "/server_name _;/a $config" /etc/nginx/sites-available/default

# Restart Nginx to apply changes
service nginx restart
