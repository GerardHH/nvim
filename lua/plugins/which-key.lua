return {
	"folke/which-key.nvim",
	main = "which-key",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
	end,
	lazy = true,
	keys = "<leader>",
	opts = {
		operators = {}, -- Disable gc
	},
	config = function(_, opts)
		local which_key = require("which-key")

		which_key.setup(opts)

		which_key.register({
			D = { name = "Debug" },
			H = { name = "Highlight" },
			S = { name = "Session" },
			b = { name = "Buffer" },
			c = { name = "Comment" },
			d = { name = "Diagnostics" },
			f = { name = "Find" },
			g = {
				name = "Git",
				c = { name = "Conflict" },
				d = { name = "Diff" },
				h = { name = "Hunk" },
				t = { name = "Toggle" },
				n = { name = "Next" },
				p = { name = "Previous" },
			},
			h = { name = "Harpoon" },
			l = { name = "LSP", g = { name = "LSP go to" }, l = { name = "LSP list" } },
			n = { name = "Neogen" },
			r = { name = "Recorder" },
			s = { name = "Surround" },
			v = { name = "View", S = { name = "Spectre (search&replace)" }, s = { name = "Split" } },
		}, { mode = { "n", "v", "o", "x" }, prefix = "<leader>" })
	end,
}
