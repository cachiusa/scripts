#!/usr/bin/env bash
echo "Setting up zsh shell"
set -x
cd $(dirname $0)
#cp -f .zshrc ~
ln -sf $(readlink -m .)/.zshrc ~/.zshrc
sudo chsh -s /usr/bin/zsh $USER
set +x