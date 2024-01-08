return {
	"folke/flash.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{
			"<leader>ff",
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
	},
}
