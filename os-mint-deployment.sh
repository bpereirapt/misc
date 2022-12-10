#!/usr/bin/env bash

### set sudoers

cat <<EOF >>/etc/sudoers.d/bpereira
bpereira  ALL=(ALL) NOPASSWD:ALL
EOF

chmod 0440 /etc/sudoers.d/bpereira

### disable flatpak

flatpak list
flatpak uninstall --all
flatpak remotes
flatpak remote-delete flathub
sudo apt autoclean
sudo apt autoremove --purge
sudo find /tmp -type f -delete
dpkg -l | grep '^rc' | awk '{print $2}' | sudo xargs dpkg --purge
rm -v -f ~/.cache/thumbnails/*/*.png ~/.thumbnails/*/*.png
sudo systemd-resolve --flush-caches
sudo journalctl --rotate
sudo journalctl --vacuum-time=1s

sudo apt-get remove --autoremove flatpak
sudo apt-get purge flatpak

### update

sudo apt-get update -y
sudo apt-get upgrade -y
