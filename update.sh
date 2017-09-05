#!/usr/bin/env bash
#
# apt: update, upgrade and cleanup

apt update
apt dist-upgrade -y
apt autoremove -y
apt autoclean -y
purge-old-kernels
update-grub
update-grub2
