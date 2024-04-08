return {
	"folke/trouble.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	keys = {
		-- View
		{ "<leader>vt", "<CMD>TroubleToggle<CR>", desc = "View Trouble toggle" },
	},
	opts = {
		action_keys = {
			close = "<ESC>",
		},
	},
}
