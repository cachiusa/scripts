#!/usr/bin/env bash
gnome_themes="GNOME-4X-Blue-Dark"
gtk_themes="Skeuos-Blue-Dark"
icon_packs="Flat-Remix-Blue-Dark"
scheme_src="https://gitlab.com/kalilinux/packages/kali-themes"
schemes="Kali-Dark Kali-Light"

mkdir -p tmp && cd tmp

echo "Installing flat-remix icons"
git clone https://github.com/daniruiz/flat-remix --depth=1
(cd flat-remix && sudo make THEMES=${icon_packs} install)

echo "Installing skeuos-gtk theme"
git clone https://github.com/daniruiz/skeuos-gtk --depth=1
(cd skeuos-gtk && sudo make THEMES=${gtk_themes} install)

echo "Installing color schemes"
set -x
sudo mkdir -p /usr/share/qtermwidget5/color-schemes
for i in ${schemes}; do
    curl -LSs "${scheme_src}/-/raw/kali/master/share/qtermwidget5/color-schemes/${i}.colorscheme" | sudo tee /usr/share/qtermwidget5/color-schemes/${i}.colorscheme > /dev/null
done
set +x

if command -v gnome-shell; then
    echo "Installing GNOME 4X themes"
    git clone https://github.com/daniruiz/GNOME-4X-themes --depth=1
    (cd GNOME-4X-themes/themes/${gnome_themes} && sh -x install.sh)
fi

cd ..
rm -rf tmp
