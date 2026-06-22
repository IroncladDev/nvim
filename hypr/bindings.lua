-- Copy / Paste
hl.bind(
	"SUPER + C",
	hl.dsp.send_shortcut({
		mods = "CTRL",
		key = "Insert",
	})
)
hl.bind(
	"SUPER + V",
	hl.dsp.send_shortcut({
		mods = "SHIFT",
		key = "Insert",
	})
)
hl.bind(
	"SUPER + X",
	hl.dsp.send_shortcut({
		mods = "CTRL",
		key = "X",
	})
)
hl.bind("ALT + V", hl.dsp.exec_cmd("omarchy-launch-walker -m clipboard"))

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
