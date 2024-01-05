return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
	version = "*",
	opts = {
		highlights = {},
		options = {
			close_command = "Bdelete! %d",
			right_mouse_command = "Bdelete! %d",
		},
	},
}
