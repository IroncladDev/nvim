-- Leader
vim.g.mapleader = " "

-- Nvimtree
vim.keymap.set("n", "<leader>b", "<cmd> NvimTreeToggle <CR>")

-- Undotree
vim.keymap.set("n", "<leader>u", "<cmd> UndotreeToggle <CR>")

-- Easy vimgrep search
vim.keymap.set("n", "<leader>gp", function()
	local pattern = vim.fn.input("Search Regex: ")
	local filetype = vim.fn.input("File Glob: ")

	local cmd = string.format("vimgrep /%s/gj **/%s", pattern, filetype)

	vim.cmd(cmd)
	vim.cmd("copen")
end, { desc = "Vimgrep for pattern & Glob" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>", { desc = "Show diagnostics" })
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live Grep" })
vim.keymap.set("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>tc", "<cmd> Telescope commands <CR>", { desc = "Show commands" })

-- Lspconfig
vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, { desc = "Floating Diagnostics" })

-- Bufferline
vim.keymap.set("n", "<tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<S-tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>x", "<cmd> bd <CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader>X", "<cmd> bd! <CR>", { desc = "Force Close Tab" })

-- Navigating in Insert Mode
vim.keymap.set("i", "<C-s>", "<ESC>^i", { desc = "Start of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move levt" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Navigate in Normal Mode
vim.keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Window right" })

-- Move up and down through wrapped lines in normal/terminal mode
vim.keymap.set({ "n", "x" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
vim.keymap.set({ "n", "x" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })

-- Additional movement
vim.keymap.set({ "n", "v" }, "<C-h>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "v" }, "<C-l>", "$", { desc = "End of line" })
vim.keymap.set({ "n", "v" }, "<C-j>", "}", { desc = "Next block" })
vim.keymap.set({ "n", "v" }, "<C-k>", "{", { desc = "Previous block" })

-- Dioxus formatting
vim.keymap.set("n", "<leader>fx", "<cmd> silent! !dx fmt <CR>", { desc = "Dioxus formatting" })

-- Redo
vim.keymap.set("n", "<C-u>", "<C-r>", { desc = "Redo", noremap = true, silent = true })

-- Visual Navigation
vim.keymap.set("v", "<", "<gv", { desc = "Indent line" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line" })

-- Paste in terminal mode
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Toggle comment in both modes
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
vim.keymap.set(
	"v",
	"<leader>/",
	"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "Toggle comment" }
)

-- Terminal Mode
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- Splits
vim.api.nvim_set_keymap("n", "<leader>sh", ":vnew<CR> <C-w>h", { desc = "New split left" })
vim.api.nvim_set_keymap("n", "<leader>sj", ":split<CR> <C-w>j", { desc = "New split down" })
vim.api.nvim_set_keymap("n", "<leader>sk", ":new<CR> <C-w>k", { desc = "New split up" })
vim.api.nvim_set_keymap("n", "<leader>sl", ":vsplit<CR> <C-w>l", { desc = "New split right" })
vim.api.nvim_set_keymap("n", "<leader>th", ":vnew<CR> <C-w>h :term<CR>", { desc = "Terminal split left" })
vim.api.nvim_set_keymap("n", "<leader>tj", ":split<CR> <C-w>j :term<CR>", { desc = "Terminal split down" })
vim.api.nvim_set_keymap("n", "<leader>tk", ":new<CR> <C-w>k :term<CR>", { desc = "Terminal split up" })
vim.api.nvim_set_keymap("n", "<leader>tl", ":vsplit<CR> <C-w>l :term<CR>", { desc = "Terminal split right" })
vim.keymap.set("n", "<leader>sw", function()
	if #vim.api.nvim_list_wins() > 1 then
		vim.cmd("q")
	else
		print("Cannot quit, only one split open.")
	end
end, { desc = "Close split" })
