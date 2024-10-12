return {
	"dcampos/nvim-snippy",
	config = function()
		require("snippy").setup({
			mappings = {
				is = {
                    ["<C-i>"] = "expand",
					["<C-j>"] = "expand_or_advance",
					["<C-k>"] = "previous",
				},
			},
		})
	end,
}
