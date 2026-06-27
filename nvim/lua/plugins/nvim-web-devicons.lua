return {
	"nvim-tree/nvim-web-devicons",
	opts = {
		override = {
			-- For some reason, CSS in particular wasn't working properly
			css = {
				icon = "",
				cterm_color = "75",
				color = "#42a5f5",
				name = "Css",
			},
		},
	},
}
