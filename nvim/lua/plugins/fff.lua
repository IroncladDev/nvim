return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		debug = {
			enabled = true,
			show_scores = true,
		},
		git = {
			status_text_color = true,
		},
		logging = {
			log_level = "debug",
		},
	},
	lazy = false,
}
