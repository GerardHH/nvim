return {
	"echasnovski/mini.files",
	version = "*",
	init = function()
		local mini_files_netrw_hijack = vim.api.nvim_create_augroup("mini-files-netrw-hijack", { clear = true })
		vim.api.nvim_create_autocmd("VimEnter", {
			group = mini_files_netrw_hijack,
			pattern = "*",
			callback = function()
				-- if vim is being opened with a existing path, force mini.files load
				if vim.fn.isdirectory(vim.fn.expand("%:p")) ~= 0 then
					require("mini.files")
					MiniFiles.open()
				end
			end,
		})
	end,
	lazy = true,
	keys = {
		{
			"<leader>ve",
			function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end,
			desc = "View explorer (mini.files)",
		},
	},
	opts = {
		mappings = {
			show_help = "?",
		},
		windows = {
			max_number = 2, -- Only show 2 windows side by side
			preview = true, -- Enable preview window
			width_focus = 30,
			width_preview = 80,
		},
	},
}
