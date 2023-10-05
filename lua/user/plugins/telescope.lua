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

		require("which-key").register({
			s = {
				name = "Search",
				c = { "<cmd>Telescope grep_string<CR>", "Search current word" },
				d = { "<cmd>Telescope diagnostics<CR>", "Search diagnostics" },
				f = { "<cmd>Telescope find_files<CR>", "Search file" },
				g = { "<cmd>Telescope git_files<CR>", "Search git files" },
				h = { "<cmd>Telescope help_tags<CR>", "Search help" },
				k = { "<cmd>Telescope keymaps<CR>", "Search keymaps" },
				r = { "<cmd>Telescope oldfiles<CR>", "Search recent file" },
				s = { "<cmd>Telescope live_grep<CR>", "Search string" },
				n = { "<cmd>Telescope notify<CR>", "Search notifycations" },
			},
		}, { prefix = "<leader>" })
	end,
}
