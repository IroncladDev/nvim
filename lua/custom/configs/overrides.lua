local M = {}

vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('number', true)
vim.o.equalalways = false

vim.cmd[[
augroup AutoReload
    autocmd!
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
    autocmd FileChangedShellPost * e!
augroup END
]]

return M
