-- Work around Hyprland send_shortcut sometimes leaving synthetic key state stuck/repeating.
-- https://github.com/hyprwm/Hyprland/discussions/14099
local function send_shortcut_once(mods, key)
	return function()
		hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down", window = "activewindow" }))

		hl.timer(function()
			hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up", window = "activewindow" }))
		end, { timeout = 50, type = "oneshot" })
	end
end

hl.bind("SUPER + C", send_shortcut_once("CTRL", "Insert"))
hl.bind("SUPER + V", send_shortcut_once("SHIFT", "Insert"))
hl.bind("SUPER + X", send_shortcut_once("CTRL", "X"))
hl.bind("SUPER + CTRL + V", hl.dsp.exec_cmd("omarchy-clipboard-manager"))

-- Media
-- Volume, brightness, keyboard backlight, and touchpad controls.
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("omarchy-audio-input-mute"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-display +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("omarchy-brightness-display 5%-"), { locked = true, repeating = true })
hl.bind(
	"SHIFT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd("omarchy-brightness-display 100%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"SHIFT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd("omarchy-brightness-display 1%"),
	{ locked = true, repeating = true }
)
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-keyboard up"), { locked = true, repeating = true })
hl.bind(
	"XF86KbdBrightnessDown",
	hl.dsp.exec_cmd("omarchy-brightness-keyboard down"),
	{ locked = true, repeating = true }
)
hl.bind("XF86KbdLightOnOff", hl.dsp.exec_cmd("omarchy-brightness-keyboard cycle"), { locked = true })
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("omarchy-toggle-touchpad"), { locked = true })
hl.bind("XF86TouchpadOn", hl.dsp.exec_cmd("omarchy-toggle-touchpad on"), { locked = true })
hl.bind("XF86TouchpadOff", hl.dsp.exec_cmd("omarchy-toggle-touchpad off"), { locked = true })

-- Precise volume and brightness controls.
hl.bind(
	"ALT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume +1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume -1"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd("omarchy-brightness-display +1%"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd("omarchy-brightness-display 1%-"),
	{ locked = true, repeating = true }
)

-- Media controls.
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl previous"), { locked = true })

hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd("omarchy-audio-output-switch"), { locked = true })

-- Menu
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("walker"))
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd("omarchy-menu"))

-- Apps
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("omarchy-capture-screenshot smart copy"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("omarchy-capture-screenshot"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("omarchy-capture-screenshot windows"))

-- Screen recordings
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("omarchy-capture-screenrecording"))
hl.bind(
	"ALT + SHIFT + PRINT",
	hl.dsp.exec_cmd([[omarchy-capture-screenrecording
      --with-microphone-audio 
      --with-desktop-audio
    ]])
)

-- Resizing
hl.bind(
	"ALT + COMMA",
	hl.dsp.window.resize({
		x = -100,
		y = 0,
		relative = true,
	})
)
hl.bind(
	"ALT + PERIOD",
	hl.dsp.window.resize({
		x = 100,
		y = 0,
		relative = true,
	})
)

-- Close/kill
hl.bind("ALT + w", hl.dsp.window.close())
hl.bind("ALT + q", hl.dsp.window.kill())

-- Fullscreen
hl.bind("ALT + f", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Floating
hl.bind("ALT + k", function()
	hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
	hl.dispatch(hl.dsp.window.center())
end)

-- Moving around windows
hl.bind("ALT + n", hl.dsp.focus({ direction = "l" }))
hl.bind("ALT + e", hl.dsp.focus({ direction = "d" }))
hl.bind("ALT + i", hl.dsp.focus({ direction = "u" }))
hl.bind("ALT + o", hl.dsp.focus({ direction = "r" }))

-- Focusing workspaces
hl.bind("ALT + j", hl.dsp.focus({ workspace = "1" }))
hl.bind("ALT + l", hl.dsp.focus({ workspace = "2" }))
hl.bind("ALT + u", hl.dsp.focus({ workspace = "3" }))
hl.bind("ALT + y", hl.dsp.focus({ workspace = "4" }))
hl.bind("ALT + semicolon", hl.dsp.focus({ workspace = "5" }))
hl.bind("ALT + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("ALT + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("ALT + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("ALT + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("ALT + 5", hl.dsp.focus({ workspace = "5" }))

-- Moving windows submap
hl.bind("ALT + m", hl.dsp.submap("movewindow"))
hl.define_submap("movewindow", function()
	local exit_after = function(dispatcher)
		return function()
			hl.dispatch(dispatcher)
			hl.dispatch(hl.dsp.submap("reset"))
		end
	end

	hl.bind("j", exit_after(hl.dsp.window.move({ workspace = "1" })))
	hl.bind("l", exit_after(hl.dsp.window.move({ workspace = "2" })))
	hl.bind("u", exit_after(hl.dsp.window.move({ workspace = "3" })))
	hl.bind("y", exit_after(hl.dsp.window.move({ workspace = "4" })))
	hl.bind("semicolon", exit_after(hl.dsp.window.move({ workspace = "5" })))

	hl.bind("n", exit_after(hl.dsp.window.swap({ direction = "l" })))
	hl.bind("e", exit_after(hl.dsp.window.swap({ direction = "d" })))
	hl.bind("i", exit_after(hl.dsp.window.swap({ direction = "u" })))
	hl.bind("o", exit_after(hl.dsp.window.swap({ direction = "r" })))

	hl.bind("ALT + n", exit_after(hl.dsp.window.move({ direction = "l" })))
	hl.bind("ALT + e", exit_after(hl.dsp.window.move({ direction = "d" })))
	hl.bind("ALT + i", exit_after(hl.dsp.window.move({ direction = "u" })))
	hl.bind("ALT + o", exit_after(hl.dsp.window.move({ direction = "r" })))

	hl.bind("escape", hl.dsp.submap("reset"))
end)
