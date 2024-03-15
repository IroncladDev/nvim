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
      "javascript", "typescript", "css", "html", "json", "markdown", "md", "tsx", "jsx", "svg",
      "javascriptreact", "typescriptreact"
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
      vim.api.nvim_create_autocmd("InsertEnter", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.b.text_changed = false
        end,
      })
      vim.api.nvim_create_autocmd("TextChangedI", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.b.text_changed = true
        end,
      })
      vim.api.nvim_create_autocmd("InsertLeave", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if vim.b.text_changed then
            vim.lsp.buf.format({ async = false })
          end
        end,
      })
    end
  end,
}

return opts
