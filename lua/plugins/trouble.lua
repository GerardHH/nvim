return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	keys = {
		-- View
		{ "<leader>vt", "<CMD>TroubleToggle<CR>", desc = "View Trouble toggle" },
	},
}
