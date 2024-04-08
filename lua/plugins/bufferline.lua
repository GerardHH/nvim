return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"moll/vim-bbye",
		"catppuccin/nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>bc", "<CMD>bd<CR>", desc = "Buffer close current" },
		{ "<leader>bl", "<CMD>BufferLineCloseLeft<CR>", desc = "Buffer close left" },
		{ "<leader>bn", "<CMD>BufferLineMoveNext<CR>", desc = "Buffer move next" },
		{ "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", desc = "Buffer close others" },
		{ "<leader>bp", "<CMD>BufferLineMovePrev<CR>", desc = "Buffer move previous" },
		{ "<leader>br", "<CMD>BufferLineCloseRight<CR>", desc = "Buffer close right" },
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
			},
		})
	end,
}
