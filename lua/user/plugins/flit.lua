return {
	"ggandor/flit.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"ggandor/leap.nvim",
	},
	config = true,
}
