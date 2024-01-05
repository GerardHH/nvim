return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	opts = {
		config = {
			settings = {
				sync_on_ui_close = true,
			},
		},
	},
	config = function(_, opts)
		require("harpoon").setup(opts)

		require("telescope").load_extension("harpoon")
	end,
}
