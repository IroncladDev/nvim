-- lua/plugins/nvim-lint.lua
return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")

		vim.env.ESLINT_D_PPID = vim.fn.getpid()
		vim.env.ESLINT_D_MISS = "fail"
		vim.env.ESLINT_D_ROOT = vim.fn.getcwd()

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
            astro = { "eslint_d" },
		}

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
