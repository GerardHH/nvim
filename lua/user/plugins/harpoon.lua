return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { "nvim-lua/plenary.nvim" },
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
	end,
}
