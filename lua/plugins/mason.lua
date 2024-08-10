return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    ensure_installed = {
        "prettierd",
        "eslint-lsp",
        "stylua"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "tailwindcss",
                "rust_analyzer"
            },
            automatic_installation = true
        })
    end,
}
