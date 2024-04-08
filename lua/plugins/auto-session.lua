return {
	"rmagatti/auto-session",
	version = "*",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>Sd", "<CMD>Autosession delete<CR>", desc = "Session delete" },
		{ "<leader>Sl", "<CMD>Autosession search<CR>", desc = "Session list" },
		{ "<leader>Sr", "<CMD>Autosession restore<CR>", desc = "Session restore" },
	},
	opts = {
		auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		auto_session_use_git_branch = true,
	},
}
