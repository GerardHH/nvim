return {
	"okuuva/auto-save.nvim",
	version = "*",
	lazy = true,
	cmd = "ASToggle",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		-- BUG : Something is using mode `niI` when new-lining a `{}` in Lua (perhaps other languages as well).
		-- This would trigger the auto save and more importantly the auto-formatter.
		condition = function()
			local mode = vim.api.nvim_get_mode().mode
			return mode ~= "niI"
		end,
		debounce_delay = 2000,
	},
}
