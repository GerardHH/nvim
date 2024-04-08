return {
	"yutkat/confirm-quit.nvim",
	version = "*",
	lazy = true,
	event = "CmdlineEnter",
	keys = {
		{
			"<leader>Q",
			function() require("confirm-quit").confirm_quit() end,
			desc = "Quit all",
		},
		{
			"<leader>q",
			function() require("confirm-quit").confirm_quit_all() end,
			desc = "Quit",
		},
	},
	opts = {},
}
