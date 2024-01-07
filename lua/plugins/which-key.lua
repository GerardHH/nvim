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
			b = { name = "Buffer" },
			c = { name = "Comment" },
			d = { name = "Diagnostics" },
			f = { name = "Flash" },
			h = { name = "Harpoon" },
			l = { name = "LSP", g = { name = "LSP go to" }, l = { name = "LSP list" } },
			r = { name = "Recorder" },
			s = { name = "Surround" },
			t = { name = "Telescope" },
			v = { name = "View", S = { name = "Spectre (search&replace)" }, s = { name = "Split" } },
		}, { mode = { "n", "v", "o", "x" }, prefix = "<leader>" })
	end,
}
