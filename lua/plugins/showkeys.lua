return {
	"nvzone/showkeys",
	cmd = "ShowkeysToggle",
	config = function()
		require("showkeys").setup({
			timeout = 1,
			maxkeys = 5,
			position = "top-right",
		})
	end,
}
