-- Set tab width to four spaces
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Sync clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Tmux-like splits
vim.o.equalalways = false

-- Prevent layout shift from diagnostics
vim.opt.signcolumn = 'yes'

-- Gitsigns git refresh rate
vim.opt.updatetime = 250

-- Automatically reload files when focused or changed
vim.cmd[[
augroup AutoReload
    autocmd!
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
    autocmd FileChangedShellPost * e!
augroup END
]]
