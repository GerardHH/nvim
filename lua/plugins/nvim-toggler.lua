return {
	"nguyenvukhang/nvim-toggler",
	lazy = true,
	keys = {
		{
			"<leader>i",
			function()
				require("nvim-toggler").toggle()
			end,
			desc = "Invert text",
		},
	},
	opts = {
		remove_default_keybinds = true,
		remove_default_inverses = false,
	},
}
