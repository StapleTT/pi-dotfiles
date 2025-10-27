#!/bin/bash

DOTFILES_DIR=$(pwd)

clear
echo "Welcome to step 1 of the install script."
echo "Please note that this script will require sudo privileges to work properly."
sleep 2

echo "" && echo "Checking sudo priviliges..."
sleep 1
sudo echo "Sudo check!" || exit 0

echo "" && echo "Installing packages..."

# Install curl & git
sudo apt install curl git -y

# Install packages for partial config
sudo apt install alacritty fish neovim -y

# Clone & install keyd
echo "" && echo "Installing dependencies for keyd..."
sudo apt install make gcc pkg-config libinih-dev -y

echo "" && echo "Cloning repository..."
KEYD_DIR="$HOME/.local/src/keyd"
if [ ! -d "$KEYD_DIR" ] ; then
  git clone https://github.com/rvaiya/keyd.git "$KEYD_DIR"
else
  git -C "$KEYD_DIR" pull
fi

# Build & install
cd "$KEYD_DIR"
echo "" && echo "Building keyd..."
make
echo "" && echo "Installing keyd..."
sudo make install

sudo systemctl enable keyd
sudo systemctl restart keyd
sleep 1 && echo "Done!"

# Install Rust via rustup if not already installed
echo "" && echo "Installing Rust..."
if ! command -v rustup >/dev/null 2>&1 ; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
  source $HOME/.cargo/env
fi
sleep 1 && echo "Done!"

# Install Starship
echo "" && echo "Installing Starship..."
if ! command -v starship >/dev/null 2>&1 ; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi
sleep 1 && echo "Done!"

# Install eza via cargo
echo "" && echo "Installing eza..."
if ! command -v eza >/dev/null 2>&1 ; then
  cargo install eza
fi
sleep 1 && echo "Done!"

# Install CascadiaCode Nerd Font
echo "" && echo "Installing CascadiaCode Nerd Font..."
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

cd "$FONT_DIR"
if [ ! -d "$FONT_DIR/CascadiaCodeNF" ] ; then
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip -O CascadiaCode.zip
  unzip CascadiaCode.zip -d CascadiaCodeNF
  rm CascadiaCode.zip
fi

fc-cache -fv >/dev/null
sleep 1 && echo "Done!"

# Move on to step 2 (copy .config and other files)
cd $DOTFILES_DIR
echo "" && echo "Moving on to step 2..."
case "$1" in
  "--partial")
    ./sdata/install2.sh --partial
    ;;
  "--full")
    ./sdata/install2.sh --full
    ;;
esac
