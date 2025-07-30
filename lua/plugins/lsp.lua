return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		version = "*",
		dependencies = {
			"saghen/blink.cmp",
			"SmiteshP/nvim-navic",
		},
		lazy = true,
		ft = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"lua",
			"markdown",
			"python",
			"sh",
		},
		keys = {
			-- lsp
			{ "<leader>lG", vim.lsp.buf.type_definition, desc = "LSP Go to type definition" },
			{ "<leader>lg", vim.lsp.buf.definition, desc = "LSP Go to definition" },
			{ "<leader>lh", vim.lsp.buf.hover, desc = "LSP hover documentation" },
			{ "<leader>ls", "<CMD>ClangdSwitchSourceHeader<CR>", desc = "LSP Switch header/source" },
			-- View
			{ "<leader>vL", "<CMD>LspInfo<CR>", desc = "View connected LS's" },
		},
		opts = {
			servers = {
				bashls = {},
				clangd = {
					capabilities = {
						offsetEncoding = { "utf-16" },
					},
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
						"--fallback-style=llvm",
					},
				},
				cmake = {},
				lua_ls = {
					settings = {
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
					},
				},
				marksman = {},
				pyright = {},
				ruff = {},
			},
		},
		config = function(_, opts)
			local function register_lspconfig_commands(bufnr, commands)
				for name, def in pairs(commands or {}) do
					vim.api.nvim_buf_create_user_command(bufnr, name, function(args)
						def[1](args) -- def[1] is the function, def[2] is description
					end, def[2] or {})
				end
			end

			for name, extending_config in pairs(opts.servers) do
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				local on_attach = function(client, bufnr)
					if client.server_capabilities["documentSymbolProvider"] then
						require("nvim-navic").attach(client, bufnr)
					end
					-- This work around is needed to keep the ClangdSwitchSourceHeader working when in a *.h file.
					-- Otherwise the `commands` should be merged in the table bellow as `commands`.
					register_lspconfig_commands(bufnr, require("lspconfig")[name].document_config.commands)
				end

				extending_config = vim.tbl_deep_extend("force", extending_config, {
					capabilities = capabilities,
					on_attach = on_attach,
				})

				-- lspconfig already setup the LS config defaults, so we only need to add our specifics
				vim.lsp.config(name, extending_config)
				vim.lsp.enable(name)
			end

			vim.lsp.inlay_hint.enable()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "*",
		lazy = true,
		ft = "rust",
		config = function() vim.lsp.inlay_hint.enable() end,
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
