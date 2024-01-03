return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 1000
	end,
	config = function()
		local which_key = require("which-key")

		which_key.setup({
			ignore_missing = true, -- Force specification of labels
		})

		local harpoon = function()
			return require("harpoon")
		end

		local telescope = function()
			return require("telescope")
		end

		local telescope_builtin = function()
			return require("telescope.builtin")
		end

		which_key.register({
			b = {
				name = "Buffer",
				c = { "<cmd>bd<cr>", "Buffer pick close" },
				l = { "<cmd>BufferLineCloseLeft<cr>", "Buffer close left" },
				o = { "<cmd>BufferLineCloseOthers<cr>", "Buffer close others" },
				r = { "<cmd>BufferLineCloseRight<cr>", "Buffer close right" },
				n = { "<cmd>BufferLineMoveNext<CR>", "Buffer move next" },
				p = { "<cmd>BufferLineMovePrev<CR>", "Buffer move previous" },
			},
			D = {
				name = "Debug",
				O = { "<cmd>DapStepOut<CR>", "Debug step Out" },
				b = { "<cmd>DapToggleBreakpoint<CR>", "Debug toggle Breakpoint" },
				c = { "<cmd>DapContinue<CR>", "Debug Continue/start" },
				i = { "<cmd>DapStepInto<CR>", "Debug step Into" },
				o = { "<cmd>DapStepOver<CR>", "Debug step Over" },
			},
			d = {
				name = "Diagnostics",
				b = {
					function()
						telescope_builtin().diagnostics({ bufnr = 0 })
					end,
					"Diagnostics buffer",
				},
				d = {
					function()
						telescope_builtin().diagnostics()
					end,
					"Diagnostics everywhere",
				},
				l = { vim.diagnostic.open_float, "Diagnostics line" },
				n = { vim.diagnostic.goto_next, "Diagnostics next" },
				p = { vim.diagnostic.goto_prev, "Diagnostics previous" },
			},
			h = {
				name = "Harpoon",
				a = {
					function()
						harpoon():list():append()
					end,
					"Harpoon append",
				},
				l = {
					function()
						telescope().extensions.harpoon.marks()
					end,
					"Harpoon list",
				},
				q = {
					function()
						harpoon().ui:toggle_quick_menu(harpoon():list())
					end,
					"Harpoon quick menu",
				},
				["1"] = {
					function()
						harpoon():list():select(1)
					end,
					"Harpoon select 1",
				},
				["2"] = {
					function()
						harpoon():list():select(2)
					end,
					"Harpoon select 2",
				},
				["3"] = {
					function()
						harpoon():list():select(3)
					end,
					"Harpoon select 3",
				},
				["4"] = {
					function()
						harpoon():list():select(4)
					end,
					"Harpoon select 4",
				},
			},
			L = {
				name = "HighLight",
				N = { "<cmd>Hi><CR>", "Highlight jump next cursor" },
				P = { "<cmd>Hi<<CR>", "Highlight jump previous cursor" },
				S = { "<cmd>Hi =<CR>", "Highlight single buffer" },
				a = { "<cmd>Hi ==<CR>", "Highlight all buffers" },
				c = { "<cmd>Hi clear<CR>", "Highlight clear" },
				e = { "<cmd>Hi -<CR>", "Highlight erase" },
				n = { "<cmd>Hi}<CR>", "Highlight jump next any" },
				p = { "<cmd>Hi{<CR>", "Highlight jump previous any" },
				s = { "<cmd>Hi +<CR>", "Highlight set" },
			},
			l = {
				name = "LSP",
				D = { vim.lsp.buf.hover, "LSP documentation" },
				a = { vim.lsp.buf.code_action, "LSP action" },
				d = { vim.lsp.buf.declaration, "LSP declaration" },
				g = {
					name = "LSP go to",
					d = {
						function()
							telescope_builtin().lsp_definitions()
						end,
						"LSP definitions",
					},
					i = {
						function()
							telescope_builtin().lsp_implementations()
						end,
						"LSP implementations",
					},
					t = {
						function()
							telescope_builtin().lsp_type_definitions()
						end,
						"LSP type definitions",
					},
				},
				l = {
					name = "LSP list",
					i = {
						function()
							telescope_builtin().lsp_incoming_calls()
						end,
						"LSP incoming calls",
					},
					o = {
						function()
							telescope_builtin().lsp_outgoing_calls()
						end,
						"LSP outgoing calls",
					},
					r = {
						function()
							telescope_builtin().lsp_references()
						end,
						"LSP references",
					},
					s = {
						function()
							telescope_builtin().lsp_document_symbols()
						end,
						"LSP symbols",
					},
					w = {
						function()
							telescope_builtin().lsp_workspace_symbols()
						end,
						"LSP workspace symbols",
					},
				},
				r = { vim.lsp.buf.rename, "LSP rename" },
				s = { "<cmd>ClangdSwitchSourceHeader<CR>", "LSP Switch header/source" },
			},
			},
			s = {
				name = "Split",
				c = { "<cmd>close<CR>", "Split close current" },
				e = { "<C-w>=", "Split equal size" },
				f = { "<cmd>MaximizerToggle<CR>", "Split fullscreen" },
				h = { "<C-w>s", "Split window horizontally" },
				v = { "<C-w>v", "Split window vertically" },
			},
			t = {
				name = "Telescope",
				C = {
					function()
						telescope_builtin().commands()
					end,
					"Telescope plugin/user commands",
				},
				H = {
					function()
						telescope_builtin().command_history()
					end,
					"Telescope command history",
				},
				R = {
					function()
						telescope_builtin().registers()
					end,
					"Telescope registers",
				},
				S = {
					function()
						telescope_builtin().spell_suggest()
					end,
					"Telescope spelling suggestion",
				},
				b = {
					function()
						telescope_builtin().buffers()
					end,
					"Telescope buffers",
				},
				c = {
					function()
						telescope_builtin().grep_string()
					end,
					"Telescope current word",
				},
				f = {
					function()
						telescope_builtin().find_files()
					end,
					"Telescope file",
				},
				h = {
					function()
						telescope_builtin().search_history()
					end,
					"Telescope search history",
				},
				j = {
					function()
						telescope_builtin().jumplist()
					end,
					"Telescope jumplist",
				},
				k = {
					function()
						telescope_builtin().keymaps()
					end,
					"Telescope keymaps",
				},
				n = {
					"<cmd>Noice telescope<CR>",
					"Telescope notifycations",
				},
				o = {
					function()
						telescope_builtin().oldfiles()
					end,
					"Telescope recent file",
				},
				r = {
					function()
						telescope_builtin().resume()
					end,
					"Telescope resume",
				},
				s = {
					function()
						telescope_builtin().live_grep()
					end,
					"Telescope string",
				},
				t = {
					function()
						telescope_builtin().help_tags()
					end,
					"Telescope help tags",
				},
			},
			v = {
				name = "View",
				e = {
					function()
						telescope().extensions.file_browser.file_browser({ path = "%:p:h", select_buffer = true })
					end,
					"View telescope file browser",
				},
				h = { "<cmd>checkhealth<CR>", "View health" },
				L = { "<cmd>LspInfo<CR>", "View connected LSP's" },
				l = { "<cmd>Lazy<CR>", "View Lazy" },
				m = { "<cmd>Mason<CR>", "View Mason" },
			},
		}, { prefix = "<leader>" })
	end,
}
