return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			"folke/neodev.nvim",
			"SmiteshP/nvim-navic",

			-- Improve selection for LSP actions
			"nvim-telescope/telescope-ui-select.nvim",
			"gbrlsnchs/telescope-lsp-handlers.nvim",
		},
		lazy = true,
		ft = { "c", "cpp", "shell", "lua", "markdown", "nix", "python" },
		keys = {
			-- lsp
			{ "<leader>l?", vim.lsp.buf.signature_help, desc = "LSP signature help" },
			{ "<leader>lC", vim.lsp.buf.outgoing_calls, desc = "LSP outgoing calls" },
			{ "<leader>lD", vim.lsp.buf.definition, desc = "LSP definition" },
			{ "<leader>lS", vim.lsp.buf.document_symbol, desc = "LSP document symbol" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "LSP action" },
			{ "<leader>lc", vim.lsp.buf.incoming_calls, desc = "LSP incoming calls" },
			{ "<leader>ld", vim.lsp.buf.declaration, desc = "LSP declaration" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "LSP hover (doc popup)" },
			{ "<leader>li", vim.lsp.buf.implementation, desc = "LSP implementation" },
			{ "<leader>ln", vim.lsp.buf.rename, desc = "LSP rename" },
			{ "<leader>lr", vim.lsp.buf.references, desc = "LSP references" },
			{ "<leader>ls", "<CMD>ClangdSwitchSourceHeader<CR>", desc = "LSP Switch header/source" },
			-- View
			{ "<leader>vL", "<CMD>LspInfo<CR>", desc = "View connected LS's" },
		},
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
					"--offset-encoding=utf-16",
				},
			})
			lspconfig["cmake"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["marksman"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["nixd"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig["pyright"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})
			lspconfig["ruff_lsp"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
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
		event = "LspAttach",
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
					null_ls.builtins.diagnostics.mypy, -- python
					null_ls.builtins.formatting.alejandra, -- Nix
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.clang_format, -- c/c++
					null_ls.builtins.formatting.shfmt, -- shell
					null_ls.builtins.formatting.stylua, -- lua
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function() lsp_formatting(bufnr) end,
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
		keys = {
			{ "<leader>DO", "<CMD>DapStepOut<CR>", desc = "Debug step Out" },
			{ "<leader>Db", "<CMD>DapToggleBreakpoint<CR>", desc = "Debug toggle Breakpoint" },
			{ "<leader>Dc", "<CMD>DapContinue<CR>", desc = "Debug Continue/start" },
			{ "<leader>Di", "<CMD>DapStepInto<CR>", desc = "Debug step Into" },
			{ "<leader>Do", "<CMD>DapStepOver<CR>", desc = "Debug step Over" },
		},
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
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
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
		event = "LspAttach",
		opts = {
			attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
		},
	},
}
