return {
	"smoka7/hop.nvim",
	version = "*",
	lazy = true,
	keys = {
		{
			"<leader>j",
			"<CMD>HopCamelCase<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump (hop) word",
		},
		{
			"<leader>J",
			"<CMD>HopLineStart<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump (hop) line",
		},
	},
	opts = {
		multi_windows = true,
	},
}
