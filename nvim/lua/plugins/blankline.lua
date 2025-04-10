return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
  event = "VeryLazy",
	config = function()
		require("ibl").setup({
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		})
	end,
}
