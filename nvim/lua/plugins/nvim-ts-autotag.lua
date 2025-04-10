return {
	"windwp/nvim-ts-autotag",
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
    "astro",
		"html",
		"xml",
	},
  event = "VeryLazy",
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
