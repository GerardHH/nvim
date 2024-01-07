return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	keys = {
		{
			"<leader>vSC",
			function()
				require("spectre").open_file_search({ select_word = true })
			end,
			desc = "Spectre search current word in current file",
		},
		{
			"<leader>vSc",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Spectre search current word",
		},
		{
			"<leader>vSO",
			function()
				require("spectre").open_file_search()
			end,
			desc = "Spectre search current word in current file",
		},
		{
			"<leader>vSo",
			function()
				require("spectre").open_visual()
			end,
			desc = "Spectre search current word",
		},
		{
			"<leader>vSt",
			function()
				require("spectre").toggle()
			end,
			desc = "Spectre toggle",
		},
	},
}
