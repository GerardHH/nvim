return {
	"williamboman/mason.nvim",
	-- Mason acts as entry point for code files and depends other plugins that should start too.
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Non lsp releated plugins
		"nvim-treesitter/nvim-treesitter-context",
	},
	lazy = true,
	ft = { "c", "cpp", "shell", "lua", "markdown", "python" },
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-null-ls
		local mason_null_ls = require("mason-null-ls")

		-- import mason-nvim-dap
		local mason_nvim_dap = require("mason-nvim-dap")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls", -- shell
				"clangd", -- c/c++
				"lua_ls", -- lua
				"marksman", -- markdown
				"pyright", -- python
			},
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_null_ls.setup({
			-- list of formatters & linters for mason to install
			ensure_installed = {
				"beautysh", -- shell formatter
				"black", -- python formatter
				"clang-format", -- c/c++ formatter
				"mypy", -- python static analyzer
				"ruff", -- python linter
				"stylua", -- lua formatter
			},
			automatic_installation = true,
		})

		mason_nvim_dap.setup({
			-- list of debuggers for mason to install
			ensure_installed = {
				"python", -- python debugger
			},
			automatic_installation = true,
		})
	end,
}
