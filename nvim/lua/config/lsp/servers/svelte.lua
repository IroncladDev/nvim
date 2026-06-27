local utils = require('config.lsp.utils')

vim.lsp.config['svelte'] = {
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_markers = {
        '.svelte-kit/',
        'package.json',
    },
    on_attach = utils.on_attach,
    capabilities = utils.capabilities,
}

vim.lsp.enable('svelte')
