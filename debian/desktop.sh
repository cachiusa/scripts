#!/usr/bin/env bash
echo "Setting up themes"
set -x
[ -d flat-remix ] || git clone https://github.com/daniruiz/flat-remix --depth=1
cd flat-remix && sudo make install
cd ..
[ -d skeuos-gtk ] || git clone https://github.com/daniruiz/skeuos-gtk --depth=1
cd skeuos-gtk && sudo make install
cd ..

schemes="
KaliDark
KaliLight
KaliPurpleDark
KaliPurpleLight
"
sudo mkdir -p /usr/share/color-schemes
for i in ${schemes}; do
    curl -s "https://gitlab.com/kalilinux/packages/kali-themes/-/raw/kali/master/share/color-schemes/${i}.colors" | sudo tee /usr/share/color-schemes/${i}.colors > /dev/null
done