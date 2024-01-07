return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
	version = "*",
	lazy = false,
	keys = {
		{ "<leader>bc", "<CMD>bd<CR>", desc = "Buffer close current" },
		{ "<leader>bl", "<CMD>BufferLineCloseLeft<CR>", desc = "Buffer close left" },
		{ "<leader>bn", "<CMD>BufferLineMoveNext<CR>", desc = "Buffer move next" },
		{ "<leader>bo", "<CMD>BufferLineCloseOthers<CR>", desc = "Buffer close others" },
		{ "<leader>bp", "<CMD>BufferLineMovePrev<CR>", desc = "Buffer move previous" },
		{ "<leader>br", "<CMD>BufferLineCloseRight<CR>", desc = "Buffer close right" },
	},
	opts = {
		highlights = {},
		options = {
			close_command = "Bdelete! %d",
			right_mouse_command = "Bdelete! %d",
		},
	},
}
