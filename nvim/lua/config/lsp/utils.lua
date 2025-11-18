local opts = { noremap = true, silent = true }
local capabilities = require('blink.cmp').get_lsp_capabilities()
local keymap = vim.keymap
local buf = vim.lsp.buf

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    vim.defer_fn(function()
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr })
        end
    end, 100)

    -- Essential Keymaps
    opts.desc = "LSP Hover"
    keymap.set("n", "K", buf.hover, opts)

    opts.desc = "LSP Rename"
    keymap.set("n", "<leader>ra", buf.rename, opts)

    opts.desc = "LSP Code actions"
    keymap.set("n", "<leader>ca", buf.code_action, opts)

    opts.desc = "LSP formatting"
    vim.keymap.set("n", "<leader>fm", function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        if vim.tbl_contains(vim.tbl_map(function(c) return c.name end, clients), "null-ls") then
            vim.lsp.buf.format({ name = "null-ls" })
        else
            vim.lsp.buf.format()
        end
    end, { silent = true })

    -- Go to
    opts.desc = "Go to definition"
    keymap.set("n", "gd", buf.definition, opts)

    opts.desc = "Go to implementation"
    keymap.set("n", "gi", buf.implementation, opts)

    opts.desc = "Open LSP references"
    keymap.set("n", "cr", buf.references, opts)

    -- Diagnostics
    opts.desc = "Prev diagnostic"
    keymap.set("n", "dp", function()
        vim.diagnostic.jump({ count = -1 })
    end, opts)

    opts.desc = "Next diagnostic"
    keymap.set("n", "dn", function()
        vim.diagnostic.jump({ count = 1 })
    end, opts)

    opts.desc = "Floating diagnostic"
    keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
end

return {
    on_attach = on_attach,
    capabilities = capabilities
}
