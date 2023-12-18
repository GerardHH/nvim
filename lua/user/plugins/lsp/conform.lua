return {
	"stevearc/conform.nvim",
	lazy = true,
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "black" },
				shell = { "beautysh" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})
	end,
}
