return {
	"folke/which-key.nvim",
	main = "which-key",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
	end,
	lazy = true,
	keys = "<leader>",
	opts = {
		operators = {}, -- Disable gc
	},
	config = function(pkg, opts)
		local which_key = require(pkg.main)

		which_key.setup(opts)

		which_key.add({
			{
				mode = { "n", "o", "v", "x" },
				{ "<leader>C", group = "Quickfix" },
				{ "<leader>D", group = "Debug" },
				{ "<leader>S", group = "Session" },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>f", group = "FZF" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gc", group = "Git Conflict" },
				{ "<leader>gh", group = "Git Hunk" },
				{ "<leader>gt", group = "Git Toggle" },
				{ "<leader>h", group = "Highlight" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>ld", group = "LSP Diagnostic" },
				{ "<leader>lg", group = "LSP Go to" },
				{ "<leader>lp", group = "LSP Peek" },
				{ "<leader>m", group = "Bookmark" },
				{ "<leader>n", group = "Noice" },
				{ "<leader>o", group = "Operator" },
				{ "<leader>v", group = "View" },
				{ "<leader>vs", group = "View Split" },
			},
		})
	end,
}
