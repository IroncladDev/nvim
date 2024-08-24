return {
	"frankroeder/parrot.nvim",
	dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
	cond = os.getenv("OPENAI_API_KEY") ~= nil and os.getenv("PERPLEXITY_API_KEY") ~= nil,
	config = function()
		require("parrot").setup({
			providers = {
				pplx = {
					api_key = os.getenv("PERPLEXITY_API_KEY"),
				},
				openai = {
					api_key = os.getenv("OPENAI_API_KEY"),
				},
				ollama = {},
			},
            toggle_target = "tabnew"
		})
	end,
}
