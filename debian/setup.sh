#!/usr/bin/env bash
# Copyright (C) 2018 Harsh 'MSF Jarvis' Shandilya
# Copyright (C) 2018 Akhil Narang
# SPDX-License-Identifier: GPL-3.0-only
scripts_home=$(readlink -m "$(dirname $0)")

######################################################
set -e

echo "Installing main packages"
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends \
    $(cat $scripts_home/core.txt) \
    $(cat $scripts_home/extras.txt)

echo "Setting up flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && flatpak update

set +e

bash $scripts_home/desktop.sh
bash $scripts_home/zsh.sh
bash $scripts_home/udev.sh
bash $scripts_home/sdk.sh
