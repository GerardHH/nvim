return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					alpha = true,
					cmp = true,
					dap = true,
					dap_ui = true,
					flash = true,
					gitsigns = true,
					harpoon = true,
					illuminate = true,
					lsp_trouble = true,
					mason = true,
					noice = true,
					notify = true,
					rainbow_delimiters = true,
					telescope = { enabled = true },
					treesitter = true,
					which_key = true,
					indent_blankline = { enabled = true, colored_indent_levels = true },
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
