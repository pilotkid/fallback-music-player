#!/bin/bash

## Function to prompt user for yes/no question
ask_yes_no() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

## Update and upgrade the system
echo "Updating system..."
#sudo apt-get update && sudo apt-get upgrade -y

## Install necessary dependencies
echo "Installing necessary packages..."
#sudo apt-get install -y build-essential git python3-dev python3-pip python3-setuptools libasound2-dev autoconf automake libtool libpopt-dev libconfig-dev xmltoman

## Install Shairport Sync (AirPlay)
echo "Installing Shairport Sync..."
# sudo apt-get install -y shairport-sync

## Install somafm
# sudo apt-get install libwww-perl mplayer
# git clone https://github.com/david-moreno/somafm.git
#sudo cp somafm/somafm /usr/bin/
# somafm --update

## Copy bash files
mkdir -p /bin/music_player
cp ./start_somafm.sh /bin/music_player/start_somafm.sh
chmod +x  /bin/music_player/start_somafm.sh
cp ./end_somafm.sh /bin/music_player/end_somafm.sh
chmod +x /bin/music_player/end_somafm.sh
cp ./shairport-sync.conf /etc/shairport-sync.conf

# Prompt to reboot the system to apply changes
echo "Installation complete. Please reboot the system to start the music fallback service."
