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
					"lua",
					"markdown",
					"markdown_inline",
					"vim",
					"vimdoc",
					"yaml",
					"json",
					"make",
					"python",
					"xml",
				},
				-- auto install above language parsers
				auto_install = true,
			})
			---@diagnostic enable:missing-fields
		end,
	},
}
