return {
	{
		"MattesGroeger/vim-bookmarks",
		version = "*",
		lazy = true,
		event = "VeryLazy",
		keys = {
			{ "<leader>mm", "<CMD>BookmarkToggle<CR>", desc = "Bookmark toggle" },
			{ "<leader>ma", "<CMD>BookmarkAnnotate<CR>", desc = "Bookmark annotate" },
			{ "<leader>mn", "<CMD>BookmarkNext<CR>", desc = "Bookmark next" },
			{ "<leader>mp", "<CMD>BookmarkPrev<CR>", desc = "Bookmark previous" },
			{ "<leader>mq", "<CMD>BookmarkShowAll<CR>", desc = "Bookmark quick fix list" },
			{ "<leader>mc", "<CMD>BookmarkClear<CR>", desc = "Bookmark clear buffer" },
			{ "<leader>mC", "<CMD>BookmarkClearAll<CR>", desc = "Bookmark clear all" },
		},
		config = function()
			vim.g.bookmark_no_default_key_mappings = 1
			vim.g.bookmark_save_per_working_dir = 1
			vim.g.bookmark_disable_ctrlp = 1
		end,
	},
	{
		"tom-anders/telescope-vim-bookmarks.nvim",
		version = "*",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		lazy = true,
		keys = {
			{ "<leader>ml", "<CMD>Telescope vim_bookmarks current_file<CR>", desc = "Bookmark telescope current file" },
			{ "<leader>mL", "<CMD>Telescope vim_bookmarks all<CR>", desc = "Bookmark telescope all" },
		},
		config = function() require("telescope").load_extension("vim_bookmarks") end,
	},
}
