#!/bin/bash

case "$1" in
	-l|--light) THEME="light";;
	-d|--dark) THEME="dark";;
	*) echo "Usage: $0 [-l|--light|-d|--dark]"; exit 0;;
esac

CURSOR_SIZE=24
CURSOR_THEME="elementary"
FONT_NAME="Noto Sans Condensed, Medium 10"
MONOSPACE_FONT_NAME="Iosevka Nerd Font Mono Medium 11"
PLASMA_CURSORSIZE=24
PLASMA_CURSORTHEME="Breeze_Light"

if [[ $THEME = "light" ]]; then
	GTK_THEME="adw-gtk3"
	ICON_THEME="Papirus-Light"
	DAY_NIGHT="day"
	LIGHT_DARK="light"
	PLASMA_COLORSCHEME="MateriaLight"
	KONSOLE_COLORSCHEME="Catppuccin-Latte"
	BAT_THEME="Catppuccin Latte"
	NOTIF_ICON="/usr/share/icons/Papirus/48x48/status/weather-clear.svg"
else
	GTK_THEME="adw-gtk3-dark"
	ICON_THEME="Papirus-Dark"
	DAY_NIGHT="night"
	LIGHT_DARK="dark"
	PLASMA_COLORSCHEME="MateriaDark"
	KONSOLE_COLORSCHEME="Catppuccin-Mocha"
	BAT_THEME="Catppuccin Mocha"
	NOTIF_ICON="/usr/share/icons/Papirus/48x48/status/weather-clear-night.svg"
fi

autotheme_kde() {
	notify-send --app-name="Darkman" --urgency=low --icon="$NOTIF_ICON" "Switching KDE Plasma system theme to $THEME mode"
	plasma-apply-colorscheme "$PLASMA_COLORSCHEME"
	/usr/lib/plasma-changeicons "$ICON_THEME"
	plasma-apply-cursortheme "$PLASMA_CURSORTHEME" --size "$PLASMA_CURSORSIZE"
	sed -i 's/Net\/ThemeName.*/Net\/ThemeName "'"$GTK_THEME"'"/g' \
		~/.config/xsettingsd/xsettingsd.conf
	sed -i 's/^ColorScheme=.*/ColorScheme='"$KONSOLE_COLORSCHEME"'/' \
		~/.local/share/konsole/Main.profile
	killall -HUP xsettingsd
}

autotheme_other() {
	notify-send --app-name="Darkman" --urgency=low --icon="$NOTIF_ICON" "Switching Linux system theme to $THEME mode"
	gsettings set org.gnome.desktop.interface color-scheme "$LIGHT_DARK"
	gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
	gsettings set org.gnome.desktop.interface icon-theme "$ICON_THEME"
	gsettings set org.gnome.desktop.interface cursor-theme "$CURSOR_THEME"
	gsettings set org.gnome.desktop.interface cursor-size "$CURSOR_SIZE"
	gsettings set org.gnome.desktop.wm.preferences theme "$GTK_THEME"

	gsettings set org.gnome.desktop.interface document-font-name "$FONT_NAME"
	gsettings set org.gnome.desktop.interface font-name "$FONT_NAME"
	gsettings set org.gnome.desktop.interface monospace-font-name "$MONOSPACE_FONT_NAME"

	sed -i -e 's/Net\/ThemeName.*/Net\/ThemeName "'"$GTK_THEME"'"/g' \
		-e 's/Net\/IconThemeName.*/Net\/IconThemeName "'"$ICON_THEME"'"/g' \
		-e 's/Gtk\/CursorThemeName.*/Gtk\/CursorThemeName "'"$CURSOR_THEME"'"/g' \
		~/.config/xsettingsd/xsettingsd.conf
	killall -HUP xsettingsd
}

autotheme_common() {
	ln -sf "$HOME/.config/alacritty/tokyonight/tokyonight_$DAY_NIGHT.toml" \
		"$HOME/.config/alacritty/tokyonight/tokyonight.toml"
	touch $HOME/.config/alacritty/alacritty.toml

	tmux source-file ~/.config/tmux/tmux.conf

	echo '--theme="'"$BAT_THEME"'"' > ~/.config/bat/config
	bat cache --build
}

if [[ "$XDG_CURRENT_DESKTOP" = "KDE" ]]; then
	autotheme_kde
else
	autotheme_other
fi

autotheme_common
