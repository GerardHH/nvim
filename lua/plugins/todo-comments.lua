return {
	"folke/todo-comments.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	keys = {
		{ "<leader>fT", "<CMD>TodoTelescope<CR>", desc = "Find todo-comments" },
	},
	opts = {
		highlight = {
			pattern = [[.*<(KEYWORDS)\s*]], -- vim regex
		},
		search = {
			pattern = [[\b(KEYWORDS)\b]],
		},
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		require("telescope").load_extension("todo-comments")
	end,
}
