return {
	"rmagatti/session-lens",
	event = "VeryLazy",
	dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
	config = function()
		require("session-lens").setup({})
	end,
}
