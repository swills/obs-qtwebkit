#!/bin/sh

OS=$(uname)

if [ ${OS} = FreeBSD ]; then
  sudo pkg upgrade -y
  sudo pkg install -y obs-studio libinotify gmake pkgconf qt5-webkit qt5-widgets git
  sudo perl -pi -e 's!/Qt5WebKitWidgets!/QtWebKitWidgets!' /usr/local/libdata/pkgconfig/Qt5WebKitWidgets.pc
  gmake
elif [ ${OS} = Linux ]; then
  # assume ubuntu 180.04
  sudo apt update
  sudo apt -y upgrade
  sudo apt install -y make pkg-config libobs-dev libqt5webkit5-dev
  make
fi
