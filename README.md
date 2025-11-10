# pi-dotfiles

This script helps set up your development environment by automating the installation and configuration of various tools:
- **Foot & Fish Shell**: Installs the [foot](https://codeberg.org/dnkl/foot) terminal and sets [fish](https://github.com/fish-shell/fish-shell) as your default shell, enhanced with [Starship](https://github.com/starship/starship) for a modern, user-friendly experience.
- **Neovim Configuration**: Installs and configures Neovim with syntax highlighting, autocomplete, and several other plugins.
- **Caps Lock to Escape**: Remaps the Caps Lock key to Escape using [keyd](https://github.com/rvaiya/keyd) for more efficient text editing.
- **Enhanced File Listing with [eza](https://github.com/eza-community/eza)**: Displays file icons in the terminal when using `ls`, making file navigation more intuitive.
- **[Optional] Greetd & Sway**: Replaces your desktop and login manager with [greetd](https://github.com/kennylevinsen/greetd) and [sway](https://github.com/swaywm/sway), offering a minimal and efficient window manager setup (shown in screenshots below).

During installation, you’ll have the choice to either install the dotfiles only or to include the optional desktop replacement.

## Compatibility
This script was specifically designed for 64-bit Raspberry Pi models. While compatibility with other aarch64 Debian-based distributions should generally work, compatibility with arm64 architectures is not guaranteed. Use with other systems may require additional modifications or troubleshooting.

## Installation
To get started, run the following commands:
```
git clone https://github.com/StapleTT/pi-dotfiles
cd pi-dotfiles
./install.sh
```

## Screenshots
![screenshots/sway.png](https://github.com/StapleTT/pi-dotfiles/blob/master/screenshots/hollywood.png?raw=true "desktop screenshot")
![screemshots/desktop.png](https://github.com/StapleTT/pi-dotfiles/blob/master/screenshots/cheatsheet2.png?raw=true "desktop screenshot 2")
