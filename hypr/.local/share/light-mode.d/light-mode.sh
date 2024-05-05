if [[ "$DESKTOP_SESSION" == "plasma" ]]; then
	plasma-apply-colorscheme MateriaLight
	/usr/lib/plasma-changeicons Papirus-Light
fi
sed -i 's/^.*IconThemeName.*$/Net\/IconThemeName "Papirus-Light"/' ~/.config/xsettingsd/xsettingsd.conf
killall -HUP xsettingsd
sed -i 's/require("catppuccin").setup({ flavour = .* })/require("catppuccin").setup({ flavour = "latte" })/' ~/.config/nvim/init.lua
sed -i 's/ColorScheme=.*/ColorScheme=BlackOnWhite/' ~/.local/share/konsole/Default.profile
sed -i 's/include = ~\/.config\/foot\/plugins\/catppuccin\/catppuccin-.*.ini/include = ~\/.config\/foot\/plugins\/catppuccin\/catppuccin-latte.ini/' ~/.config/foot/foot.ini
sed -i "s/set -g @catppuccin_flavour .*/set -g @catppuccin_flavour 'latte'/" ~/.config/tmux/tmux.conf
sed -i 's/mocha/latte/' ~/.config/alacritty/alacritty.toml
tmux source ~/.config/tmux/tmux.conf
