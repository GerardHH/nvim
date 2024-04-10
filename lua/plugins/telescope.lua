return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		keys = {
			{ "<leader>fC", "<CMD>Telescope commands<CR>", desc = "Find plugin/user commands" },
			{ "<leader>fH", "<CMD>Telescope command_history<CR>", desc = "Find command history" },
			{ "<leader>fR", "<CMD>Telescope registers<CR>", desc = "Find registers" },
			{ "<leader>fS", "<CMD>Telescope spell_suggest<CR>", desc = "Find spelling suggestion" },
			{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Find buffers" },
			{ "<leader>fc", "<CMD>Telescope grep_string<CR>", desc = "Find current word" },
			{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find find files" },
			{ "<leader>fh", "<CMD>Telescope search_history<CR>", desc = "Find search history" },
			{ "<leader>fj", "<CMD>Telescope jumplist<CR>", desc = "Find jumplist" },
			{ "<leader>fk", "<CMD>Telescope keymaps<CR>", desc = "Find keymaps" },
			{ "<leader>fo", "<CMD>Telescope oldfiles<CR>", desc = "Find recent file" },
			{ "<leader>fr", "<CMD>Telescope resume<CR>", desc = "Find resume" },
			{ "<leader>fs", "<CMD>Telescope live_grep<CR>", desc = "Find string" },
			{ "<leader>ft", "<CMD>Telescope help_tags<CR>", desc = "Find help tags" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.providers.telescope")

			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						width = { padding = 0 },
						height = { padding = 0 },
						preview_height = 0.60,
					},
					path_display = { "truncate " },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = trouble.open_with_trouble,
						},
						n = {
							["q"] = trouble.open_with_trouble,
						},
					},
				},
				pickers = {
					buffers = {
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["d"] = actions.delete_buffer,
							},
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},
}
