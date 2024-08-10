return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local WIDTH_RATIO = 0.5

		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
				exclude = { vim.fn.stdpath("config") .. "/lua/custom" },
			},
			disable_netrw = true,
			hijack_netrw = true,
			hijack_cursor = true,
			hijack_unnamed_buffer_when_opening = false,
			sync_root_with_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			ui = {
				confirm = {
					default_yes = true,
				},
			},
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get()
						local center_x = math.floor(screen_w / 2) - 20

						return {
							border = "none",
							relative = "editor",
							row = 1,
							col = center_x,
							width = 40,
							height = screen_h - 3,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
				end,
				number = false,
			},
			git = {
				enable = true,
				ignore = false,
			},
			filesystem_watchers = {
				enable = true,
			},
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			renderer = {
				root_folder_label = false,
				highlight_git = "name",
				highlight_opened_files = "none",

				indent_markers = {
					enable = false,
				},

				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},

					glyphs = {
						default = "󰈚",
						symlink = "",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
							symlink_open = "",
							arrow_open = "",
							arrow_closed = "",
						},
						git = {
							unstaged = "*",
							staged = "✓",
							unmerged = "",
							renamed = "~",
							untracked = "?",
							deleted = "-",
							ignored = "◌",
						},
					},
				},
			},
		})
	end,
}
