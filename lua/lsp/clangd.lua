local M = {}

function M.decorate_config(config)
	print(vim.inspect(config))
	config.cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	}
	print(vim.inspect(config))
	return config
end

return M
