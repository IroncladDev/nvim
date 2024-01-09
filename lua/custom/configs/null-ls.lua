local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- Function to check for ESLint config
local function eslint_config_exists()
    return vim.fn.glob(".eslintrc*") ~= ""
end

-- Set up sources
local sources = {
    null_ls.builtins.formatting.prettier.with({
		filetypes = {
			"javascript","typescript","css","scss","html","json","markdown","graphql","md","tsx","jsx","javascriptreact","typescriptreact"
		},
	}),
}

-- Conditionally add eslint
if eslint_config_exists() then
    table.insert(sources, null_ls.builtins.diagnostics.eslint)
end

local opts = {
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
}

return opts

