#!/usr/bin/env bash

echo "Start Setup (y/n):"
read input

if [[ "y" != "$input" ]]; then
  exit 0
fi

# add ppa's and sources

# git
add-apt-repository ppa:git-core/ppa -y

# oracle jdk
add-apt-repository ppa:webupd8team/java -y
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

#atom
add-apt-repository ppa:webupd8team/atom -y

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# update
apt update
apt dist-upgrade -y

# install
apt install -y build-essential
apt install -y python python3
apt install -y git
apt install -y gitg
apt install -y git-cola
apt install -y kdiff3
apt install -y vim
apt install -y oracle-java8-installer oracle-java8-unlimited-jce-policy oracle-java8-set-default
apt install -y nodejs
apt install -y apt-transport-https ca-certificates curl software-properties-common
apt install -y docker-ce docker-compose
