#!/bin/bash

./install-mongodb.sh
./install-nodejs.sh
./install-ror.sh

# mysql
yes | echo "madhu" | sudo -S apt-get install mysql-server
