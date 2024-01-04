return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	lazy = true,
	config = function()
		---@diagnostic disable:missing-fields
		require("nvim-surround").setup({
			keymaps = {
				insert = false,
				insert_line = false,
				normal = false,
				normal_cur = false,
				normal_line = false,
				normal_cur_line = false,
				visual = false,
				visual_line = false,
				delete = false,
				change = false,
				change_line = false,
			}, -- Let which-key define these
		})
		---@diagnostic enable:missing-fields
	end,
}
