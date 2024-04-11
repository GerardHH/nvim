return {
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gr", "<CMD>Gitsigns refresh<CR>", desc = "Git refresh (gitsigns)" },
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
		opts = {},
	},
	{
		"kdheepak/lazygit.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		keys = {
			{ "<leader>gg", "<CMD>LazyGit<CR>", desc = "LazyGit" },
		},
		config = function() vim.g.lazygit_floating_window_scaling_factor = 1 end,
	},
}
