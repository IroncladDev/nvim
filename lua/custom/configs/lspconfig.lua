local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          '"([^"]*)"',
          { '@apply\\s+(.*)$', '[^\\w]([\\w-]+)' },
        }
      },
      validate = true
    }
  },
  filetypes = {
    "typescriptreact", "html", "rust", "css"
  },
  root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
  init_options = {
    userLanguages = {
      rust = "html",
    }
  }
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    }
  }
}

lspconfig.prismals.setup {}
