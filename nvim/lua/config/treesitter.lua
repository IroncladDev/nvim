local javascript_fts = { "json", "javascript", "typescript", "typescriptreact", "javascriptreact" }
local xml_fts = { "html", "xml", "svg" }

vim.treesitter.language.register("tsx", javascript_fts)
vim.treesitter.language.register("html", xml_fts)
vim.treesitter.language.register("css", "css")
vim.treesitter.language.register("astro", "astro")

-- Build pattern array by concatenating all filetypes
local pattern = {}
vim.list_extend(pattern, javascript_fts)
vim.list_extend(pattern, xml_fts)
vim.list_extend(pattern, { "lua", "vim", "vimdoc", "css", "rust", "astro" })

-- Enable treesitter highlighting and indentation
vim.api.nvim_create_autocmd("FileType", {
	pattern = pattern,
	callback = function(args)
		local ok, err = pcall(vim.treesitter.start, args.buf)
		if not ok then
			vim.notify("Treesitter error for " .. args.match .. ": " .. tostring(err), vim.log.levels.WARN)
		end
		local indent_ok, indent_err = pcall(function()
			vim.bo[args.buf].indentexpr = "v:lua.require'vim.treesitter'.indentexpr()"
		end)
		if not indent_ok then
			vim.notify("Indent error for " .. args.match .. ": " .. tostring(indent_err), vim.log.levels.DEBUG)
		end
	end,
})
