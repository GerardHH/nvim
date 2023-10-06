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
			t = {
				name = "Telescope",
				c = { "<cmd>Telescope grep_string<CR>", "Telescope current word" },
				d = { "<cmd>Telescope diagnostics<CR>", "Telescope diagnostics" },
				f = { "<cmd>Telescope find_files<CR>", "Telescope file" },
				g = { "<cmd>Telescope git_files<CR>", "Telescope git files" },
				h = { "<cmd>Telescope help_tags<CR>", "Telescope help" },
				k = { "<cmd>Telescope keymaps<CR>", "Telescope keymaps" },
				r = { "<cmd>Telescope oldfiles<CR>", "Telescope recent file" },
				s = { "<cmd>Telescope live_grep<CR>", "Telescope string" },
				n = { "<cmd>Telescope notify<CR>", "Telescope notifycations" },
			},
		}, { prefix = "<leader>" })
	end,
}
