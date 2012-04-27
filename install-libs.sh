#!/bin/bash

./install-ror.sh
./install-nodejs.sh
./install-mongodb.sh

# mysql
yes | echo "madhu" | sudo -S apt-get install mysql-server
yes | echo "madhu" | sudo -S apt-get install libmysqlclient15-dev

# apache2 utils
yes | echo "madhu" | sudo -S apt-get install apache2
yes | echo "madhu" | sudo -S apt-get install apache2-utils

# others
yes | echo "madhu" | sudo -S apt-get install libxslt-dev libxml2-dev

# apache2
# install jpeg lib
# install imagemagick
# install nautilus-elementary theme
# globus preview
# remove libreoffice
# remove banshee
# install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev
# rvm
# sphinx
