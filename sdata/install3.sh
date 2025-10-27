#!/bin/bash

DOTFILES_DIR=$(pwd)

clear
echo "This is step 3 of the install process."
while true ; do
  read -p "This step will replace your login manager with greetd and replace your desktop environment with Sway. Are you sure you want to continue? [y/N] " input
  case "$input" in
    "y")
      echo "Continuing with step 3..."
      break
      ;;
    "n")
      echo "Understood. Exiting step 3..."
      exit 1
      break
      ;;
    "")
      echo "Understood. Exiting step 3..."
      exit 1
      break
      ;;
    *)
      echo "Invalid input, please try again."
      ;;
  esac
done

sleep 2

# Install greetd & sway
echo "" && echo "Checking sudo privileges..."
sudo echo "Sudo check!" || exit 0

sleep 1

# Install greetd & sway
echo "" && echo "Installing greetd & sway..."
sudo apt install greetd sway -y
sleep 1 && echo "Done!"

# Copy greetd config to /etc/greetd
echo "" && echo "Copying greetd config to /etc/greetd..."
sudo mkdir /etc/greetd
sudo cp $DOTFILES_DIR/.etc/greetd/* /etc/greetd/
sleep 1 && echo "Done!"

# Disable lightdm and enable greetd
echo "" && echo "Disabling lightdm and enabling greetd..."
sudo systemctl disable lightdm.service
sudo systemctl enable greetd.service
sleep 1 && echo "Done!"
