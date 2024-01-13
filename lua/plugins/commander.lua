return {
	"FeiyouG/commander.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = true,
	keys = {
		{ "<leader><leader>", "<CMD>Telescope commander<CR>", desc = "Search through key's/cmd's" },
	},
	opts = {
		integration = {
			telescope = {
				enable = true,
			},
			lazy = {
				enable = true,
				set_plugin_name_as_cat = true,
			},
		},
	},
}
