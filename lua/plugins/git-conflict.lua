return {
	"akinsho/git-conflict.nvim",
	version = "*",
	config = true,
	opts = {
		default_mappings = false, -- disable buffer local mapping created by this plugin
		default_commands = true, -- disable commands created by this plugin
		disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
		list_opener = "copen", -- command or function to open the conflicts list
	},
}
