local utils = require('config.lsp.utils')

vim.lsp.config['astro'] = {
    cmd = { 'astro-ls', '--stdio' },
    filetypes = { 'astro' },
    root_markers = {
        'package.json',
        'astro.config.mjs',
    },
   on_attach = utils.on_attach,
    capabilities = utils.capabilities,
}

vim.lsp.enable('astro')
