hl.on("hyprland.start", function()
	-- hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- hypridle"))
	-- hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- waybar"))
	-- hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- fcitx5 --disable notificationitem"))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- awww-daemon"))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- awww img ~/.config/wallpapers/wallpaper-ak.png --resize crop"))

	-- dunst is started by the Home Manager user unit (services.dunst)

	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- signal-desktop", { workspace = "2" }))
	hl.dispatch(
		hl.dsp.exec_cmd(
			'uwsm-app -- brave --app="https://app.slack.com/client/T03UDTQT274/C03U79SLQNA" --new-window',
			{ workspace = "2" }
		)
	)
	hl.dispatch(hl.dsp.exec_cmd('uwsm-app -- brave --app="https://mail.google.com" --new-window', { workspace = "2" }))
	hl.dispatch(hl.dsp.exec_cmd('uwsm-app -- brave --app="https://app.clickup.com" --new-window', { workspace = "2" }))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- brave", { workspace = "3" }))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- spotify", { workspace = "4" }))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- kitty", { workspace = "1" }))
	hl.dsp.focus({ workspace = "1" })
end)
