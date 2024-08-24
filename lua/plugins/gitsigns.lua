return {
	"lewis6991/gitsigns.nvim",
	ft = { "gitcommit", "diff" },
	init = function()
		-- load gitsigns only when a git file is opened
		vim.api.nvim_create_autocmd({ "BufRead" }, {
			group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
			callback = function()
				vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
				if vim.v.shell_error == 0 then
					vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
					vim.schedule(function()
						require("lazy").load({ plugins = { "gitsigns.nvim" } })
					end)
				end
			end,
		})
	end,
	config = function()
		local opts = {}

		local on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			opts.buffer = bufnr

			opts.desc = "Reset hunk"
			vim.keymap.set("n", "<leader>rh", function()
				gitsigns.reset_hunk()
			end, opts)

			opts.desc = "Preview hunk"
			vim.keymap.set("n", "<leader>ph", function()
				gitsigns.preview_hunk()
			end, opts)

			opts.desc = "Blame line"
			vim.keymap.set("n", "<leader>gb", function()
				package.loaded.gitsigns.blame_line()
			end, opts)

			opts.desc = "Toggle deleted"
			vim.keymap.set("n", "<leader>td", function()
				gitsigns.toggle_deleted()
			end, opts)

			opts.desc = "Next hunk"
			opts.expr = true
			vim.keymap.set("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end, opts)

			opts.desc = "Prev hunk"
			vim.keymap.set("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end, opts)
		end

		require("gitsigns").setup({
			on_attach = on_attach,
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "󰍵" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "│" },
            },
		})
	end,
}
