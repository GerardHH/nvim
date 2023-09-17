return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		-- "jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-null-ls
		-- local mason_null_ls = require("mason-null-ls")

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
				"lua_ls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		-- mason_null_ls.setup({
		--   -- list of formatters & linters for mason to install
		--   ensure_installed = {
		--     "stylua", -- lua formatter
		--   },
		--   -- auto-install configured servers (with lspconfig)
		--   automatic_installation = true,
		-- })
		--

		-- set keybinds
		local keymap = vim.keymap.set -- for conciseness
		local opts = { noremap = true, silent = true }

		opts.desc = "Mason Home"
		keymap("n", "<leader>mh", ":Mason<CR>", opts)

		opts.desc = "Mason Log"
		keymap("n", "<leader>ml", ":MasonLog<CR>", opts)
	end,
}
