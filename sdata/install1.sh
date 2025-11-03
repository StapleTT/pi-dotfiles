#!/bin/bash

DOTFILES_DIR=$(pwd)

clear
echo "Welcome to step 1 of the install script."
echo "Please note that this script will require sudo privileges to work properly."
sleep 2

echo "" && echo -e "\e[34mChecking sudo privileges...\e[0m"
sleep 1
sudo echo -e "\e[32mSudo check!\e[0m" || exit 0

echo "" && echo -e "\e[34mInstalling packages...\e[0m"

# Install curl & git
sudo apt install curl git -y

# Install packages for partial config
sudo apt install alacritty fish neovim -y

# Clone & install keyd
echo "" && echo -e "\e[34mInstalling dependencies for keyd...\e[0m"
sudo apt install make gcc pkg-config libinih-dev -y

echo "" && echo -e "\e[34mCloning repository...\e[0m"
KEYD_DIR="$HOME/.local/src/keyd"
if [ ! -d "$KEYD_DIR" ] ; then
  git clone https://github.com/rvaiya/keyd.git "$KEYD_DIR"
else
  git -C "$KEYD_DIR" pull
fi

# Build & install
cd "$KEYD_DIR"
echo "" && echo -e "\e[34mBuilding keyd...\e[0m"
make
echo "" && echo -e "\e[34mInstalling keyd...\e[0m"
sudo make install

sudo systemctl enable keyd
sudo systemctl restart keyd
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Install Rust via rustup if not already installed
echo "" && echo -e "\e[34mInstalling Rust...\e[0m"
if ! command -v rustup >/dev/null 2>&1 ; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source $HOME/.cargo/env
fi
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Install Starship
echo "" && echo -e "\e[34mInstalling Starship...\e[0m"
if ! command -v starship >/dev/null 2>&1 ; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Install eza via cargo
echo "" && echo -e "\e[34mInstalling eza...\e[0m"
if ! command -v eza >/dev/null 2>&1 ; then
  cargo install eza
fi
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Install CascadiaCode Nerd Font
echo "" && echo -e "\e[34mInstalling CascadiaCode Nerd Font...\e[0m"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

cd "$FONT_DIR"
if [ ! -d "$FONT_DIR/CascadiaCodeNF" ] ; then
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip -O CascadiaCode.zip
  unzip CascadiaCode.zip -d CascadiaCodeNF
  rm CascadiaCode.zip
fi

fc-cache -fv >/dev/null
sleep 1 && echo -e "\e[32mDone!\e[0m"

# Move on to step 2 (copy .config and other files)
cd $DOTFILES_DIR
echo "" && echo "\e[34mMoving on to step 2...\e[0m"
case "$1" in
  "--partial")
    ./sdata/install2.sh --partial
    ;;
  "--full")
    ./sdata/install2.sh --full
    ;;
esac
