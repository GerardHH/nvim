local diffview_actions = function() return require("diffview.actions") end

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
			-- Git Conflict
			{
				"<leader>gcA",
				function() diffview_actions().conflict_choose_all("all") end,
				desc = "Git Conflict all all",
			},
			{
				"<leader>gcB",
				function() diffview_actions().conflict_choose_all("base") end,
				desc = "Git Conflict all base",
			},
			{
				"<leader>gcO",
				function() diffview_actions().conflict_choose_all("ours") end,
				desc = "Git Conflict all ours",
			},
			{
				"<leader>gcT",
				function() diffview_actions().conflict_choose_all("theirs") end,
				desc = "Git Conflict all theirs",
			},
			{
				"<leader>gcX",
				function() diffview_actions().conflict_choose_all("none") end,
				desc = "Git Conflict all none",
			},
			{ "<leader>gca", function() diffview_actions().conflict_choose("all") end, desc = "Git Conflict all" },
			{ "<leader>gcb", function() diffview_actions().conflict_choose("base") end, desc = "Git Conflict base" },
			{ "<leader>gco", function() diffview_actions().conflict_choose("ours") end, desc = "Git Conflict ours" },
			{ "<leader>gcp", function() diffview_actions().prev_conflict() end, desc = "Git Conflict previous" },
			{
				"<leader>gct",
				function() diffview_actions().conflict_choose("theirs") end,
				desc = "Git Conflict theirs",
			},
			{ "<leader>gcx", function() diffview_actions().conflict_choose("none") end, desc = "Git Conflict none" },
			-- Git Diff
			{ "<leader>gdd", "<CMD>DiffviewOpen<CR>", desc = "Git Diff open diff" },
			{ "<leader>gdc", "<CMD>DiffviewClose<CR>", desc = "Git Diff close diff" },
			{ "<leader>gdf", "<CMD>DiffviewFileHistory<CR>", desc = "Git Diff file history" },
			-- Git Next
			{ "<leader>gnc", function() diffview_actions().next_conflict() end, desc = "Git Next conflict" },
			{ "<leader>gne", function() diffview_actions().next_entry() end, desc = "Git Next entry" },
			-- Git Previous
			{ "<leader>gpc", function() diffview_actions().prev_conflict() end, desc = "Git Previous conflict" },
			{ "<leader>gpe", function() diffview_actions().prev_entry() end, desc = "Git Previous entry" },
		},
	},
}
