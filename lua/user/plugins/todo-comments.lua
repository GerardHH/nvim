return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	config = function()
		require("todo-comments").setup({
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]], -- vim regex
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			},
		})

		require("telescope").load_extension("todo-comments")
	end,
}
