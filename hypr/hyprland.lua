-- Load user modules from ~/.config and Omarchy defaults from $OMARCHY_PATH.
package.path = os.getenv("HOME")
	.. "/.config/?.lua;"
	.. (os.getenv("OMARCHY_PATH") or (os.getenv("HOME") .. "/.local/share/omarchy"))
	.. "/?.lua;"
	.. package.path

require("default.hypr.helpers")
require("default.hypr.autostart")
require("default.hypr.bindings.media")

hl.config({
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

require("hypr.monitors")
require("hypr.workspaces")
require("hypr.bindings")
require("hypr.autostart")
