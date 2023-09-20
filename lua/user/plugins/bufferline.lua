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
				c = { "<cmd>BufferLinePickClose<cr>", "Buffer pick Close" },
				l = { "<cmd>BufferLineCloseLeft<cr>", "Buffer close Left" },
				o = { "<cmd>BufferLineCloseOthers<cr>", "Buffer close Others" },
				p = { "<cmd>BufferLinePick<cr>", "Buffer Pick open" },
				r = { "<cmd>BufferLineCloseRight<cr>", "Buffer close Right" },
			},
		}, { prefix = "<leader>" })
	end,
}
