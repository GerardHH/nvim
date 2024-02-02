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
					illuminate = { enabled = true },
					lsp_trouble = true,
					mason = true,
					noice = true,
					notify = true,
					telescope = { enabled = true },
					treesitter = true,
					which_key = true,
					rainbow_delimiters = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
