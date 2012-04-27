#!/bin/bash

# Versions of softwares to be installed and paths
NODEJS=v$1

# Change the below lines to change the install paths
mkdir ~/local
NODE_INSTALL_PATH=$HOME/local/node
# echo 'export NODE_INSTALL_PATH=$HOME/local/node' >> ~/.paths
NODE_INSTALL_PATH=$HOME/local/node
export NODE_INSTALL_PATH

#sudo apt-get update
#sudo apt-get install build-essential
#sudo apt-get install openssl
#sudo apt-get install pkg-config
#pkg-config openssl --cflags --libs

# prerequisites
yes | echo "madhu" | sudo -S apt-get install libssl-dev

# nodejs
cd ~/Downloads
wget http://nodejs.org/dist/$NODEJS/node-$NODEJS.tar.gz
tar -xzvf node-$NODEJS.tar.gz
cd node-$NODEJS
make clean
./configure --prefix=$NODE_INSTALL_PATH
make
make install
# echo 'export PATH=$NODE_INSTALL_PATH/bin:$PATH' >> ~/.paths
PATH=$NODE_INSTALL_PATH/bin:$PATH
export PATH

# echo 'export NODE_PATH=$NODE_INSTALL_PATH:$NODE_INSTALL_PATH/lib/node_modules' >> ~/.paths
NODE_PATH=$NODE_INSTALL_PATH:$NODE_INSTALL_PATH/lib/node_modules
export NODE_PATH

# npm
# prerequisites
yes | echo "madhu" | sudo -S apt-get install curl
curl http://npmjs.org/install.sh | clean=yes sh

source ~/.bashrc
