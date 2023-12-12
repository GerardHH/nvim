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
				b = { "<cmd>Telescope diagnostics bufnr=0<CR>", "Diagnostics buffer" },
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
				D = { vim.lsp.buf.declaration, "LSP declaration" },
				K = { vim.lsp.buf.hover, "LSP documentation" },
				R = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
				S = { "<cmd>LspRestart<CR>", "LSP restart" },
				a = { vim.lsp.buf.code_action, "LSP action" },
				d = { "<cmd>Telescope lsp_definitions<CR>", "LSP definitions" },
				i = { "<cmd>Telescope lsp_implementations<CR>", "LSP implementations" },
				r = { vim.lsp.buf.rename, "LSP rename" },
				s = { "<cmd>ClangdSwitchSourceHeader<CR>", "LSP Switch header/source" },
				t = { "<cmd>Telescope lsp_type_definitions<CR>", "LSP type definitions" },
			},
			S = {
				name = "Session",
				s = { "<cmd>SessionSave<CR>", "Session save" },
				d = { "<cmd>SessionDelete<CR>", "Session delete" },
				f = { "<cmd>SearchSession<CR>", "Session find" },
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
				b = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", "Telescope file browser" },
				c = { "<cmd>Telescope grep_string<CR>", "Telescope current word" },
				d = { "<cmd>Telescope diagnostics<CR>", "Telescope diagnostics" },
				f = { "<cmd>Telescope find_files<CR>", "Telescope file" },
				h = { "<cmd>Telescope help_tags<CR>", "Telescope help" },
				k = { "<cmd>Telescope keymaps<CR>", "Telescope keymaps" },
				n = { "<cmd>Telescope notify<CR>", "Telescope notifycations" },
				o = { "<cmd>Telescope oldfiles<CR>", "Telescope recent file" },
				r = { "<cmd>Telescope resume<CR>", "Telescope resume" },
				s = { "<cmd>Telescope live_grep<CR>", "Telescope string" },
				t = { "<cmd>Telescope tasks<CR>", "Telescope tasks" },
			},
			v = {
				name = "View",
				e = { "<cmd>NvimTreeToggle<CR>", "View file explorer" },
				l = { "<cmd>Lazy<CR>", "View Lazy" },
				m = { "<cmd>Mason<CR>", "View Mason" },
				h = { "<cmd>checkhealth<CR>", "View health" },
			},
		}, { prefix = "<leader>" })
	end,
}
