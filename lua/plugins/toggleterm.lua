return {
	"akinsho/toggleterm.nvim",
	config = function()
		local theme = require("catppuccin.palettes").get_palette("macchiato")

		require("toggleterm").setup({
			direction = "float",
			highlights = {
        NormalFloat = {
          link = "Normal",
        },
				FloatBorder = {
					guifg = theme.overlay0,
				},
			},
      shade_terminals = false,
      float_opts = {
        border = "curved",
      }
		})
	end,
}
