local M = {}

vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('number', true)

vim.cmd([[autocmd FocusGained * checktime]])

return M
