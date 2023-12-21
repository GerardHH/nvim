return {
	"nvim-telescope/telescope-file-browser.nvim",
	lazy = true,
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("telescope").setup({
			extensions = {
				file_browser = {
					follow_symlinks = true,
					hidden = true,
					hijack_netrw = true,
					respect_gitignore = false,
				},
			},
		})

		require("telescope").load_extension("file_browser")
	end,
}
