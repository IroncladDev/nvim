return {
	"rmagatti/auto-session",
	config = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,localoptions"
		require("auto-session").setup({
			log_level = "info",
			auto_session_enable_last_session = false,
			auto_session_enabled = false,
			auto_save_enabled = true,
			auto_restore_enabled = false,
			auto_session_use_git_branch = false,
			auto_session_allowed_dirs = {},
			auto_session_excluded_dirs = {},
		})
	end,
	lazy = false,
}
