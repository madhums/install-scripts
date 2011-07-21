#!/bin/bash

yes | echo "madhu" | sudo -S apt-get install git-core
yes | echo "madhu" | sudo -S apt-get install vim
yes | echo "madhu" | sudo -S apt-get install exuberant-ctags

if [ ! -d $HOME/.ssh ]; then
  ssh-keygen -t rsa -C "madhums8@gmail.com"
fi

if [ ! -d $HOME/.fonts ]; then
  mkdir ~/.fonts
  cp DroidSansMono.ttf ~/.fonts
  echo "madhu" | sudo -S fc-cache -fv
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
  echo "madhu" | sudo -S dpkg -i google-chrome-stable_current_amd64.deb
fi

yes | echo "madhu" | sudo -S apt-get install compizconfig-settings-manager
yes | echo "madhu" | sudo -S apt-get install gimp
yes | echo "madhu" | sudo -S apt-get install virtualbox-ose
yes | echo "madhu" | sudo -S apt-get install vlc
yes | echo "madhu" | sudo -S apt-get install flashplugin-installer
yes | echo "madhu" | sudo -S apt-get install skype

./install-libs.sh
