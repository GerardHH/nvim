return {
	"akinsho/bufferline.nvim",
	main = "bufferline",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin/nvim",
	},
	lazy = false,
	opts = {},
	config = function(pkg, opts)
		opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
		require(pkg.main).setup(opts)
	end,
}
