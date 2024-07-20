return {
	"okuuva/auto-save.nvim",
	version = "*",
	lazy = true,
	cmd = "ASToggle",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		execution_message = {
			message = function() return "AutoSave: " .. vim.api.nvim_buf_get_name(0) end,
		},
		debounce_delay = 500,
	},
}
