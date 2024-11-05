-- lua/plugins/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local rust_tools = require("rust-tools")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = {
			noremap = true,
			silent = true,
		}

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "LSP definition"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "LSP Hover"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "LSP implementation"
			keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

			opts.desc = "LSP signature help"
			keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)

			opts.desc = "LSP definition type"
			keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

			opts.desc = "Rename"
			keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)

			opts.desc = "LSP code action"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "LSP references"
			keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)

			opts.desc = "LSP formatting"
			keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)

			opts.desc = "Show LSP references"
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Goto prev"
			keymap.set("n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

			opts.desc = "Goto next"
			keymap.set("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = "x", Warn = "w", Hint = "!", Info = "i" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticsSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig.ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.jsonls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							'"([^"]*)"',
							{ "@apply\\s+(.*)$", "[^\\w]([\\w-]+)" },
						},
					},
					validate = true,
				},
			},
			filetypes = {
				"typescriptreact",
				"html",
				"rust",
				"css",
			},
			root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
			init_options = {
				userLanguages = {
					rust = "html",
				},
			},
		})

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		rust_tools.setup({
			server = {
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						-- checkOnSave = {
						-- 	command = "clippy",
						-- },
						cargo = {
							loadOutDirsFromCheck = true,
						},
						diagnostics = {
							enable = true,
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
						callInfo = {
							full = {
								enable = true,
							},
						},
					},
				},
			},
		})
	end,
}
