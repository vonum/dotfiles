local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 256
config.initial_rows = 128

config.font = wezterm.font("AnonymicePro Nerd Font Mono")
config.font_size = 13
config.color_scheme = "kanagawabones"

config.enable_tab_bar = false
config.window_decorations = "TITLE | RESIZE"

config.default_cursor_style = "BlinkingBar"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 15
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/dotfiles/assets/bg4.jpeg",
		},
		horizontal_align = "Center",
		vertical_align = "Middle",
		opacity = 0.25,
	},
}

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

return config
