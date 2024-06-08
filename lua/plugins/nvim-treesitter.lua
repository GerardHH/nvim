return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = "*",
		build = ":TSUpdate",
		lazy = true,
		event = "VeryLazy",
		opts = {
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			ensure_installed = { "markdown", "markdown_inline" }, -- Used by Lspsaga
			auto_install = true,
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		version = "*",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = true,
		event = "VeryLazy",
		opts = {
			indent = {
				char = "",
				highlight = {
					"RainbowRed",
					"RainbowYellow",
					"RainbowBlue",
					"RainbowOrange",
					"RainbowGreen",
					"RainbowViolet",
					"RainbowCyan",
				},
			},
		},
	},
}
