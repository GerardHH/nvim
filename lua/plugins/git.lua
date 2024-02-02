return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			-- Git Toggle
			{ "<leader>gtb", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Git Toggle current line blame" },
			{ "<leader>gtd", "<CMD>Gitsigns toggle_deleted<CR>", desc = "Git Toggle deleted" },
			-- Git Hunk
			{ "<leader>ghP", "<CMD>Gitsigns preview_hunk<CR>", desc = "Git Hunk preview" },
			{ "<leader>ghR", "<CMD>Gitsigns reset_buffer<CR>", desc = "Git Hunk reset buffer" },
			{ "<leader>ghS", "<CMD>Gitsigns stage_buffer<CR>", desc = "Git Hunk stage buffer" },
			{ "<leader>ghn", "<CMD>Gitsigns next_hunk<CR>", desc = "Git Hunk next" },
			{ "<leader>ghp", "<CMD>Gitsigns prev_hunk<CR>", desc = "Git Hunk previous" },
			{ "<leader>ghr", "<CMD>Gitsigns reset_hunk<CR>", desc = "Git Hunk reset" },
			{ "<leader>ghs", "<CMD>Gitsigns stage_hunk<CR>", desc = "Git Hunk stage" },
			{ "<leader>ghu", "<CMD>Gitsigns undo_stage_hunk<CR>", desc = "Git Hunk undo stage hunk" },
		},
		config = true,
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		keys = {
			{ "<leader>gg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
		},
	},
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		keys = {
			{ "<leader>gdd", "<CMD>DiffviewOpen<CR>", desc = "Git Diff open diff" },
			{ "<leader>gdc", "<CMD>DiffviewClose<CR>", desc = "Git Diff close diff" },
			{ "<leader>gdf", "<CMD>DiffviewFileHistory<CR>", desc = "Git Diff file history" },
		},
	},
	{
		"akinsho/git-conflict.nvim",
		lazy = true,
		keys = {
			{ "<leader>gcN", "<CMD>GitConflictChooseNone<CR>", desc = "Git Conflict none" },
			{ "<leader>gcb", "<CMD>GitConflictChooseBoth<CR>", desc = "Git Conflict both" },
			{ "<leader>gcn", "<CMD>GitConflictNextConflict<CR>", desc = "Git Conflict next" },
			{ "<leader>gco", "<CMD>GitConflictChooseOurs<CR>", desc = "Git Conflict ours" },
			{ "<leader>gcp", "<CMD>GitConflictPrevConflict<CR>", desc = "Git Conflict previous" },
			{ "<leader>gcq", "<CMD>GitConflictListQf<CR>", desc = "Git Conflict quickfix list" },
			{ "<leader>gct", "<CMD>GitConflictChooseTheirs<CR>", desc = "Git Conflict theirs" },
		},
	},
}
