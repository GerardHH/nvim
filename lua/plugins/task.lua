return {
	"stevearc/overseer.nvim",
	version = "*",
	lazy = true,
	keys = {
		{ "<leader>tt", "<CMD>OverseerRun<CR>", desc = "Task task" },
		{ "<leader>tT", "<CMD>OverseerToggle<CR>", desc = "Task toggle results" },
		{
			"<leader>tr",
			function()
				local overseer = require("overseer")
				local tasks = overseer.list_tasks({ recent_first = true })
				if vim.tbl_isempty(tasks) then
					vim.notify("No tasks found", vim.log.levels.WARN)
				else
					overseer.run_action(tasks[1], "restart")
				end
			end,
			desc = "Task re-run task",
		},
	},
	opts = {
		task_list = {
			bindings = {
				["<F1>"] = "ShowHelp",
			},
		},
		task_launcher = {
			bindings = {
				i = {
					["<F1>"] = "ShowHelp",
				},
				n = {
					["<F1>"] = "ShowHelp",
				},
			},
		},
		task_editor = {
			bindings = {
				i = {
					["<F1>"] = "ShowHelp",
				},
				n = {
					["<F1>"] = "ShowHelp",
				},
			},
		},
	},
}
