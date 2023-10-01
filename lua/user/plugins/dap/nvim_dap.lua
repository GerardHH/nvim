return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"folke/which-key.nvim",
	},
	config = function()
		print("nvim-dap.on_config")
		require("which-key").register({
			D = {
				name = "Debug",
				O = { "<cmd>DapStepOut<CR>", "Debug step Out" },
				b = { "<cmd>DapToggleBreakpoint<CR>", "Debug toggle Breakpoint" },
				c = { "<cmd>DapContinue<CR>", "Debug Continue/start" },
				i = { "<cmd>DapStepInto<CR>", "Debug step Into" },
				o = { "<cmd>DapStepOver<CR>", "Debug step Over" },
			},
		}, { prefix = "<leader>", silent = false })
	end,
}
