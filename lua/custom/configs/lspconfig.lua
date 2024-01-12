local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {}

lspconfig.prismals.setup {}

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
