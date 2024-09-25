#!/usr/bin/env bash
echo "Setting up zsh shell"
set -x
cd $(dirname $0)
#cp -f .zshrc ~
ln -sf $(readlink -m .)/.zshrc ~/.zshrc
ln -sf $(readlink -m .)/.zshfn ~/.zshfn
sudo chsh -s /usr/bin/zsh $USER
set +x