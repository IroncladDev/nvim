return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
        vim.env.ESLINT_D_PPID = vim.fn.getpid()
        vim.env.ESLINT_D_MISS = "fail"
        vim.env.ESLINT_D_ROOT = vim.fn.getcwd()

        local js_fts = {
            javascript = true,
            typescript = true,
            javascriptreact = true,
            typescriptreact = true,
            astro = true,
            svelte = true,
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            callback = function()
                if js_fts[vim.bo.filetype] then
                    local linter = vim.fn.filereadable("biome.json") == 1 and "biomejs" or "eslint";
                    require("lint").try_lint({ linter })
                end
            end,
        })
    end,
}
