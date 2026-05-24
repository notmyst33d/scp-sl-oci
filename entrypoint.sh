#!/bin/bash

set -e

install_steamcmd() {
    echo steam steam/question select "I AGREE" | debconf-set-selections
    echo steam steam/license note "" | debconf-set-selections

    sed -i ':a;N;$!ba;s/trixie trixie-updates\nComponents: main/trixie trixie-updates\nComponents: main non-free/g' /etc/apt/sources.list.d/debian.sources
    dpkg --add-architecture i386
    apt update -y
    apt install -y steamcmd libcurl4t64

    ln -sf /usr/games/steamcmd /usr/bin/steamcmd
}

if [ ! -f /root/game/LocalAdmin ]; then
    echo "Installing SCL:SL"
    install_steamcmd
    steamcmd \
        +force_install_dir /root/game \
        +login anonymous \
        +app_update 996560 validate \
        +quit
fi

cd /root/game && ./LocalAdmin 7777

