return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye", "folke/which-key.nvim" },
	version = "*",
	config = function()
		require("bufferline").setup({
			options = {
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
			},
		})

		local wk = require("which-key")
		wk.register({
			b = {
				name = "Buffer",
				c = { "<cmd>BufferLinePickClose<cr>", "Buffer pick close" },
				l = { "<cmd>BufferLineCloseLeft<cr>", "Buffer close left" },
				o = { "<cmd>BufferLineCloseOthers<cr>", "Buffer close others" },
				p = { "<cmd>BufferLinePick<cr>", "Buffer pick open" },
				r = { "<cmd>BufferLineCloseRight<cr>", "Buffer close right" },
			},
		}, { prefix = "<leader>" })
	end,
}
