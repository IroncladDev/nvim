return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = function()
		-- Switch to biome if biome.json is found
		local has_biome = vim.fn.filereadable(vim.fn.getcwd() .. "/biome.json") == 1
		local web_formatter = has_biome and { "biome", "biome-check" }
			or { "prettierd", "prettier", stop_after_first = true }

		return {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = web_formatter,
				typescript = web_formatter,
				javascriptreact = web_formatter,
				typescriptreact = web_formatter,
				css = web_formatter,
				svelte = web_formatter,
				astro = web_formatter,
				html = web_formatter,
				nix = { "nixfmt" },
			},
			formatters = {
				nixfmt = {
					prepend_args = { "--indent", "4" },
				},
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		}
	end,
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
