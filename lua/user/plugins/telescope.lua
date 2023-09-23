return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/which-key.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		local wk = require("which-key")
		wk.register({
			s = {
				name = "Search",
				c = { "<cmd>Telescope grep_string<cr>", "Search current word" },
				d = { "<cmd>Telescope diagnostics<cr>", "Search diagnostics" },
				f = { "<cmd>Telescope find_files<cr>", "Search file" },
				g = { "<cmd>Telescope git_files<cr>", "Search git files" },
				h = { "<cmd>Telescope help_tags<cr>", "Search help" },
				k = { "<cmd>Telescope keymaps<cr>", "Search keymaps" },
				r = { "<cmd>Telescope oldfiles<cr>", "Search recent file" },
				s = { "<cmd>Telescope live_grep<cr>", "Search string" },
			},
		}, { prefix = "<leader>" })
	end,
}
