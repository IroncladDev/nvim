return {
	"windwp/nvim-ts-autotag",
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"html",
		"xml",
	},
	config = function()
		require("nvim-ts-autotag").setup()
	end,
	event = "VeryLazy",
}
