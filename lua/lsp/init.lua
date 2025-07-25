local M = {}

function register_lspconfig_commands(bufnr, commands)
	for name, def in pairs(commands or {}) do
		vim.api.nvim_buf_create_user_command(bufnr, name, function(args)
			def[1](args) -- def[1] is the function, def[2] is description
		end, def[2] or {})
	end
end

function M.setup()
	local servers = {
		bashls = { filetypes = { "bash", "sh" } },
		clangd = { filetypes = { "c", "cpp" } },
		cmake = { filetypes = { "cmake" } },
		lua_ls = { filetypes = { "lua" } },
		marksman = { filetypes = { "markdown " } },
		pyright = { filetypes = { "python" } },
		ruff = { filetypes = { "python" } },
	}

	for name, config in pairs(servers) do
		vim.api.nvim_create_autocmd("FileType", {
			pattern = config.filetypes,
			-- callback = function() require("lsp." .. name).setup() end,
			callback = function()
				local document_config = require("lspconfig")[name].document_config
				local defaults = document_config.default_config

				local capabilities = require("blink.cmp").get_lsp_capabilities()
				local on_attach = function(client, bufnr)
					if client.server_capabilities["documentSymbolProvider"] then
						require("nvim-navic").attach(client, bufnr)
					end
					register_lspconfig_commands(bufnr, document_config.commands)
				end

				local config = vim.tbl_deep_extend("force", defaults, {
					capabilities = capabilities,
					on_attach = on_attach,
				})

				local ok, module = pcall(require, "lsp." .. name)
				if ok then config = module.decorate_config(config) end
				-- config = require("lsp." .. name).decorate_config(config)

				vim.lsp.start(config)
			end,
		})
	end
end

return M
