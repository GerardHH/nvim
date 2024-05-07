return {
	"rolv-apneseth/tfm.nvim",
	version = "*",
	lazy = false,
	keys = {
		{ "<leader>ve", function() require("tfm").open() end, desc = "View explorer (tfm)" },
	},
	opts = {
		file_manager = "yazi",
		replace_netrw = true,
	},
}
