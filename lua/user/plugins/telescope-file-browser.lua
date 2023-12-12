return {
	"nvim-telescope/telescope-file-browser.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					hijack_netrw = true,
					hidden = true,
				},
			},
		})
	end,
}
