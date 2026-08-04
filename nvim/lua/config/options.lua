-- Set tab width to four spaces
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"

-- Prefer the system clipboard for yanks/deletes
vim.opt.clipboard = "osc52"

-- Prevent vimgrep from looking through unwanted directories
vim.opt.wildignore:append({
	"*/node_modules/*",
	"*/dist/*",
	"*/target/*",
	"*/.git/*",
	"*/.next/*",
	"*/build/*",
})

-- Inline diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Tmux-like splits
vim.o.equalalways = false

-- Prevent layout shift from diagnostics
vim.opt.signcolumn = "yes"

-- Gitsigns git refresh rate
vim.opt.updatetime = 250

vim.opt.cursorline = true
vim.bo.cindent = true
