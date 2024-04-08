return {
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
}
