return {
	"ibhagwan/fzf-lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = true,
	event = "LspAttach",
	keys = {
		-- FZF
		{ "<leader>fB", "<CMD>FzfLua builtin<CR>", desc = "FZF builtin commands" },
		{ "<leader>fC", "<CMD>FzfLua commands<CR>", desc = "FZF plugin/user commands" },
		{ "<leader>fH", "<CMD>FzfLua command_history<CR>", desc = "FZF command history" },
		{ "<leader>fR", "<CMD>FzfLua registers<CR>", desc = "FZF registers" },
		{ "<leader>fS", "<CMD>FzfLua spell_suggest<CR>", desc = "FZF spelling suggestion" },
		{ "<leader>fb", "<CMD>FzfLua buffers<CR>", desc = "FZF buffers" },
		{ "<leader>fc", "<CMD>FzfLua grep_cword<CR>", desc = "FZF current word" },
		{ "<leader>ff", "<CMD>FzfLua files<CR>", desc = "FZF find files" },
		{ "<leader>fh", "<CMD>FzfLua search_history<CR>", desc = "FZF search history" },
		{ "<leader>fj", "<CMD>FzfLua jumps<CR>", desc = "FZF jumplist" },
		{ "<leader>fk", "<CMD>FzfLua keymaps<CR>", desc = "FZF keymaps" },
		{ "<leader>fo", "<CMD>FzfLua oldfiles<CR>", desc = "FZF oldfiles" },
		{ "<leader>fr", "<CMD>FzfLua resume<CR>", desc = "FZF resume" },
		{ "<leader>fs", "<CMD>FzfLua live_grep<CR>", desc = "FZF string" },
		{ "<leader>ft", "<CMD>FzfLua help_tags<CR>", desc = "FZF help tags" },
		-- LSP
		{ "<leader>lD", "<CMD>FzfLua lsp_workspace_diagnostics<CR>", desc = "LSP workspace diagnostics (fzf)" },
		{ "<leader>lS", "<CMD>FzfLua lsp_document_symbols<CR>", desc = "LSP document symbols (fzf)" },
		{ "<leader>la", "<CMD>FzfLua lsp_code_actions<CR>", desc = "LSP code action (fzf)" },
		{ "<leader>ld", "<CMD>FzfLua lsp_document_diagnostics<CR>", desc = "LSP document diagnostics (fzf)" },
		{ "<leader>lf", "<CMD>FzfLua lsp_finder<CR>", desc = "LSP find all locations (fzf)" },
		{ "<leader>lw", "<CMD>Fzflua lsp_workspace_symbols<CR>", desc = "LSP workspace symbols (fzf)" },
	},
	opts = {
		"telescope",
		winopts = {
			fullscreen = true,
			preview = {
				layout = "vertical",
				vertical = "up:70%",
			},
		},
	},
	config = function(pkg, opts)
		require(pkg.name).setup(opts)
		vim.cmd("FzfLua register_ui_select")
	end,
}
