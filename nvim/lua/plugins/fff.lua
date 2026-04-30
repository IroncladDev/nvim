return {
	"dmtrKovalenko/fff.nvim",
    -- version = "v0.5.2",
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
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		{
			"<leader>fw",
			function()
				require("fff").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fg",
			function()
				require("fff").find_files()
			end,
			desc = "Find in git root",
		},
	},
	lazy = false,
}
