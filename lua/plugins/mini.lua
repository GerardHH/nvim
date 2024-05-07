return {
	{
		"echasnovski/mini.move",
		version = "*",
		lazy = true,
		keys = {
			{ "<M-h>", mode = { "n", "x" }, desc = "Indent line/selection left (mini.move)" },
			{ "<M-l>", mode = { "n", "x" }, desc = "Indent line/selection right (mini.move)" },
			{ "<M-j>", mode = { "n", "x" }, desc = "Move line/selection down (mini.move)" },
			{ "<M-k>", mode = { "n", "x" }, desc = "Move line/selection up (mini.move)" },
		},
		opts = {},
	},
	{
		"echasnovski/mini.operators",
		version = "*",
		lazy = true,
		keys = {
			{ "<leader>or", mode = "x", desc = "Replace with register (mini.operators)" },
			{ "<leader>os", mode = "x", desc = "Sort (mini.operators)" },
		},
		opts = {
			evaluate = {
				prefix = "",
			},
			exchange = {
				prefix = "",
			},
			multiply = {
				prefix = "",
			},
			replace = {
				prefix = "<leader>or",
			},
			sort = {
				prefix = "<leader>os",
			},
		},
	},
	{
		"echasnovski/mini.pairs",
		version = "*",
		lazy = true,
		keys = {
			{ "(", mode = "i", desc = "Auto close pair (mini.pairs)" },
			{ "[", mode = "i", desc = "Auto close pair (mini.pairs)" },
			{ "{", mode = "i", desc = "Auto close pair (mini.pairs)" },
			{ ")", mode = "i", desc = "Skip over if paired (mini.pairs)" },
			{ "]", mode = "i", desc = "Skip over if paired (mini.pairs)" },
			{ "}", mode = "i", desc = "Skip over if paired (mini.pairs)" },
			{ '"', mode = "i", desc = "Auto close pair & skip over if paired (mini.pairs)" },
			{ "'", mode = "i", desc = "Auto close pair & skip over if paired (mini.pairs)" },
			{ "`", mode = "i", desc = "Auto close pair & skip over if paired (mini.pairs)" },
		},
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		version = "*",
		lazy = true,
		keys = {
			{ "<leader>~", desc = "Split/Join arguments (mini.splitjoin)" },
		},
		opts = {
			mappings = {
				toggle = "<leader>~",
			},
		},
	},
}
