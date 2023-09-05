#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
sudo chkconfig httpd on
# Set file permissions for the Apache web server
sudo groupadd www
sudo usermod -a -G www ec2-user
sudo chgrp -R www /var/www
sudo chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} +
find /var/www -type f -exec sudo chmod 0664 {} +
# Create a new index.html file at  /var/www/html/ path
echo "<html> <head><title>server 01</title> </head> <body><h1>This is server 01 </h1></body> </html>" >/var/www/html/index.html
