return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
  event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { "", "" },
				component_separators = { "|", "|" },
				icons_enabled = true,
				theme = "catppuccin",
			},
		})
	end,
}
