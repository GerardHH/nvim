return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	keys = {
		-- Diagnostics
		{ "<leader>dD", "<CMD>TroubleToggle workspace_diagnostics<CR>", desc = "Diagnostics workspace" },
		{ "<leader>dd", "<CMD>TroubleToggle document_diagnostics<CR>", desc = "Diagnostics document" },
		-- LSP
		{ "<leader>lgd", "<CMD>TroubleToggle lsp_definitions<CR>", desc = "LSP definitions" },
		{ "<leader>lgt", "<CMD>TroubleToggle lsp_type_definitions<CR>", desc = "LSP type definitions" },
		{ "<leader>llr", "<CMD>TroubleToggle lsp_references<CR>", desc = "LSP List references" },
		-- View
		{ "<leader>vt", "<CMD>TroubleToggle<CR>", desc = "View Trouble toggle" },
	},
}
