-- Leader
vim.g.mapleader = " "

-- Nvimtree
vim.keymap.set("n", "<leader>b", "<cmd> NvimTreeToggle <CR>")

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
vim.keymap.set("n", "<leader>x", "<cmd> bp|bd # <CR>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>X", "<cmd> bd! <CR>", { desc = "Force Close Buffer" })

-- Navigating in Insert Mode
vim.keymap.set("i", "<C-s>", "<ESC>^i", { desc = "Start of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })
vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Navigate in Normal Mode
vim.keymap.set("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- Move up and down through wrapped lines in normal/terminal/visual mode
vim.keymap.set(
	{ "n", "v" },
	"j",
	'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
	{ desc = "Move down", expr = true, noremap = true }
)
vim.keymap.set(
	{ "n", "v" },
	"k",
	'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
	{ desc = "Move up", expr = true, noremap = true }
)

-- Move to the next/previous line if at the first/last column
vim.keymap.set(
	{ "n", "v" },
	"h",
	'v:count == 0 && col(".") == 1 ? "k$" : "h"',
	{ desc = "Move left", expr = true, noremap = true }
)
vim.keymap.set(
	{ "n", "v" },
	"l",
	'v:count == 0 && col(".") == col("$") - 1 ? "j0" : "l"',
	{ desc = "Move right", expr = true, noremap = true }
)

-- Additional movement
vim.keymap.set({ "n", "v" }, "<C-h>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "v" }, "<C-l>", "$", { desc = "End of line" })

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
vim.api.nvim_set_keymap("t", "<C-x>", [[<C-\><C-n>]], { noremap = true })

-- Splits
vim.api.nvim_set_keymap("n", "<leader>sh", ":vnew<CR> <C-w>h", { desc = "New split left" })
vim.api.nvim_set_keymap("n", "<leader>sj", ":split<CR> <C-w>j", { desc = "New split down" })
vim.api.nvim_set_keymap("n", "<leader>sk", ":new<CR> <C-w>k", { desc = "New split up" })
vim.api.nvim_set_keymap("n", "<leader>sl", ":vsplit<CR> <C-w>l", { desc = "New split right" })

-- Parrot
vim.keymap.set({ "n", "v" }, "<leader>ai", ":PrtChatToggle<CR>", { desc = "Parrot Toggle AI Chat" })
vim.keymap.set({ "n", "v" }, "<leader>an", ":PrtChatNew<CR>", { desc = "Parrot New AI Chat" })
vim.keymap.set({ "n", "v" }, "<leader>af", ":PrtChatFinder<CR>", { desc = "Parrot Find Chat" })
vim.keymap.set({ "n", "v" }, "<leader>ar", ":PrtChatResponde<CR>", { desc = "Parrot Respond", silent = true })
vim.keymap.set({ "n", "v" }, "<leader>as", ":PrtChatStop<CR>", { desc = "Parrot Stop Streaming" })
vim.keymap.set({ "n", "v" }, "<leader>ad", ":PrtChatDelete<CR>", { desc = "Parrot Delete Chat" })
vim.keymap.set({ "n", "v" }, "<leader>ap", ":PrtProvider<CR>", { desc = "Parrot Select Provider" })
vim.keymap.set({ "n", "v" }, "<leader>am", ":PrtModel<CR>", { desc = "Parrot Select Model" })
vim.keymap.set({ "v" }, "<leader>rw", ":PrtRewrite<CR>", { desc = "Rewrite" })

-- ToggleTerm
vim.keymap.set({ "n", "v", "i", "t" }, "<C-f>", "<cmd> ToggleTerm<CR>", { desc = "Toggle Terminal" })

-- Folding
vim.keymap.set("n", "<leader>fb", "$zf%", { desc = "Fold block" })
