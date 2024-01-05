return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.providers.telescope")
			telescope.setup({
				defaults = {
					layout_strategy = "flex",
					layout_config = {
						width = { padding = 0 },
						height = { padding = 0 },
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
			})

			telescope.load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		opts = {
			follow_symlinks = true,
			hidden = true,
			hijack_netrw = true,
			respect_gitignore = false,
		},
		config = function(_, opts)
			require("telescope").setup({
				extensions = {
					file_browser = opts,
				},
			})

			require("telescope").load_extension("file_browser")
		end,
	},
}
