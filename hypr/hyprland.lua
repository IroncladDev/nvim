-- Screensaver fullscreen window rule
hl.window_rule({
	match = {
		class = "org.omarchy.screensaver",
	},
	float = true,
	fullscreen = true,
})

hl.config({
	general = {
		border_size = 2,
		gaps_in = 8,
		gaps_out = 32,
		col = {
			active_border = "0xffB3C48D",
			inactive_border = "0xff4D5148",
		},
		resize_on_border = true,
		layout = "dwindle",
		modal_parent_blocking = true,
	},
	decoration = {
		inactive_opacity = 0.8,
		blur = {
			enabled = true,
			size = 4,
		},
	},
	input = {
		kb_layout = "us",
		kb_options = "compose:caps",
		natural_scroll = true,
		repeat_rate = 40,
		repeat_delay = 250,
		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
			scroll_factor = 0.4,
		},
	},
})

require("monitors")
require("workspaces")
require("bindings")
require("autostart")
