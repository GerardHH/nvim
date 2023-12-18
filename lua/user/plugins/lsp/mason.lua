return {
	"williamboman/mason.nvim",
	-- Mason acts as entry point for code files and depends other plugins that should start too.
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Linting and formatting
		"mfussenegger/nvim-lint",
		"stevearc/conform.nvim",

		-- Mason only plugins
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Non lsp related plugins
		"nvim-treesitter/nvim-treesitter-context",
	},
	lazy = true,
	ft = { "c", "cpp", "shell", "lua", "markdown", "python" },
	config = function()
		-- Mason itself
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- LSP's
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls", -- shell
				"clangd", -- c/c++
				"lua_ls", -- lua
				"marksman", -- markdown
				"pyright", -- python
			},
			automatic_installation = true,
		})

		-- Formatters and Linters
		require("mason-tool-installer").setup({
			ensure_installed = {
				"beautysh", -- shell formatter
				"black", -- python formatter
				"clang-format", -- c/c++ formatter
				"mypy", -- python static analyzer
				"ruff", -- python linter
				"stylua", -- lua formatter
			},
		})

		-- Debuggers
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python", -- python
			},
			automatic_installation = true,
		})
	end,
}
