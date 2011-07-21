#!/bin/bash

sudo apt-get install git-core
sudo apt-get install vim
sudo apt-get install exuberant-ctags

if [ ! -d $HOME/.ssh ]; then
  ssh-keygen -t rsa -C "madhums8@gmail.com"
fi

cd ~
if [ ! -d $HOME/dotfiles ]; then
  git clone git://github.com/madhums/dotfiles.git
  cd dotfiles
  chmod u+x install.sh
  ./install.sh
fi

cd ~
if [ ! -d $HOME/gedit-settings ]; then
  git clone git://github.com/madhums/my-gedit-settings.git gedit-settings
  cd gedit-settings
  chmod u+x install.sh
  ./install.sh
fi

cd ~
if [ ! -d $HOME/.vim ]; then
  git clone git://github.com/madhums/.vim.git
  cd .vim
  chmod u+x install.sh
  ./install.sh
fi

cd ~/Downloads
if [ ! -e ~/Downloads/google-chrome-stable_current_amd64.deb ]; then
  wget https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
fi

sudo apt-get install compizconfig-settings-manager
sudo apt-get install gimp
sudo apt-get install virtualbox-ose
sudo apt-get install vlc
