return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({ PATH = "append" })

        mason_lspconfig.setup({
            ensure_installed = {
                "html",
                "cssls",
                "ts_ls",
                "lua_ls",
            },
            automatic_installation = true,
        })
    end,
}
