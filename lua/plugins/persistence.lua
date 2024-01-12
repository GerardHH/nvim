return {
	"folke/persistence.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>Ss",
			"<CMD>lua require('persistence').load()<CR>",
			mode = "n",
			desc = "Session restore for current directory",
		},
		{
			"<leader>Sl",
			"<CMD>lua require('persistence').load({ last = true })<CR>",
			mode = "n",
			desc = "Session restore last session",
		},
		{
			"<leader>Sd",
			"<CMD>lua require('persistence').stop()<CR>",
			mode = "n",
			desc = "Session stop, session won't be saved on exit",
		},
	},
	opts = {},
}
