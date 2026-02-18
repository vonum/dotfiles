local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.initial_cols = 256
config.initial_rows = 128

config.font = wezterm.font("AnonymicePro Nerd Font Mono")
config.font_size = 13
config.color_scheme = "kanagawabones"

config.enable_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS"

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
		opacity = 0.4,
	},
}

config.window_padding = {
	bottom = 3,
	top = 3,
	left = 3,
	right = 3,
}

config.inactive_pane_hsb = {
	saturation = 0.6,
	brightness = 0.7,
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local pane = tab.active_pane

	-- Current working directory
	local dir = ""
	local cwd = pane.current_working_dir
	if cwd and cwd.file_path then
		local path = cwd.file_path
		local home = wezterm.home_dir

		-- Replace home dir with ~
		if path == home or path:find("^" .. home .. "/") then
			path = path:gsub("^" .. home, "~")
		end

		-- Extract last path component
		dir = path:match("([^/]+)$") or path
	end

	-- Running command (foreground process)
	local cmd = pane.foreground_process_name or ""
	cmd = string.gsub(cmd, "(.*[/\\])(.*)", "%2")
	if cmd == "zsh" then
		cmd = ""
	else
		cmd = string.format("· %s", cmd)
	end

	return {
		{ Text = string.format(" %s %s", dir, cmd) },
	}
end)

config.keys = {
	{ key = "m", mods = "OPT", action = wezterm.action.ToggleFullScreen },
	-- forward one word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\x1bf") },
	-- back one word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\x1bb") },
	-- end of line
	{ key = "RightArrow", mods = "SHIFT|OPT", action = wezterm.action.SendString("\x05") },
	-- beginning of line
	{ key = "LeftArrow", mods = "SHIFT|OPT", action = wezterm.action.SendString("\x01") },

	-- Panes
	{ key = "S", mods = "OPT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "OPT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "w", mods = "OPT", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "h", mods = "OPT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "OPT", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "OPT", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "OPT", action = act.ActivatePaneDirection("Down") },

	{ key = "M", mods = "OPT", action = act.TogglePaneZoomState },
	{ key = "h", mods = "SHIFT|OPT", action = act.AdjustPaneSize({ "Left", 3 }) },
	{ key = "l", mods = "SHIFT|OPT", action = act.AdjustPaneSize({ "Right", 3 }) },
	{ key = "k", mods = "SHIFT|OPT", action = act.AdjustPaneSize({ "Up", 3 }) },
	{ key = "j", mods = "SHIFT|OPT", action = act.AdjustPaneSize({ "Down", 3 }) },
}

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

return config
