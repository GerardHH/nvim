return {
	"j-morano/buffer_manager.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
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
		select_menu_item_commands = {
			v = {
				key = "/",
				command = "vsplit",
			},
			h = {
				key = "-",
				command = "split",
			},
		},
		short_file_names = true,
	},
}
