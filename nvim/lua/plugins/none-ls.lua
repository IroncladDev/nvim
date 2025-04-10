return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local root_has_file = function(file)
      return vim.fn.filereadable(vim.fn.expand(file)) == 1
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.biome.with({
          condition = function()
            return root_has_file("biome.json")
          end,
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "astro",
            "html",
            "css",
          },
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function()
            return not root_has_file("biome.json")
          end,
        }),
        require("none-ls.diagnostics.eslint").with({
          condition = function()
            return not root_has_file("biome.json")
          end,
        }),
        null_ls.builtins.formatting.stylua.with({
          condition = function()
            return root_has_file("init.lua")
          end,
        }),
      },
    })
  end,
}
