return {
	"j-hui/fidget.nvim",
	version = "v1.5.0",
	opts = {
		progress = {
			poll_rate = 10, -- Adjust the poll rate as needed
			suppress_on_insert = false,
			ignore_done_already = false,
			ignore_empty_message = false,
		},
		notification = {
			poll_rate = 10,
			filter = nil,
			history_size = 128,
			override_vim_notify = true,
			window = {
				winblend = 0,
			},
		},
		integration = {
			["nvim-tree"] = {
				enabled = true,
			},
		},
	},
}
