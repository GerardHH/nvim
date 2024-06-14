return {
	"okuuva/auto-save.nvim",
	version = "*",
	layz = true,
	cmd = "ASToggle",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		execution_message = {
			message = function() return "AutoSave: " .. vim.api.nvim_buf_get_name(0) end,
		},
		debounce_delay = 500,
	},
}
