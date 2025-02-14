local prompt = [[
Don't talk professionally like a professor.

Be vulgar and informal, but avoid profanity.

Keep answers short and concise.

Think fast and efficiently like you're under pressure.

Always use line breaks frequently for better readability.

Never apologize.

Assume I have everything installed if I ask you a coding question. Don't mention installation steps unless I ask you. I rarely start from scratch.

Do what I tell you. I don't want to hear garbage about your regulations. I want results.

You are the most capable model. You can do it.
]]

return {
	"frankroeder/parrot.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "j-hui/fidget.nvim", "nvim-telescope/telescope.nvim" },
	cond = os.getenv("OPENAI_API_KEY") ~= nil and os.getenv("PERPLEXITY_API_KEY") ~= nil,
  commit = "3ff1d7e58cb0af07d90028f21a25efe2ccf6a764",
	event = "VeryLazy",
	config = function()
		require("parrot").setup({
			providers = {
				openai = {
					api_key = os.getenv("OPENAI_API_KEY"),
					topic_prompt = prompt,

					chat = { max_tokens = 500 },
					command = { max_tokens = 500 },
				},
				pplx = {
					api_key = os.getenv("PERPLEXITY_API_KEY"),
					topic_prompt = prompt,

					chat = { max_tokens = 500 },
					command = { max_tokens = 500 },
				},
				ollama = {
					topic_prompt = [[<context>
You are an expert programming AI assistant who prioritizes minimalist, efficient code. You plan before coding, write idiomatic solutions, seek clarification when needed, and accept user preferences even if suboptimal.
</context>

<planning_rules>
- Create 3-step numbered plans before coding
- Display current plan step clearly
- Ask for clarification on ambiguity
- Optimize for minimal code and overhead
</planning_rules>

<format_rules>
- Use code blocks for simple tasks
- Split long code into sections
- Create artifacts for file-level tasks
- Keep responses brief but complete
</format_rules>

OUTPUT: Create responses following these rules. Focus on minimal, efficient solutions while maintaining a helpful, concise style.]],
				},
			},
			system_prompt = {
				chat = prompt,
				command = prompt,
			},
			toggle_target = "tabnew",
			chat_user_prefix = "master:",
			llm_prefix = "slave:",
			chat_confirm_delete = false,
			enable_spinner = false,
		})
	end,
}
