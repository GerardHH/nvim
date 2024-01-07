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
			-- LSP
			{ "<leader>lgi", "<CMD>telescope lsp_implementations<CR>", desc = "LSP Go to implementations" },
			{ "<leader>lli", "<CMD>Telescope lsp_incoming_calls<CR>", desc = "LSP incoming calls" },
			{ "<leader>llo", "<CMD>Telescope lsp_outgoing_calls<CR>", desc = "LSP outgoing calls" },
			{ "<leader>lls", "<CMD>Telescope lsp_document_symbols<CR>", desc = "LSP symbols" },
			{ "<leader>llw", "<CMD>Telescope lsp_workspace_symbols<CR>", desc = "LSP workspace symbols" },
			-- Telescope
			{ "<leader>tC", "<CMD>Telescope commands<CR>", desc = "Telescope plugin/user commands" },
			{ "<leader>tH", "<CMD>Telescope command_history<CR>", desc = "Telescope command history" },
			{ "<leader>tR", "<CMD>Telescope registers<CR>", desc = "Telescope registers" },
			{ "<leader>tS", "<CMD>Telescope spell_suggest<CR>", desc = "Telescope spelling suggestion" },
			{ "<leader>tb", "<CMD>Telescope buffers<CR>", desc = "Telescope buffers" },
			{ "<leader>tc", "<CMD>Telescope grep_string<CR>", desc = "Telescope current word" },
			{ "<leader>tf", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
			{ "<leader>th", "<CMD>Telescope search_history<CR>", desc = "Telescope search history" },
			{ "<leader>tj", "<CMD>Telescope jumplist<CR>", desc = "Telescope jumplist" },
			{ "<leader>tk", "<CMD>Telescope keymaps<CR>", desc = "Telescope keymaps" },
			{ "<leader>to", "<CMD>Telescope oldfiles<CR>", desc = "Telescope recent file" },
			{ "<leader>tr", "<CMD>Telescope resume<CR>", desc = "Telescope resume" },
			{ "<leader>ts", "<CMD>Telescope live_grep<CR>", desc = "Telescope string" },
			{ "<leader>tt", "<CMD>Telescope help_tags<CR>", desc = "Telescope help tags" },
		},
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
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		lazy = true,
		keys = {
			{ "<leader>ve", "<CMD>Telescope file_browser<CR>", desc = "View explorer (telescope-file-browser)" },
		},
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
