#!/bin/bash

# Versions of softwares to be installed and paths
RUBYGEMS=rubygems-1.3.6

# prerequisites
yes | echo "madhu" | sudo -S apt-get install aptitude

# ruby
yes | echo "madhu" | sudo -S aptitude install ruby build-essential libopenssl-ruby ruby1.8-dev

# rubygems
cd ~/Downloads
wget http://production.cf.rubygems.org/rubygems/$RUBYGEMS.tgz
tar -xzvf $RUBYGEMS.tgz
cd $RUBYGEMS
echo "madhu" | sudo -S ruby setup.rb
echo "madhu" | sudo -S ln -s /usr/bin/gem1.8 /usr/bin/gem

echo 'export GEM_HOME=$HOME/.gem/ruby/1.8' >> ~/.paths
echo 'export PATH=$HOME/.gem/ruby/1.8/bin:$PATH' >> ~/.paths

source ~/.bashrc
