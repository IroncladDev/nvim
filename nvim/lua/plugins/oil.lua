return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = { "icon" },
			delete_to_trash = true,
			lsp_file_methods = {
				enabled = true,
				timeout_ms = 5000,
				autosave_changes = true,
			},
			watch_for_changes = true,
			keymaps = {
				["?"] = { "actions.show_help", mode = "n" },
				["<CR>"] = "actions.select",
				["o"] = "actions.select",
				["n"] = { "actions.parent", mode = "n" },
				["<leader>b"] = { "actions.close", mode = "n" },
				["."] = { "actions.toggle_hidden", mode = "n" },
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name)
					return name ~= ".." and vim.startswith(name, ".")
				end,
			},
			win_options = {
				signcolumn = "yes:2",
			},
		})
	end,
}
