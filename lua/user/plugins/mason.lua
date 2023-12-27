return {
	{
		"williamboman/mason.nvim",
		-- Mason acts as entry point for code files and depends other plugins that should start too.
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Linting and formatting
			"mfussenegger/nvim-lint",
			"stevearc/conform.nvim",

			-- Mason only plugins
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Non lsp related plugins
			"nvim-treesitter/nvim-treesitter-context",
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
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"folke/neodev.nvim",
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local on_attach = function() end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			require("neodev").setup({})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
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
	-- Linting
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff", "mypy" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	-- Formatting
	{
		"stevearc/conform.nvim",
		lazy = true,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					cpp = { "clang-format" },
					lua = { "stylua" },
					python = { "black" },
					shell = { "beautysh" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
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
}
