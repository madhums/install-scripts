#!/bin/bash

# Versions of softwares to be installed and paths
MONGODB=mongodb-src-r2.0.1
mkdir ~/local
MONGO_INSTALL_PATH=$HOME/local/mongo
echo 'export MONGO_INSTALL_PATH=$HOME/local/mongo' >> ~/.paths
export MONGO_INSTALL_PATH
MONGO_DB_PATH=/data/db
echo 'export MONGO_DB_PATH=/data/db' >> ~/.paths
MONGO_DB_PATH=/data/db
export MONGO_DB_PATH


# mongodb
echo "madhu" | sudo -S mkdir -p $MONGO_DB_PATH
echo "madhu" | sudo -S chown madhu:madhu /data/db
echo "madhu" | sudo -S chown madhu:madhu /data
cd ~/Downloads
wget http://downloads.mongodb.org/src/$MONGODB.tar.gz
tar -xzvf $MONGODB.tar.gz
cd $MONGODB
yes | echo "madhu" | sudo -S apt-get -y install tcsh git-core scons g++
yes | echo "madhu" | sudo -S apt-get -y install libpcre++-dev libboost-dev libreadline-dev xulrunner-1.9.2-dev
yes | echo "madhu" | sudo -S apt-get -y install libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-date-time-dev
scons all
scons --prefix=$MONGO_INSTALL_PATH install
echo 'export PATH=$MONGO_INSTALL_PATH/bin:$PATH' >> ~/.paths
PATH=$MONGO_INSTALL_PATH/bin:$PATH
export PATH

# start service at system startup
cd ~/install-scripts
echo "madhu" | sudo -S cp mongod /etc/init.d/mongod
echo "madhu" | sudo -S chmod u+x /etc/init.d/mongod
echo "madhu" | sudo -S update-rc.d mongod defaults
echo "madhu" | sudo -S /etc/init.d/mongod start

source ~/.bashrc
