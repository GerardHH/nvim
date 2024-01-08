return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	keys = {
		-- Diagnostics
		{ "<leader>dD", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Diagnostics workspace" },
		{ "<leader>dd", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Diagnostics document" },
		-- View
		{ "<leader>vt", "<CMD>TroubleToggle<CR>", desc = "View Trouble toggle" },
	},
}
