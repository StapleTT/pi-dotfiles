#!/bin/bash

DOTFILES_DIR=$(pwd)

clear
echo "This is step 2 of the install process."
echo "Here we will create a backup of your .config directory and add the new dotfiles."

sleep 2

echo "" && echo "Checking sudo privileges once again..."
sudo echo "Sudo check!"

# Create .config backup
echo "" && "Creating backup of ~/.config..."
CONFIG_DIR="$HOME/.config"

if [ -d "$CONFIG_DIR/config_bak" ] ; then
  sudo rm -rf "$CONFIG_DIR/config_bak"
fi
sudo mv $CONFIG_DIR $HOME/.config_bak

# Copy dotfiles to ~/.config
echo "" && "Copying dotfiles to ~/.config..."
cp -r $DOTFILES_DIR/.config $CONFIG_DIR

# Copy keyd config to /etc/keyd/
echo "" && "Copying keyd config to /etc/keyd..."
sudo mkdir /etc/keyd
sudo cp $DOTFILES_DIR/.etc/keyd/* /etc/keyd/
sudo systemctl restart keyd

case "$1" in
  "--partial")
    exit 1
    ;;
  "--full")
    echo "" && echo "Moving on to step 3..."
    sleep 2
    cd $DOTFILES_DIR
    ./sdata/install3.sh
    ;;
esac
    

