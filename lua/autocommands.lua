local augroup = vim.api.nvim_create_augroup
local group = augroup("user", {})

local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing whitespaces on save
autocmd({ "BufWritePre" }, {
	group = group,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

-- Highlight yanked symbols
autocmd({ "TextYankPost" }, {
	group = group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})
