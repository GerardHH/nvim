local M = {}

function M.decorate_config(config)
	config.settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				},
			},
		},
	}
	return config
end

return M
