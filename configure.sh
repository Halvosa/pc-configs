#!/bin/bash

cp vimrc $HOME/.vimrc
cp tmux.conf $HOME/.tmux.conf
cp vscode/settings.json $HOME/.config/Code/User/settings.json


# Firewall
sudo ufw allow 1714:1764/udp  # kde/gs connect
sudo ufw allow 1714:1764/tcp

sudo ufw reload
