#!/usr/bin/env bash
# Copyright (C) 2018 Harsh 'MSF Jarvis' Shandilya
# Copyright (C) 2018 Akhil Narang
# SPDX-License-Identifier: GPL-3.0-only
scripts_home=$(readlink -m "$(dirname $0)")
CORE_PACKAGES="$(cat $scripts_home/core.txt)"
EXTRAS="$(cat $scripts_home/extras.txt)"

######################################################
#set -e

sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive \
    apt install -y --no-install-recommends \
    ${CORE_PACKAGES} ${EXTRAS}

bash $scripts_home/desktop.sh
bash $scripts_home/zsh.sh
bash $scripts_home/udev.sh
bash $scripts_home/sdk.sh
