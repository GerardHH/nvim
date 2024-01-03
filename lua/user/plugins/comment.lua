return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		---@diagnostic disable:missing-fields
		require("Comment").setup({
			mappings = false, -- Let which-key define mappings
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
		---@diagnostic enable:missing-fields
	end,
}
