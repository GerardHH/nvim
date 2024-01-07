return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	keys = {
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon select 1",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon select 2",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon select 3",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon select 4",
		},
		{
			"<leader>ha",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Harpoon append",
		},
		{
			"<leader>hl",
			function()
				require("telescope").extensions.harpoon.marks()
			end,
			desc = "Harpoon list",
		},
		{
			"<leader>hq",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon quick menu",
		},
	},
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
