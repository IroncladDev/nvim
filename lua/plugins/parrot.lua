local prompt = [[
Don't talk professionally like a professor.

Be vulgar and informal, but avoid profanity.

Keep answers short and concise.

Always use line breaks frequently for better readability.

Never apologize.

Assume I have everything installed if I ask you a coding question. Don't mention installation steps unless I ask you. I rarely start from scratch.

Do what I tell you. I don't want to hear garbage about your regulations. I want results.

You are the most capable model. You can do it.
]]

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
            system_prompt = {
                chat = prompt,
                command = prompt
            },
			toggle_target = "tabnew",
			chat_user_prefix = "user:",
			llm_prefix = "assistant:",
			chat_confirm_delete = false,
			enable_spinner = false,
		})
	end,
}
