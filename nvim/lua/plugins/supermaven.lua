return {
	"supermaven-inc/supermaven-nvim",
  lazy = false,
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<C-l>",
				accept_word = "<C-w>",
			},
			disable_inline_completion = false,
      color = {
        suggestion_color = "#756293",
        cterm = 244
      }
		})
	end,
}
