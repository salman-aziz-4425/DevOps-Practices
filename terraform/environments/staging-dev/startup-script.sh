#!/bin/bash

# Update the system
sudo apt-get update

# Install MySQL 8
sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.17-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.17-1_all.deb
sudo apt-get update
sudo apt-get install -y mysql-server

# Install MongoDB 5
sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Install Python 3.9
sudo apt-get install -y python3.9

# Additional configuration or steps if needed
# ...

# Start MySQL and MongoDB services
sudo systemctl start mysql
sudo systemctl start mongod
