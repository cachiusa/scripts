#!/usr/bin/env bash
echo "Setting up zsh shell"
set -x

cd $(dirname $0)/zsh

for dot in $(ls -A); do
    ln -sf $(readlink -m .)/$dot ~/$dot
done

sudo chsh -s /usr/bin/zsh $USER