-- Set tab width to four spaces
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

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
