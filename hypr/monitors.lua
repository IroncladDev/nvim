hl.env("GDK_SCALE", "2")
hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@165.00Hz",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = "DP-3",
	mode = "preferred",
	position = "1920x0",
	scale = 1,
})
