return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",
  event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},

			highlights = require("catppuccin.groups.integrations.bufferline").get()
		})
	end,
}
