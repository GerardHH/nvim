return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	lazy = true,
	keys = {
		{ "<leader>sc", "<Plug>(nvim-surround-change)", desc = "Surround change" },
		{ "<leader>sd", "<Plug>(nvim-surround-delete)", desc = "Surround delete" },
		{ "<leader>sl", "<Plug>(nvim-surround-normal-cur)", desc = "Surround line" },
		{ "<leader>ss", "<Plug>(nvim-surround-normal)", desc = "Surround surround" },
		-- Visual
		{ "<leader>s", "<Plug>(nvim-surround-visual)", desc = "Surround visual", mode = "x" },
	},
	opts = {
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
	},
}
