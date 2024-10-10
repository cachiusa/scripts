#!/usr/bin/env bash

scripts_home=$(readlink -m "$(dirname $0)")

######################################################
export DEBIAN_FRONTEND=noninteractive
set -e
bash $scripts_home/apt_etc/apt.sh
set +e

echo "Setting up flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && flatpak update

bash $scripts_home/desktop.sh
bash $scripts_home/zsh.sh
bash $scripts_home/udev.sh
bash $scripts_home/sdk.sh
