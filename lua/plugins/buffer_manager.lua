return {
	"j-morano/buffer_manager.nvim",
	version = "*",
	lazy = true,
	keys = {
		{ "<leader>B", "<CMD>bdelete %<CR>", desc = "Delete current buffer" },
		{
			"<leader>b",
			function() require("buffer_manager.ui").toggle_quick_menu() end,
			desc = "Buffer manager",
		},
		{ "H", function() require("buffer_manager.ui").nav_prev() end, desc = "Previous buffer" },
		{ "L", function() require("buffer_manager.ui").nav_next() end, desc = "Next buffer" },
	},
	opts = {
		short_file_names = true,
	},
}
