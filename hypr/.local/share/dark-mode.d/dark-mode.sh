if [[ "$DESKTOP_SESSION" == "plasma" ]]; then
	plasma-apply-colorscheme MateriaDark
	/usr/lib/plasma-changeicons Papirus-Dark
fi
sed -i 's/^.*IconThemeName.*$/Net\/IconThemeName "Papirus-Light"/' ~/.config/xsettingsd/xsettingsd.conf
killall -HUP xsettingsd
sed -i 's/ColorScheme=.*/ColorScheme=Breeze/' ~/.local/share/konsole/Default.profile
sed -i 's/require("catppuccin").setup({ flavour = .* })/require("catppuccin").setup({ flavour = "mocha" })/' ~/.config/nvim/init.lua
sed -i 's/include = ~\/.config\/foot\/plugins\/catppuccin\/catppuccin-.*.ini/include = ~\/.config\/foot\/plugins\/catppuccin\/catppuccin-mocha.ini/' ~/.config/foot/foot.ini
sed -i "s/set -g @catppuccin_flavour .*/set -g @catppuccin_flavour 'mocha'/" ~/.config/tmux/tmux.conf
sed -i 's/latte/mocha/' ~/.config/alacritty/alacritty.toml
tmux source ~/.config/tmux/tmux.conf
