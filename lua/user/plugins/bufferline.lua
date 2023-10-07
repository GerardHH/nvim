return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
	version = "*",
	config = function()
		---@diagnostic disable:missing-fields
		require("bufferline").setup({
			highlights = {},
			options = {
				close_command = "Bdelete! %d",
				right_mouse_command = "Bdelete! %d",
			},
		})
		---@diagnostic enable:missing-fields
	end,
}
