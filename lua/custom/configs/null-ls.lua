local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

-- Set up sources
local sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
       "rs", "rust"
      },
    }),
    null_ls.builtins.formatting.rustfmt
}

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
                  vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
}

return opts

