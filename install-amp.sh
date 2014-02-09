#!/bin/bash

echo "Initializing the Apache webserver."

sudo apt-get install apache2 apache2-utils

echo "Initializing PHP."

sudo apt-get install php5 php5-cli php5-curl php5-gd php5-json php5-mysql php-apc

echo "Initializing MySql server."

sudo apt-get install mysql-server mysql-client

echo "Enabling Apache modules (php, rewrite)"

sudo a2enmod php5 rewrite

echo "Restarting apache..."

sudo service apache2 restart
