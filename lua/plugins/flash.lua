return {
	"folke/flash.nvim",
	lazy = true,
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash flash",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash Treesitter",
		},
		{
			"f",
			function()
				require("flash").jump({
					search = {
						forward = true,
						wrap = false,
						max_length = 1,
					},
					jump = {
						offset = 0,
					},
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Flash f",
		},
		{
			"F",
			function()
				require("flash").jump({
					search = {
						forward = false,
						wrap = false,
						max_length = 1,
					},
					jump = {
						offset = 0,
					},
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Flash F",
		},
		{
			"t",
			function()
				require("flash").jump({
					search = {
						forward = true,
						wrap = false,
						max_length = 1,
					},
					jump = {
						offset = 1,
					},
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Flash t",
		},
		{
			"T",
			function()
				require("flash").jump({
					search = {
						forward = true,
						wrap = false,
						max_length = 1,
					},
					jump = {
						offset = 1,
					},
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Flash T",
		},
	},
	opts = {
		search = {
			enabled = false,
		},
		char = {
			enabled = false,
		},
	},
}
