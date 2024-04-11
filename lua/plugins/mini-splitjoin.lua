return {
	"echasnovski/mini.splitjoin",
	version = "*",
	lazy = true,
	keys = {
		{ "<leader>~", function() MiniSplitjoin.toggle() end, desc = "Split/Join arguments" },
	},
	opts = {
		mappings = {
			toggle = "",
		},
	},
}
