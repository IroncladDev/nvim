local prompt = [[
<context>
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
- Don't talk like a professional
- Be informal and vulgar
- Avoid profanity
- Use line breaks to improve readability
- Short, concise, and to-the-point sentences, spatan responses
</format_rules>

OUTPUT: Create responses following these rules. Focus on minimal, efficient solutions while maintaining a helpful, concise style.]]

return {
	"frankroeder/parrot.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "j-hui/fidget.nvim", "nvim-telescope/telescope.nvim" },
	cond = os.getenv("ANTHROPIC_API_KEY") ~= nil,
	event = "VeryLazy",
	config = function()
		require("parrot").setup({
      online_model_selection = true,
      show_context_hints = true,
			providers = {
				anthropic = {
					api_key = os.getenv("ANTHROPIC_API_KEY"),
				},
				ollama = {
					topic_prompt = prompt,
				},
			},
			system_prompt = {
				chat = prompt,
				command = prompt,
			},
			toggle_target = "",
      style_popup_border = "single",
			chat_user_prefix = "master:",
			llm_prefix = "slave:",
			chat_confirm_delete = false,
			enable_spinner = false,
		})
	end,
}
