return {
	"smoka7/hop.nvim",
	tag = "*",
	lazy = true,
	keys = {
		{
			"<leader>jj",
			"<CMD>HopCamelCase<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump word",
		},
		{
			"<leader>jl",
			"<CMD>HopLine<CR>",
			mode = { "n", "x", "o" },
			desc = "Jump line",
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
			desc = "Hop F implementation",
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
			desc = "Hop f implementation",
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
			desc = "Hop t implementation",
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
			desc = "Hop t implementation",
		},
	},
	opts = {
		multi_windows = true,
	},
}
-- testTest
-- test_test
-- TestTest
