local wezterm = require("wezterm")
local act = wezterm.action



wezterm.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = { name, "Noto Color Emoji", "JetBrains Mono" }
	return wezterm.font_with_fallback(names, params)
end

return {
	-- General configuration
    enable_wayland = true,
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	use_fancy_tab_bar = false,
	enable_tab_bar = false,
    enable_scroll_bar = false,
    --min_scroll_bar_height = '2cell',
    --scrollback_lines = 3500,
    --colors = {
    --scrollbar_thumb = 'white',
    --},
	window_padding = {
		left = 2,
		right = 2,
    	top = 2,
		bottom = 2,
	},

	-- Font and color scheme
	font = font_with_fallback("JetBrainsMono Nerd Font"),
	font_rules = {
		-- Select a fancy italic font for italic text
		{
			italic = true,
			font = font_with_fallback("JetBrainsMono Nerd Font", { weight = 'Light', italic = true }),
		},

		-- Similarly, a fancy bold+italic font
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback("JetBrainsMono Nerd Font", { weight = 'ExtraBold', italic = true }),
		},
	},
	font_size = 13,
	use_resize_increments = true,
	line_height = 1.0,
	color_scheme = "nightfox",

	-- Background
	window_background_image = wezterm.home_dir .. "/.config/wezterm/2.jpg",
	window_background_image_hsb = {
		brightness = 0.05,
		hue = 1,
		saturation = 1,
	},

	default_prog = { "tmux"},

	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	disable_default_key_bindings = true,
    mouse_bindings = {
        {event={Up={streak=1, button="Right"}}, mods="NONE", action=wezterm.action{PasteFrom="PrimarySelection"}},
    },
	keys = {
		{ key = "+", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
		{ key = "c", mods = "CTRL", action = wezterm.action.Copy },
		{ key = "v", mods = "CTRL", action = wezterm.action.Paste },
        { key = 'h', mods = 'SHIFT', action = act.ScrollByLine(-1) },
        { key = 'l', mods = 'SHIFT', action = act.ScrollByLine(1) },
    },
}
