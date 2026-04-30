local utils = require('config.lsp.utils')

vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_markers = {
        'tsconfig.json',
        'package.json',
    },
    init_options = {
        hostInfo = 'neovim',
    },
    settings = {
        typescript = {
            preferences = {
                includeCompletionsForImportStatements = true,
            }
        },
        javascript = {
            preferences = {
                includeCompletionsForImportStatements = true,
            }
        },
    },
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
}

vim.lsp.enable('ts_ls')
