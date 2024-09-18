return {
	"dcampos/nvim-snippy",
	config = function()
		require("snippy").setup({
			mappings = {
				is = {
                    ["<C-e>"] = "expand",
					["<C-j>"] = "expand_or_advance",
					["<C-k>"] = "previous",
				},
			},
		})
	end,
}
