#!/bin/bash

assert_is_arch() {
	if [ ! -f /etc/arch-release ]; then
		echo "This script is meant to be run on Arch Linux"
		exit 1
	fi
}

install_paru() {
	if ! command -v paru &>/dev/null; then
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
	sudo pacman -S base-devel git neovim zsh kitty dunst picom rofi bspwm sxhkd curl redshift feh acpi networkmanager scrot ripgrep alsa-utils stow trash-cli gnome-backgrounds ttc-iosevka ttf-mononoki-nerd xorg-xinit xorg-xinput xorg-xrandr xorg-xmodmap xorg-setxkbmap xclip arandr libnotify nodejs npm brightnessctl playerctl lxsession-gtk3 unclutter xorg-xsetroot stalonetray
}

install_optionals() {
	echo -n "Do you want to install optional packages? [y/N] "
	read -r response
	if [ "$response" = "y" ]; then
		paru -S firefox speech-dispatcher hunspell-en_us htop python ipython openssh jq fzf zip unzip wget tree xorg-server ttf-jetbrains-mono-nerd ttf-fira-code ttf-firacode-nerd ffmpeg bat tmux ranger papirus-icon-theme otf-fira-sans lxappearance-gtk3 gnome-keyring dosfstools btrfs-progs exfatprogs ntfs-3g gpart mtools pavucontrol sof-firmware pipewire pipewire-pulse pipewire-alsa
		systemct --user enable --now pipewire-pulse
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
