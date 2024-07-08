local wezterm = require("wezterm")
local config = wezterm.config_builder()

local get_color_scheme = function()
	local is_light = wezterm.gui and wezterm.gui.get_appearance():find("Light")
	return is_light and "tokyonight_day" or "tokyonight_night"
end

config.color_scheme = get_color_scheme()
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 12

config.keys = {}
for n = 1, 9 do
	-- ALT + $n to activate that tab
	table.insert(config.keys, {
		key = tostring(n),
		mods = "ALT",
		action = wezterm.action.ActivateTab(n - 1),
	})
end

return config
