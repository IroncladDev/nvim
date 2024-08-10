return {
	"supermaven-inc/supermaven-nvim",
	event = "VeryLazy",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-g>",
				clear_suggestion = "<C-c>",
				accept_word = "<C-w>",
			},
			disable_inline_completion = false,
		})
	end,
}
