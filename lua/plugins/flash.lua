return {
	"folke/flash.nvim",
	lazy = true,
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
		{
			"S",
			mode = { "n", "x", "o" },
			function() require("flash").treesitter() end,
			desc = "Flash treesitter jump",
		},
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Flash remote" },
		{
			"R",
			mode = { "o", "x" },
			function() require("flash").treesitter_search() end,
			desc = "Flash treesitter Search",
		},
	},
	opts = {
		modes = {
			char = {
				enabled = false,
			},
		},
	},
}
