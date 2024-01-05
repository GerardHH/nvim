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

		local comment = "<CMD>lua require('Comment')<CR><Plug>(%s)"

		local harpoon = function()
			return require("harpoon")
		end

		local leap = "<CMD>lua require('leap')<CR><Plug>(%s)"

		local surround = "<CMD>lua require('nvim-surround')<CR><Plug>(%s)"

		local telescope = function()
			return require("telescope")
		end

		local telescope_builtin = function()
			return require("telescope.builtin")
		end

		which_key.register({
			b = {
				name = "Buffer",
				c = { "<CMD>bd<CR>", "Buffer pick close" },
				l = { "<CMD>BufferLineCloseLeft<CR>", "Buffer close left" },
				o = { "<CMD>BufferLineCloseOthers<CR>", "Buffer close others" },
				r = { "<CMD>BufferLineCloseRight<CR>", "Buffer close right" },
				n = { "<CMD>BufferLineMoveNext<CR>", "Buffer move next" },
				p = { "<CMD>BufferLineMovePrev<CR>", "Buffer move previous" },
			},
			c = { -- Lazy loaded on key press, keep the same in `comment.lua`
				name = "Comment",
				L = {
					string.format(comment, "comment_toggle_linewise_current"),
					"Comment linewise current",
				},
				l = {
					string.format(comment, "comment_toggle_linewise"),
					"Comment linewise motion",
				},
				B = {
					string.format(comment, "comment_toggle_blockwise_current"),
					"Comment blockwise current",
				},
				b = {
					string.format(comment, "comment_toggle_blockwise"),
					"Comment blockwise motion",
				},
			},
			D = {
				name = "Debug",
				O = { "<CMD>DapStepOut<CR>", "Debug step Out" },
				b = { "<CMD>DapToggleBreakpoint<CR>", "Debug toggle Breakpoint" },
				c = { "<CMD>DapContinue<CR>", "Debug Continue/start" },
				i = { "<CMD>DapStepInto<CR>", "Debug step Into" },
				o = { "<CMD>DapStepOver<CR>", "Debug step Over" },
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
			H = {
				name = "Highlight",
				N = { "<CMD>Hi><CR>", "Highlight jump next cursor" },
				P = { "<CMD>Hi<<CR>", "Highlight jump previous cursor" },
				S = { "<CMD>Hi =<CR>", "Highlight single buffer" },
				a = { "<CMD>Hi ==<CR>", "Highlight all buffers" },
				c = { "<CMD>Hi clear<CR>", "Highlight clear" },
				e = { "<CMD>Hi -<CR>", "Highlight erase" },
				n = { "<CMD>Hi}<CR>", "Highlight jump next any" },
				p = { "<CMD>Hi{<CR>", "Highlight jump previous any" },
				s = { "<CMD>Hi +<CR>", "Highlight set" },
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
				s = { "<CMD>ClangdSwitchSourceHeader<CR>", "LSP Switch header/source" },
			},
			l = {
				name = "Leap",
				B = { string.format(leap, "leap-backward-till"), "Leap backward exclusive" },
				b = { string.format(leap, "leap-backward-to"), "Leap backward inclusive" },
				F = { string.format(leap, "leap-forward-till"), "Leap forward exclusive" },
				f = { string.format(leap, "leap-forward-to"), "Leap forward inclusive" },
				w = { string.format(leap, "leap-from-window"), "Leap from window" },
			},
			r = {
				name = "Recorder",
				q = { "q", "Recorder start/stop" },
				Q = { "Q", "Recorder play" },
				["<C-q>"] = { "<C-q>", "Recorder switch slot" },
				c = { "cq", "Recorder edit" },
				d = { "dq", "Recorder delete all" },
				y = { "yq", "Recorder yank" },
				["#"] = { "##", "Recorder add breakpoint" },
			},
			s = {
				name = "Surround",
				c = { string.format(surround, "nvim-surround-change"), "Surround change" },
				d = { string.format(surround, "nvim-surround-delete"), "Surround delete" },
				l = { string.format(surround, "nvim-surround-normal-cur"), "Surround line" },
				s = { string.format(surround, "nvim-surround-normal"), "Surround surround" },
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
					"<CMD>Noice telescope<CR>",
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
				h = { "<CMD>checkhealth<CR>", "View health" },
				L = { "<CMD>LspInfo<CR>", "View connected LSP's" },
				l = { "<CMD>Lazy<CR>", "View Lazy" },
				m = { "<CMD>Mason<CR>", "View Mason" },
				n = {
					function()
						require("nvim-navbuddy").open()
					end,
					"View symbols explorer (navbuddy)",
				},
				s = {
					name = "Split",
					c = { "<CMD>close<CR>", "Split close current" },
					e = { "<C-w>=", "Split equal size" },
					f = { "<CMD>MaximizerToggle<CR>", "Split fullscreen" },
					h = { "<C-w>s", "Split window horizontally" },
					v = { "<C-w>v", "Split window vertically" },
				},
			},
		}, { mode = "n", prefix = "<leader>" })

		which_key.register({
			c = {
				name = "Comment",
				l = {
					string.format(comment, "comment_toggle_linewise_visual"),
					"Comment linewise",
				},
				b = {
					string.format(comment, "comment_toggle_blockwise_visual"),
					"Comment blockwise",
				},
			},
			s = {
				string.format(surround, "nvim-surround-visual"),
				"Surround visual",
			},
		}, { mode = "x", prefix = "<leader>" })
	end,
}
