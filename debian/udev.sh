#!/usr/bin/env bash
echo -e "Setting up udev rules for adb & edl"
set -x
sudo curl --create-dirs -LSs -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/main/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules

sudo curl --create-dirs -LSs -o /etc/udev/rules.d/51-edl.rules -O -L https://raw.githubusercontent.com/bkerler/edl/refs/heads/master/Drivers/51-edl.rules
sudo chmod 644 /etc/udev/rules.d/51-edl.rules
sudo chown root /etc/udev/rules.d/51-edl.rules
sudo systemctl restart udev
set +x