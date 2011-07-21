#!/bin/bash

# Versions of softwares to be installed and paths
RUBYGEMS=rubygems-1.3.6
NODEJS=node-v0.4.10
MONGODB=mongodb-src-r1.8.2

# Change the below lines to change the install paths
NODE_INSTALL_PATH=$HOME/local/node
echo 'export NODE_INSTALL_PATH=$HOME/local/node' >> ~/.paths
MONGO_INSTALL_PATH=$HOME/local/mongo
echo 'export MONGO_INSTALL_PATH=$HOME/local/mongo' >> ~/.paths
MONGO_DB_PATH=/data/db
echo 'export MONGO_DB_PATH=/data/db' >> ~/.paths

source ~/.bashrc

# ruby
sudo aptitude install ruby build-essential libopenssl-ruby ruby1.8-dev

# rubygems
cd ~/Downloads
wget http://production.cf.rubygems.org/rubygems/$RUBYGEMS.tgz
tar -xzvf $RUBYGEMS.tgz
cd $RUBYGEMS
sudo ruby setup.rb
sudo ln -s /usr/bin/gem1.8 /usr/bin/gem

# nodejs
cd ~/Downloads
wget http://nodejs.org/dist/$NODEJS.tar.gz
tar -xzvf $NODEJS.tar.gz
cd $NODEJS
mkdir $NODE_INSTALL_PATH
./configure --prefix=$NODE_INSTALL_PATH
make
make install
echo 'export PATH=$NODE_INSTALL_PATH/bin:$PATH' >> ~/.paths
echo 'export NODE_PATH=$NODE_INSTALL_PATH:$NODE_INSTALL_PATH/lib/node_modules' >> ~/.paths
source ~/.bashrc

# mongodb
cd ~/Downloads
wget http://downloads.mongodb.org/src/$MONGODB.tar.gz
tar -xzvf $MONGODB.tar.gz
cd $MONGODB
sudo apt-get -y install tcsh git-core scons g++
sudo apt-get -y install libpcre++-dev libboost-dev libreadline-dev xulrunner-1.9.2-dev
sudo apt-get -y install libboost-program-options-dev libboost-thread-dev libboost-filesystem-dev libboost-date-time-dev
scons all
sudo mkdir -p $MONGO_DB_PATH
scons --prefix=$MONGO_INSTALL_PATH install
echo 'export PATH=$MONGO_INSTALL_PATH/bin:$PATH' >> ~/.paths
source ~/.bashrc
# start service at system startup
cd ~/install-scripts
sudo ln -s mongod /etc/init.d/mongod
sudo chmod u+x /etc/init.d/mongod
sudo update-rc.d mongod defaults
sudo /etc/init.d/mongod start

# mysql
sudo apt-get install mysql-server
