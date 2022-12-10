#!/usr/bin/env bash

# disable flatpak

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
