#! /bin/bash 

sudo apt-get install -qy \
     certbot \
     python3-certbot-nginx \
     nginx
sudo systemctl enable nginx
sudo systemctl start nginx
