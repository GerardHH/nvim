return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	lazy = true,
	---@diagnostic disable:missing-fields
	config = function()
		require("harpoon").setup({
			config = {
				settings = {
					sync_on_ui_close = true,
				},
			},
		})
		---@diagnostic enable:missing-fields

		require("telescope").load_extension("harpoon")
	end,
}