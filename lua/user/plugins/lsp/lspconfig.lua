return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"folke/which-key.nvim",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(_, bufnr)
			require("which-key").register({
				l = {
					name = "LSP",
					D = { vim.lsp.buf.declaration, "LSP declaration", buffer = bufnr },
					K = { vim.lsp.buf.hover, "LSP documentation", buffer = bufnr },
					R = { "<cmd>Telescope lsp_references<CR>", "LSP references", buffer = bufnr },
					a = { vim.lsp.buf.code_action, "LSP action", buffer = bufnr },
					d = { "<cmd>Telescope lsp_definitions<CR>", "LSP definitions", buffer = bufnr },
					i = { "<cmd>Telescope lsp_implementations<CR>", "LSP implementations", buffer = bufnr },
					r = { vim.lsp.buf.rename, "LSP rename", buffer = bufnr },
					rs = { "<cmd>LspRestart<CR>", "LSP restart", buffer = bufnr },
					t = { "<cmd>Telescope lsp_type_definitions<CR>", "LSP type definitions", buffer = bufnr },
				},
				d = {
					name = "Diagnostics",
					b = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics buffer", buffer = bufnr },
					l = { vim.diagnostic.open_float, "Diagnostics line", buffer = bufnr },
					n = { vim.diagnostic.goto_next, "Diagnostics next", buffer = bufnr },
					p = { vim.diagnostic.goto_prev, "Diagnostics previous", buffer = bufnr },
				},
			}, { prefix = "<leader>" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
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
		})
	end,
}
