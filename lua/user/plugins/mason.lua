return {
	{
		"williamboman/mason.nvim",
		-- Mason acts as entry point for code files and depends other plugins that should start too.
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Linting and formatting
			"nvimtools/none-ls.nvim",

			-- Mason only plugins
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Plugins depending on LSP
			"utilyre/barbecue.nvim",
			"SmiteshP/nvim-navbuddy",
		},
		lazy = true,
		ft = { "c", "cpp", "shell", "lua", "markdown", "python" },
		config = function()
			-- Mason itself
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- LSP's
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls", -- shell
					"clangd", -- c/c++
					"lua_ls", -- lua
					"marksman", -- markdown
					"pyright", -- python
				},
				automatic_installation = true,
			})

			-- Formatters and Linters
			require("mason-tool-installer").setup({
				ensure_installed = {
					"beautysh", -- shell formatter
					"black", -- python formatter
					"clang-format", -- c/c++ formatter
					"mypy", -- python static analyzer
					"ruff", -- python linter
					"stylua", -- lua formatter
				},
			})

			-- Debuggers
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"python", -- python
				},
				automatic_installation = true,
			})
		end,
	},
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"folke/neodev.nvim",
			"SmiteshP/nvim-navic",
		},
		lazy = true,
		config = function()
			local lspconfig = require("lspconfig")

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					require("nvim-navic").attach(client, bufnr)
				end
			end

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			require("neodev").setup({})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						completion = {
							callSnipper = "Replace",
						},
					},
				},
			})
			lspconfig["bashls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["clangd"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = {
					"clangd",
					"--compile-commands-dir=/home/gerard/salsa_ws/unittest/build/",
					"--offset-encoding=utf-16",
				},
			})
			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})
		end,
	},
	-- Linting & Formatting
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = true,
		config = function()
			local lsp_formatting = function(bufnr)
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(client)
						-- apply whatever logic you want (in this example, we'll only use null-ls)
						return client.name == "null-ls"
					end,
					timeout_ms = 2000,
				})
			end

			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.completion.spell, -- spelling
					null_ls.builtins.diagnostics.mypy, -- python
					null_ls.builtins.diagnostics.ruff, -- python
					null_ls.builtins.formatting.beautysh, -- shell
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.clang_format, -- c/c++
					null_ls.builtins.formatting.stylua, -- lua
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								lsp_formatting(bufnr)
							end,
						})
					end
				end,
			})
		end,
	},
	-- DAP
	{
		"mfussenegger/nvim-dap",
		-- Gets depended on by specific DAP configs
		lazy = true,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		-- Gets depended on by specific DAP configs
		lazy = true,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		lazy = true,
		ft = "python",
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	-- Others
	{
		"utilyre/barbecue.nvim",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = true,
		config = function()
			require("barbecue").setup({
				attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
			})
		end,
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		lazy = true,
		opts = { lsp = { auto_attach = true } },
	},
}
