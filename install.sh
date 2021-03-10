#!/bin/false

# apt update
# apt install docker-compose
# apt remove docker-compose
# docker-compose 1.28 needed
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# lets encrypt storage
mkdir /srv/le
chmod 600 /srv/le

# build needs a user account
adduser build
adduser build docker
cd ~build
git clone https://github.com/thecodingmachine/workadventure

cd workadventure
cp -i ~/.env .
cp -i ~/docker-compose.yaml .
sudo -u build docker-compose build
sudo -u build docker-compose start
