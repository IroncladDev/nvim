require("config.mappings")
require("config.options")
require("config.treesitter")
require("config.lazy")
require("config.lsp.init")

vim.api.nvim_create_user_command('LspRestart', function()
    for _, client in ipairs(vim.lsp.get_clients()) do
        client.stop(client)
        -- todo: edit in client buffer
    end
    vim.cmd('edit')
end, {})
