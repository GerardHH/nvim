return {
	{
		"catppuccin/nvim",
		version = "*",
		name = "catppuccin",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				integrations = {
					cmp = true,
					dap = true,
					dap_ui = true,
					flash = true,
					gitsigns = true,
					hop = true,
					illuminate = true,
					indent_blankline = { enabled = true, colored_indent_levels = true },
					lsp_saga = true,
					lsp_trouble = true,
					mason = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
						inlay_hints = {
							background = true,
						},
					},
					noice = true,
					notify = true,
					rainbow_delimiters = true,
					telescope = { enabled = true },
					treesitter = true,
					which_key = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
