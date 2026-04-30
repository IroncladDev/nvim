return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
    },
    ensure_installed = {
        "stylua",
        "prettier",
        "prettierd",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({ PATH = "append" })

        mason_lspconfig.setup({
            ensure_installed = {
                "astro",
                "html",
                "cssls",
                "ts_ls",
                "lua_ls",
                "rust_analyzer",
            },
            automatic_installation = true,
        })
    end,
}
