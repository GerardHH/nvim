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
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function() require("telescope").load_extension("ui-select") end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{
				"<leader>ve",
				"<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>",
				desc = "View explorer (telescope-file-browser)",
			},
		},
		opts = {
			follow_symlinks = true,
			hidden = true,
			hijack_netrw = true,
			respect_gitignore = false,
		},
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					file_browser = opts,
				},
			})

			telescope.load_extension("file_browser")
		end,
	},
	{
		"debugloop/telescope-undo.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<leader>fu", "<CMD>Telescope undo<CR>", desc = "Find undo" },
		},
		opts = {},
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					undo = opts,
				},
			})

			telescope.load_extension("undo")
		end,
	},
	{
		"gbrlsnchs/telescope-lsp-handlers.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		lazy = true,
		config = function() require("telescope").load_extension("lsp_handlers") end,
	},
}
