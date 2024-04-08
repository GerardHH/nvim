return {
	"smoka7/hop.nvim",
	version = "*",
	lazy = true,
	keys = {
		{
			"<leader>j",
			"<CMD>HopCamelCase<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump (hop) word",
		},
		{
			"<leader>J",
			"<CMD>HopLine<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump (hop) line",
		},
		{
			"F",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Hop F",
		},
		{
			"f",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Hop f",
		},
		{
			"T",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Hop t",
		},
		{
			"t",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR,
					current_line_only = true,
					hint_offset = -1,
				})
			end,
			mode = { "n", "x", "o" },
			desc = "Hop t",
		},
	},
	opts = {
		multi_windows = true,
	},
}
