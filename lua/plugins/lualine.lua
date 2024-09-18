return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"arkav/lualine-lsp-progress",
	},
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { "", "" },
				component_separators = { "|", "|" },
				icons_enabled = true,
			},
			sections = {
				lualine_c = {
					{
						"lsp_progress",
						display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
						spinner_symbols = { "⣷ ", "⣯ ", "⣟ ", "⡿ ", "⢿ ", "⣻ ", "⣽ ", "⣾ " },
					},
				},
			},
		})
	end,
}
