#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
echo "Installing main packages"
sudo apt update
sudo apt install -y --no-install-recommends \
    $(cat $(dirname $0)/core.txt) \
    $(cat $(dirname $0)/extras.txt)
