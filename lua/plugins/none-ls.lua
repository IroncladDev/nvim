local has_eslint_config = function()
	local configs =
		{ ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.cjs" }

	for _, config in ipairs(configs) do
		if vim.fn.filereadable(config) == 1 then
			return true
		end
	end

	return false
end

return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.actionlint,
				require("none-ls.diagnostics.eslint").with({
					condition = has_eslint_config,
				}),
			},
		})
	end,
}
