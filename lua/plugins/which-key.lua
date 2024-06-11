return {
	"folke/which-key.nvim",
	main = "which-key",
	version = "*",
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

		which_key.register({
			C = { name = "Quickfix" },
			D = { name = "Debug" },
			S = { name = "Session" },
			b = { name = "Buffer" },
			f = { name = "FZF" },
			g = { name = "Git", c = { name = "Conflict" }, h = { name = "Hunk" }, t = { name = "Toggle" } },
			h = { name = "Highlight" },
			l = { name = "LSP", d = { name = "Diagnostic" }, g = { name = "Go to" }, p = { name = "Peek" } },
			m = { name = "Bookmark" },
			n = { name = "Noice" },
			o = { name = "Operator" },
			v = { name = "View", s = { name = "Split" } },
		}, { mode = { "n", "v", "o", "x" }, prefix = "<leader>" })
	end,
}
