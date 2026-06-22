local keymap = vim.keymap

local left = "n"
local down = "e"
local up = "i"
local right = "o"

vim.keymap.set({ "i", "t", "c" }, "<M-BS>", "<C-w>", { noremap = true })

-- Move up and down through wrapped lines in normal/terminal/visual mode
keymap.set({ "n", "v" }, down, "<DOWN>", { noremap = true, nowait = true })
keymap.set({ "n", "v" }, up, "<UP>", { noremap = true, nowait = true })
keymap.set({ "n", "v" }, left, "<LEFT>", { noremap = true, nowait = true })
keymap.set({ "n", "v" }, right, "<RIGHT>", { noremap = true, nowait = true })

keymap.set({ "n", "v" }, "k", "n", { noremap = true })
keymap.set({ "n", "v" }, "j", "e", { noremap = true })
keymap.set({ "n", "v" }, "h", "o", { noremap = true })
keymap.set({ "n", "v" }, "l", "i", { noremap = true })

keymap.set({ "n", "v" }, "K", "N", { noremap = true })
keymap.set({ "n", "v" }, "H", "O", { noremap = true })

-- Leader
vim.g.mapleader = " "

-- Nvimtree
keymap.set("n", "<leader>b", "<cmd> Oil <CR>")

-- Buffers
keymap.set("n", "<tab>", "<cmd> bn <CR>", { desc = "Next buffer" })
keymap.set("n", "<S-tab>", "<cmd> bp <CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", "<cmd> bd <CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>ox", function()
	local bufs = vim.tbl_filter(function(b)
		return vim.api.nvim_buf_is_loaded(b) and b ~= vim.api.nvim_get_current_buf()
	end, vim.api.nvim_list_bufs())
	for _, b in ipairs(bufs) do
		vim.api.nvim_buf_delete(b, {})
	end
end, { desc = "Close other buffers" })

keymap.set("n", "<leader>X", "<cmd> bd! <CR>", { desc = "Force Close Buffer" })

-- Navigating in Insert Mode
keymap.set("i", "<C-" .. left .. ">", "<Left>", { desc = "Move left", noremap = true })
keymap.set("i", "<C-" .. down .. ">", "<Down>", { desc = "Move down", noremap = true })
keymap.set("i", "<C-" .. up .. ">", "<Up>", { desc = "Move up", noremap = true })
keymap.set("i", "<C-" .. right .. ">", "<Right>", { desc = "Move right", noremap = true })

-- Navigate in Normal Mode
keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Visual Navigation
keymap.set("v", "<", "<gv", { desc = "Indent line" })
keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Paste in terminal mode
keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Toggle comment in both modes
keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
keymap.set(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle comment" }
)

-- Terminal Mode
keymap.set("t", "<C-x>", [[<C-\><C-n>]], { noremap = true })

-- Splits
keymap.set("n", "<leader>s" .. left, ":vnew<CR> <C-w>h", { desc = "New split left" })
keymap.set("n", "<leader>s" .. down, ":split<CR> <C-w>j", { desc = "New split down" })
keymap.set("n", "<leader>s" .. up, ":new<CR> <C-w>k", { desc = "New split up" })
keymap.set("n", "<leader>s" .. right, ":vsplit<CR> <C-w>l", { desc = "New split right" })

-- Window navigation
keymap.set("n", "<leader>w" .. left, "<C-w>h", { desc = "Move left" })
keymap.set("n", "<leader>w" .. down, "<C-w>j", { desc = "Move down" })
keymap.set("n", "<leader>w" .. up, "<C-w>k", { desc = "Move up" })
keymap.set("n", "<leader>w" .. right, "<C-w>l", { desc = "Move right" })

-- Reload theme
vim.keymap.set("n", "<leader>os", function()
	for k in pairs(package.loaded) do
		if k:match("^osmium") then
			package.loaded[k] = nil
		end
	end
	require("osmium").setup({
		integrations = {
			telescope = false,
			gitsigns = false,
			blink_cmp = false,
		},
		transparent_bg = false,
	})
	vim.cmd.colorscheme("osmium")
end, { desc = "Reload osmium" })

-- Inspection
keymap.set("n", "<leader>i", "<cmd> Inspect <CR>")

-- Glance
vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>")
vim.keymap.set("n", "gr", "<CMD>Glance references<CR>")
vim.keymap.set("n", "gi", "<CMD>Glance implementations<CR>")
vim.keymap.set("n", "<leader>g", "<CMD>Glance resume<CR>")
