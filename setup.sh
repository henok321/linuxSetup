#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
  echo "Run as root!"
  exit 1
fi

echo "Start Setup (y/n):"
read input

if [[ "y" != "$input" ]]; then
  exit 0
fi


# update
apt update
apt dist-upgrade -y

# install
apt install -y build-essential
apt install -y python python3 python3-pip python-pip
apt install -y git
apt install -y gitg
apt install -y git-cola
apt install -y kdiff3
apt install -y vim tmux bmon htop screen
apt install -y apt-transport-https ca-certificates curl software-properties-common
