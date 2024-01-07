return {
	"folke/flash.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{
			"<leaderff",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash flash",
		},
		{
			"<leader>fF",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"<leader>fr",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Flash remote",
		},
		{
			"<leader>fR",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash treesitter search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
	},
}
