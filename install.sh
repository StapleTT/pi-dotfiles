#!/bin/bash

clear

echo -e "\e[34m[$0]\e[0m: Hi there! Before we start, you should know exactly what you're running. This script will:"
echo ' - Replace your existing terminal and shell with Alacritty & Fish'
echo ' - Install & configure Neovim'
echo ' - Rebind Caps Lock to Escape'
echo ' - [OPTIONAL] Replace your existing desktop/login manager with Greetd & Sway'

echo ""

echo "Now that you know what this script does, what would you like to do?"
echo ' [1] Install dotfiles'
echo ' [2] Install dotfiles & replace desktop'
echo ' [3] Exit'

while true ; do
  read -p "Enter an option: " input
  case "$input" in
    1)
      echo -e "\e[34mContinuing with ./sdata/install1.sh...\e[0m"
      INSTALL=1
      break
      ;;
    2)
      echo -e "\e[34mContinuing with ./sdata/install1.sh...\e[0m"
      INSTALL=2
      break
      ;;
    3)
      echo -e "\e[34mExiting script..."
      exit 1
      break
      ;;
    *)
      echo "Invalid input, please try again."
      ;;
  esac
done

echo ""

case $INSTALL in
  1)
    ./sdata/install1.sh --partial
    echo "" && echo -e "\e[32mInstall complete. Please log out and log back in for changes to take effect."
    ;;
  2)
    ./sdata/install1.sh --full
    echo "" && echo -e "\e[32mInstall complete. A full reboot is required for changes to take effect.\e[0m"
    while true ; do
      read -p "Reboot now? [Y/n]: " input
      case "$input" in
        y)
          sudo reboot now
          break
          ;;
        Y)
          sudo reboot now
          break
          ;;
        "")
          sudo reboot now
          break
          ;;
        n)
          exit 1
          break
          ;;
        *)
          echo "Invalid input, please try again."
          ;;
      esac
    done
    ;;
esac
