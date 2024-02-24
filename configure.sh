#!/bin/bash

cp vimrc $HOME/.vimrc
cp tmux.conf $HOME/.tmux.conf
cp vscode/settings.json $HOME/.config/Code/User/settings.json


# Firewall
sudo ufw allow 1714:1764/udp  # kde/gs connect
sudo ufw allow 1714:1764/tcp

sudo ufw reload

# Install packages
pip install python-language-server

# Install node.js for vim coc
curl -sL install-node.vercel.app/lts | bash

# Git
sudo apt-get install libsecret-1-0 libsecret-1-dev
cd /usr/share/doc/git/contrib/credential/libsecret
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
