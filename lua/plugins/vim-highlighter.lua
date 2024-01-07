return {
	"azabiong/vim-highlighter",
	lazy = true,
	keys = {
		{ "<leader>H+", "<CMD>Hi +<CR>", desc = "Highlight set" },
		{ "<leader>H-", "<CMD>Hi clear<CR>", desc = "Highlight clear" },
		{ "<leader>HN", "<CMD>Hi><CR>", desc = "Highlight jump next cursor" },
		{ "<leader>HP", "<CMD>Hi<<CR>", desc = "Highlight jump previous cursor" },
		{ "<leader>Ha", "<CMD>Hi ==<CR>", desc = "Highlight all buffers" },
		{ "<leader>He", "<CMD>Hi -<CR>", desc = "Highlight erase" },
		{ "<leader>Hn", "<CMD>Hi}<CR>", desc = "Highlight jump next any" },
		{ "<leader>Hp", "<CMD>Hi{<CR>", desc = "Highlight jump previous any" },
		{ "<leader>Hs", "<CMD>Hi =<CR>", desc = "Highlight single buffer" },
	},
}
