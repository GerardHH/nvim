return {
	"numToStr/Comment.nvim",
	version = "*",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	lazy = true,
	keys = {
		{ "<leader>cB", "<Plug>(comment_toggle_blockwise_current)", desc = "Comment blockwise current" },
		{ "<leader>cC", "<Plug>(comment_toggle_linewise_current)", desc = "Comment linewise current" },
		{ "<leader>cb", "<Plug>(comment_toggle_blockwise)", desc = "Comment blockwise motion" },
		{ "<leader>cc", "<Plug>(comment_toggle_linewise)", desc = "Comment linewise motion" },
		-- Visual
		{ "<leader>cb", "<Plug>(comment_toggle_blockwise_visual)", desc = "Comment blockwise", mode = "x" },
		{ "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment linewise", mode = "x" },
	},
	config = function()
		---@diagnostic disable:missing-fields
		require("Comment").setup({
			mappings = false, -- Let which-key define mappings
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})
		---@diagnostic enable:missing-fields
	end,
}
