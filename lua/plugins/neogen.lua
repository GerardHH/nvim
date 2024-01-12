return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	lazy = true,
	keys = {
		{ "<leader>nn", "<CMD>Neogen<CR>", desc = "Neogen generate" },
		{ "<leader>nc", "<CMD>Neogen class<CR>", desc = "Neogen class" },
		{ "<leader>nf", "<CMD>Neogen func<CR>", desc = "Neogen function" },
		{ "<leader>nt", "<CMD>Neogen type<CR>", desc = "Neogen type" },
	},
	opts = {
		snippet_engine = "luasnip",
	},
}
