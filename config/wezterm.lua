local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 256
config.initial_rows = 128

config.font = wezterm.font("AnonymicePro Nerd Font Mono")
config.font_size = 13
config.color_scheme = "kanagawabones"

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.default_cursor_style = "BlinkingBar"

return config
