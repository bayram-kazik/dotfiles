#!/bin/sh

assert_is_arch() {
  if [ ! -f /etc/arch-release ]; then
    echo "This script is meant to be run on Arch Linux"
    exit 1
  fi
}

install_paru() {
  if ! command -v paru &> /dev/null; then
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    cd ..
    trash paru-bin
  fi
}

install_ohmyzsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_essentials() {
  sudo pacman -S base-devel git neovim zsh kitty dunst picom rofi bspwm sxhkd curl redshift feh acpi networkmanager scrot ripgrep alsa-utils stow trash-cli gnome-backgrounds ttc-iosevka ttf-mononoki-nerd
}

install_optionals() {
  echo -n "Do you want to install optional packages? [y/N] "
  read -r response
  if [ "$response" = "y" ]; then
    paru -S firefox htop python ipython openssh jq fzf zip unzip wget tree xorg-server ttf-jetbrains-mono-nerd ttf-fira-code ttf-firacode-nerd ffmpeg bat tmux ranger
  fi
}

prompt_stow() {
  echo -n "Do you want to stow the dotfiles? [y/N] "
  read -r response
  if [ "$response" = "y" ]; then
    stow -nvSt ~ .
    echo -n "Do you want to proceed? [y/N] "
    read -r response
    if [ "$response" = "y" ]; then
      stow -vSt ~ .
    fi
  fi
}


assert_is_arch
install_essentials
install_paru && paru -S rofi-greenclip xkb-switch grabc
install_optionals
install_ohmyzsh
prompt_stow
