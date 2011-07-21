#!/bin/bash

./install-mongodb.sh
./install-nodejs.sh
./install-ror.sh

# mysql
yes | sudo apt-get install mysql-server
