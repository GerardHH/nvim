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
	config = function(pkg, opts)
		require(pkg.main).setup(opts)

		require("telescope").load_extension("todo-comments")
	end,
}
