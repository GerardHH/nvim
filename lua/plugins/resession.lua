return {
	"stevearc/resession.nvim",
	version = "*",
	lazy = false,
	keys = {
		{ "<leader>Ss", function() require("resession").save() end, desc = "Session save" },
		{ "<leader>Sl", function() require("resession").load() end, desc = "Session load" },
		{ "<leader>Sd", function() require("resession").delete() end, desc = "Session delete" },
	},
	opts = {},
	config = function(opts)
		local resession = require("resession")

		resession.setup(opts)

		local function get_session_name()
			local name = vim.fn.getcwd()
			local branch = vim.trim(vim.fn.system("git branch --show-current"))
			if vim.v.shell_error == 0 then
				return name .. branch
			else
				return name
			end
		end
		local ressesion_group = vim.api.nvim_create_augroup("ressesion_group", { clear = true })
		vim.api.nvim_create_autocmd("VimEnter", {
			group = ressesion_group,
			pattern = "*",
			callback = function()
				-- Only load the session if nvim was started with no args
				if vim.fn.argc(-1) == 0 then
					resession.load(get_session_name(), { dir = "dirsession", silence_errors = true })
				end
			end,
		})
		vim.api.nvim_create_autocmd("VimLeavePre", {
			group = ressesion_group,
			pattern = "*",
			callback = function() resession.save(get_session_name(), { dir = "dirsession", notify = false }) end,
		})
	end,
}
