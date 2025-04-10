local bufnr = vim.api.nvim_get_current_buf()
local keymap = vim.keymap

local opts = {
	noremap = true,
	silent = true,
}

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
