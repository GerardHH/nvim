local jump_color = require("catppuccin.palettes.mocha").sky

return {
	{
		"echasnovski/mini.jump",
		version = "*",
		lazy = true,
		keys = {
			{ "f", mode = { "n", "x", "o" }, desc = "Find char forward or continue forwards. Ends cursor on result" },
			{
				"F",
				mode = { "n", "x", "o" },
				desc = "Find char backwards or continue backwards. Ends cursor on result",
			},
			{
				"t",
				mode = { "n", "x", "o" },
				desc = "Find char forward or continue forwards. Ends cursor before result",
			},
			{
				"T",
				mode = { "n", "x", "o" },
				desc = "Find char backwards or continue backwards. Ends cursor before result",
			},
		},
		opts = {},
		config = function(pkg, opts)
			require(pkg.name).setup(opts)
			vim.cmd(string.format("highlight MiniJump cterm=standout gui=standout guifg=%s guibg=NONE", jump_color))
		end,
	},
	{
		"echasnovski/mini.jump2d",
		version = "*",
		lazy = true,
		keys = {
			"<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump to any word/line (mini.jump2d)",
		},
		opts = {
			view = {
				dim = true,
			},
		},
		config = function(pkg, opts)
			require(pkg.name).setup(opts)
			vim.cmd(string.format("highlight MiniJump2dSpot cterm=bold gui=bold guifg=%s guibg=NONE", jump_color))
		end,
	},
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
			{ "<leader>or", mode = { "v", "x" }, desc = "Replace with register (mini.operators)" },
			{ "<leader>os", mode = { "v", "x" }, desc = "Sort (mini.operators)" },
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
