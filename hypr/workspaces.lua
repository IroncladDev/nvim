hl.workspace_rule({
	workspace = "1",
	monitor = "DP-2",
	default = true,
	persistent = true,
    on_created_empty = "kitty",
})
hl.workspace_rule({
	workspace = "2",
	monitor = "DP-2",
	persistent = true,
})
hl.workspace_rule({
	workspace = "3",
	monitor = "eDP-1",
	persistent = true,
	default = true,
    on_created_empty = "omarchy-launch-browser",
})
hl.workspace_rule({
	workspace = "4",
	monitor = "eDP-1",
	persistent = true,
})
hl.workspace_rule({
	workspace = "5",
	monitor = "DP-2",
	persistent = true,
})
