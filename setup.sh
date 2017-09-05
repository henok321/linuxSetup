#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
  echo "Run as root!"
  exit 1
fi

echo "Enter unix user:"
read -r user

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

os=$(lsb_release -cs)

declare -a mint=("sonya" "serena" "sarah")

for e in "${mint[@]}"
do
  if [[ "$e" == "$os" ]]; then
    os="xenial"
  fi
done

sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $os \
stable"

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
apt install -y oracle-java8-installer oracle-java8-unlimited-jce-policy oracle-java8-set-default
apt install -y nodejs
apt install -y apt-transport-https ca-certificates curl software-properties-common
apt install -y docker-ce docker-compose
apt install -y atom
