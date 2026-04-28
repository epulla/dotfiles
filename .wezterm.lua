local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local color_scheme = "Catppuccin Mocha"
local config = {
	text_background_opacity = 1.0,
	-- color_scheme = color_scheme,
	keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
		{
			key = "LeftArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x1bOH" }),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x1bOF" }),
		},
	},
}

tabline.setup({
	options = {
		icons_enabled = true,
		theme = color_scheme,
	},
})

tabline.apply_to_config(config)

return config

