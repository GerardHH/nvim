local parsers = {
	"bash",
	"c",
	"cmake",
	"cpp",
	"diff",
	"dockerfile",
	"doxygen",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"json",
	"kdl",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	lazy = true,
	ft = parsers,
	opts = {
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		ensure_installed = parsers,
		auto_install = true,
	},
}
