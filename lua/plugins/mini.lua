return {
	{
		"echasnovski/mini.files",
		version = "*",
		init = function()
			local mini_files_netrw_hijack = vim.api.nvim_create_augroup("mini-files-netrw-hijack", { clear = true })
			vim.api.nvim_create_autocmd("VimEnter", {
				group = mini_files_netrw_hijack,
				pattern = "*",
				callback = function()
					-- if vim is being opened with a existing path, force mini.files load
					if vim.fn.isdirectory(vim.fn.expand("%:p")) ~= 0 then
						require("mini.files")
						MiniFiles.open()
					end
				end,
			})
		end,
		lazy = true,
		keys = {
			{
				"<leader>ve",
				function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end,
				desc = "View explorer (mini.files)",
			},
		},
		opts = {
			mappings = {
				go_in = "<CR>",
				go_in_plus = "",
				go_out = "<BS>",
				go_out_plus = "",
				reset = "",
				show_help = "?",
			},
			windows = {
				max_number = 2, -- Only show 2 windows side by side
				preview = true, -- Enable preview window
				width_focus = 30,
				width_preview = 80,
			},
		},
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
