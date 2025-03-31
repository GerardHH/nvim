return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			{
				"williamboman/mason.nvim",
				lazy = true,
				opts = {},
			},
			"mfussenegger/nvim-dap",
		},
		event = "VeryLazy",
		opts = {
			ensure_installed = { "codelldb" },
			automatic_setup = true, -- registers with nvim-dap automatically
		},
	},
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
			local function pick_executable(candidates)
				local default_dir
				for _, d in ipairs(candidates) do
					local dir = vim.fn.expand(d)
					if vim.fn.isdirectory(dir) == 1 then
						default_dir = dir
						break
					end
				end
				local base = default_dir or (vim.fn.getcwd() .. "/")
				return vim.fn.input("Path to executable: ", base, "file")
			end

			local dap = require("dap")

			for _, lang in ipairs({ "c", "cpp" }) do
				dap.configurations[lang] = {
					{
						name = "CMake: Launch",
						type = "codelldb",
						request = "launch",
						program = function()
							local cwd = vim.fn.getcwd()
							local candidates = {
								cwd .. "/build/Debug/",
								cwd .. "/build/RelWithDebInfo/",
								cwd .. "/build/Release/",
								cwd .. "/build/",
								cwd .. "/cmake-build-debug/",
								cwd .. "/cmake-build-release/",
								cwd .. "/out/build/", -- VS/CMakePresets style
							}
							return pick_executable(candidates)
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
						args = {},
						env = {},
					},
				}
			end

			dap.configurations.rust = {
				{
					name = "Cargo: Launch (target/debug)",
					type = "codelldb",
					request = "launch",
					program = function()
						local cwd = vim.fn.getcwd()
						local candidates = {
							cwd .. "/target/debug/",
							cwd .. "/target/x86_64-unknown-linux-gnu/debug/",
						}
						return pick_executable(candidates)
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					env = {},
				},
			}
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
	{
		"nvim-neotest/neotest",
		ft = { "rust" },
		cmd = { "Neotest", "NeotestRun", "NeotestSummary", "NeotestOutput" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mrcjkb/rustaceanvim",
		},
		opts = function()
			return {
				adapters = {
					require("rustaceanvim.neotest"),
				},
			}
		end,
		keys = {
			{ "<leader>tt", function() require("neotest").run.run() end, desc = "Test nearest test" },
			{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file tests" },
			{ "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
			{ "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
		},
	},
}
