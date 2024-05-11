return {
	{
		"hrsh7th/nvim-cmp",
		main = "cmp",
		version = "*",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-cmdline", -- completion for search and command line
			"onsails/lspkind.nvim", -- vs-code like pictographs
			"saadparwaiz1/cmp_luasnip", -- for auto completion
			"L3MON4D3/LuaSnip", -- snippet engine
		},
		event = "InsertEnter",
		keys = { ":", "/" },
		opts = {
			experimental = {
				ghost_text = true,
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
		},
		config = function(pkg, opts)
			local cmp = require(pkg.main)

			local luasnip = require("luasnip")

			local check_backspace = function()
				local col = vim.fn.col(".") - 1
				return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
			end

			opts.window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			}
			opts.snippet = {
				expand = function(args) luasnip.lsp_expand(args.body) end,
			}
			opts.mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expandable() then
						luasnip.expand()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif check_backspace() then
						fallback()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			})
			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- file system paths
				{ name = "buffer" }, -- text within current buffer
			})
			opts.formatting = {
				-- configure lspkind for vs-code like pictograms in completion menu
				format = require("lspkind").cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			}
			cmp.setup(opts)

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		lazy = true,
		config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
	},
}
