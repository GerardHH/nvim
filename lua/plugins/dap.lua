return {
	{
		"mfussenegger/nvim-dap",
		version = "*",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},
		lazy = true,
		keys = {
			{
				"<leader>dB",
				function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
				desc = "Breakpoint Condition",
			},
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug toggle breakpoint" },
			{ "<leader>dc", function() require("dap").continue() end, desc = "Debug run/continue" },
			-- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Debug run with args" },
			{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Debug run to cursor" },
			-- { "<leader>dg", function() require("dap").goto_() end, desc = "Debug go to line (no execute)" },
			{ "<leader>di", function() require("dap").step_into() end, desc = "Debug step into" },
			{ "<leader>dj", function() require("dap").down() end, desc = "Debug down" },
			{ "<leader>dk", function() require("dap").up() end, desc = "Debug up" },
			{ "<leader>dl", function() require("dap").run_last() end, desc = "Debug run last" },
			{ "<leader>do", function() require("dap").step_out() end, desc = "Debug step out" },
			{ "<leader>dO", function() require("dap").step_over() end, desc = "Debug step over" },
			{ "<leader>dP", function() require("dap").pause() end, desc = "Debug pause" },
			{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Debug toggle REPL" },
			{ "<leader>ds", function() require("dap").session() end, desc = "Debug session" },
			{ "<leader>dt", function() require("dap").terminate() end, desc = "Debug terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Debug widgets" },
		},
		config = function()
			-- vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			-- for name, sign in pairs(LazyVim.config.icons.dap) do
			-- 	sign = type(sign) == "table" and sign or { sign }
			-- 	vim.fn.sign_define(
			-- 		"Dap" .. name,
			-- 		{ text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
			-- 	)
			-- end

			-- setup dap config by VsCode launch.json file
			-- local vscode = require("dap.ext.vscode")
			-- local json = require("plenary.json")
			-- vscode.json_decode = function(str) return vim.json.decode(json.json_strip_comments(str)) end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		version = "*",
		dependencies = { "nvim-neotest/nvim-nio" },
		lazy = true,
		keys = {
			{ "<leader>du", function() require("dapui").toggle({}) end, desc = "Debug dap UI" },
			{ "<leader>de", function() require("dapui").eval() end, desc = "Debug eval", mode = { "n", "v" } },
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
			dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end
		end,
	},
}
