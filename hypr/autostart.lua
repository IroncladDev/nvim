hl.on("hyprland.start", function()
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- hypridle"))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- mako"))
	hl.dispatch(hl.dsp.exec_cmd("uwsm-app -- fcitx5 --disable notificationitem"))
	hl.dispatch(hl.dsp.exec_cmd("swaybg -i ~/.config/wallpapers/wallpaper-ak.png -m fill"))

    -- omarchy-specific
	hl.dispatch(hl.dsp.exec_cmd("omarchy-first-run"))
	hl.dispatch(hl.dsp.exec_cmd("omarchy-powerprofiles-init"))
	hl.dispatch(hl.dsp.exec_cmd("omarchy-hyprland-monitor-watch"))
    hl.dispatch(hl.dsp.exec_cmd("sleep 2 && omarchy-hook post-boot"))

	hl.dispatch(hl.dsp.exec_cmd("signal-desktop", { workspace = "2" }))
	hl.dispatch(hl.dsp.exec_cmd('omarchy-launch-webapp "https://discord.com/channels/@me"', { workspace = "2" }))
	hl.dispatch(hl.dsp.exec_cmd('omarchy-launch-webapp "https://mail.google.com"', { workspace = "2" }))
	hl.dispatch(hl.dsp.exec_cmd("omarchy-launch-browser", { workspace = "3" }))
	hl.dispatch(hl.dsp.exec_cmd("kitty", { workspace = "1" }))
	hl.dsp.focus({ workspace = "1" })
end)
