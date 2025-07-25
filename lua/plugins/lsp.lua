return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		version = "*",
		dependencies = {},
		lazy = true,
		keys = {
			-- lsp
			{ "<leader>lG", vim.lsp.buf.type_definition, desc = "LSP Go to type definition" },
			{ "<leader>lg", vim.lsp.buf.definition, desc = "LSP Go to definition" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "LSP hover documentation" },
			{ "<leader>ls", "<CMD>ClangdSwitchSourceHeader<CR>", desc = "LSP Switch header/source" },
			-- View
			{ "<leader>vL", "<CMD>LspInfo<CR>", desc = "View connected LS's" },
		},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	-- Linting & Formatting
	{
		"nvimtools/none-ls.nvim",
		version = "*",
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
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.clang_format, -- c/c++
					null_ls.builtins.formatting.shfmt, -- shell
					null_ls.builtins.formatting.stylua, -- lua
				},
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") then
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
			attach_navic = false,
		},
	},
	{
		"rmagatti/goto-preview",
		version = "*",
		lazy = true,
		keys = {
			{
				"<leader>lp",
				function() require("goto-preview").goto_preview_definition({}) end,
				desc = "LSP preview definition",
			},
			{
				"<leader>lP",
				function() require("goto-preview").goto_preview_type_definition({}) end,
				desc = "LSP preview type definition",
			},
		},
		opts = {},
	},
	{
		"smjonas/inc-rename.nvim",
		version = "*",
		lazy = true,
		keys = {
			{
				"<leader>lr",
				function() return ":IncRename " .. vim.fn.expand("<cword>") end,
				expr = true,
				desc = "LSP rename",
			},
		},
		opts = {},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		main = "tiny-inline-diagnostic",
		version = "*",
		lazy = true,
		event = "LspAttach",
		priority = 1000, -- needs to be loaded in first
		opts = {
			preset = "classic",
			multilines = {
				enabled = true,
				always_show = true,
				trim_whitespaces = true,
				tabstop = 2,
			},
		},
		config = function(pkg, opts)
			require(pkg.main).setup(opts)
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
	{
		"kosayoda/nvim-lightbulb",
		version = "*",
		lazy = true,
		event = "LspAttach",
		opts = {
			autocmd = {
				enabled = true,
			},
			sign = {
				enabled = true,
				text = "",
			},
			virtual_text = {
				enabled = true,
				text = "",
			},
		},
	},
}
