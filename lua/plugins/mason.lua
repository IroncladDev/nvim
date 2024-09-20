return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    ensure_installed = {
        "prettier",
        "eslint-lsp",
        "stylua",
        "actionlint",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "tailwindcss",
                "rust_analyzer",
                "html",
                "cssls",
                "jsonls",
            },
            automatic_installation = true
        })
    end,
}
