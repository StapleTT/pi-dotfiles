#!/bin/bash

clear

echo -e "\e[94m[$0]\e[0m: Hi there! Before we start, you should know exactly what you're running. This script will:"
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
      echo -e "\e[94mContinuing with ./sdata/install1.sh...\e[0m"
      ./sdata/install1.sh --partial
      break
      ;;
    2)
      echo -e "\e[94mContinuing with ./sdata/install1.sh...\e[0m"
      ./sdata/install1.sh --full
      break
      ;;
    3)
      echo -e "\e[94mExiting script..."
      exit 1
      break
      ;;
    *)
      echo "Invalid input, please try again."
      ;;
  esac
done
