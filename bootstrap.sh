#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
apt-get install mysql-client-core-5.5
rm -rf /var/www
ln -fs /vagrant /var/www