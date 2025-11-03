#!/bin/bash

DOTFILES_DIR=$(pwd)

clear
echo "This is step 3 of the install process."
while true ; do
  read -p "This step will replace your login manager with greetd and replace your desktop environment with Sway. Are you sure you want to continue? [y/N] " input
  case "$input" in
    "y")
      echo -e "\e[34mContinuing with step 3...\e[0m"
      break
      ;;
    "n")
      echo -e "\e[34mUnderstood. Exiting step 3...\e[0m"
      exit 1
      break
      ;;
    "N")
      echo -e "\e[34mUnderstood. Exiting step 3...\e[0m"
      exit 1
      break
      ;;
    "")
      echo -e "\e[34mUnderstood. Exiting step 3...\e[0m"
      exit 1
      break
      ;;
    *)
      echo "Invalid input, please try again."
      ;;
  esac
done

sleep 2

echo "" && echo -e "\e[34mChecking sudo privileges...\e[0m"
sudo echo -e "\e[32mSudo check!\e[0m" || exit 0

sleep 1

# Install greetd, sway, & rofi
echo "" && echo -e "\e[34mInstalling greetd, sway, & rofi...\e[0m"
sudo apt install greetd sway rofi -y
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Copy greetd config to /etc/greetd
echo "" && echo -e "\e[34mCopying greetd config to /etc/greetd...\e[0m"
if [ ! -d /etc/greetd/ ] ; then
  sudo mkdir /etc/greetd
fi
sudo cp $DOTFILES_DIR/.etc/greetd/* /etc/greetd/
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Disable lightdm and enable greetd
echo "" && echo -e "\e[34mDisabling lightdm and enabling greetd...\e[0m"
sudo systemctl disable lightdm.service
sudo systemctl enable greetd.service
sleep 1 && echo -e "\e[32mDone!\e[0m"
