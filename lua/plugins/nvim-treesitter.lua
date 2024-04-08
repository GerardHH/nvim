return {
	"nvim-treesitter/nvim-treesitter",
	version = "*",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	lazy = false,
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		ensure_installed = { "markdown", "markdown_inline" }, -- Used by Lspsaga
		auto_install = true,
	},
}
