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
	config = function(_, opts)
		local which_key = require("which-key")

		which_key.setup(opts)

		which_key.register({
			D = { name = "Debug" },
			S = { name = "Session" },
			b = { name = "Buffer" },
			c = { name = "Comment" },
			f = { name = "Find" },
			g = { name = "Git", h = { name = "Hunk" }, t = { name = "Toggle" } },
			h = { name = "Highlight" },
			l = { name = "LSP", d = { name = "Diagnostic" }, g = { name = "Go to" }, p = { name = "Peek" } },
			m = { name = "Bookmark" },
			r = { name = "Recorder" },
			s = { name = "Surround" },
			t = { name = "Telescope" },
			v = { name = "View", s = { name = "Split" } },
		}, { mode = { "n", "v", "o", "x" }, prefix = "<leader>" })
	end,
}
