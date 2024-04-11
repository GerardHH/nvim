return {
	"folke/noice.nvim",
	version = "*",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	lazy = false,
	keys = {
		{ "<leader>fn", "<CMD>Noice telescope<CR>", desc = "Find notifications" },
	},
	opts = {
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
}
