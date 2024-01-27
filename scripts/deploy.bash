#! /bin/bash 

set -eu

cd $(dirname ${BASH_SOURCE[0]})
cd ..

sudo mkdir -p /var/www/diatrix

WWW=/var/www/diatrix
for dir in src shared; do
	sudo mkdir -p ${WWW}/${dir}
	sudo rsync -avh --delete ./${dir}/ ${WWW}/${dir}
done

echo "Setting up nginx config as default"
sudo ln -s -f $(pwd)/nginx/default /etc/nginx/sites-enabled/default

echo "Restarting nginx"
sudo systemctl restart nginx
echo "Checking nginx status"
sudo systemctl status nginx --no-pager

