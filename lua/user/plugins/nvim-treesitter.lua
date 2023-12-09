return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			---@diagnostic disable:missing-fields
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
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
				},
				-- auto install above language parsers
				auto_install = true,
			})
			---@diagnostic enable:missing-fields
		end,
	},
}
