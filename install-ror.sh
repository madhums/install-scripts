#!/bin/bash

# Versions of softwares to be installed and paths
RUBYGEMS=rubygems-1.3.6

source ~/.bashrc

# prerequisites
yes | sudo apt-get install aptitude

# ruby
yes | sudo aptitude install ruby build-essential libopenssl-ruby ruby1.8-dev

# rubygems
cd ~/Downloads
wget http://production.cf.rubygems.org/rubygems/$RUBYGEMS.tgz
tar -xzvf $RUBYGEMS.tgz
cd $RUBYGEMS
sudo ruby setup.rb
sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
