return {
	"lpoto/telescope-tasks.nvim",
	dependency = {
		"nvim-telescope/telescope.nvim",
	},
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("tasks")

		-- Default tasks
		local default = telescope.extensions.tasks.generators.default
		default.lua()
		default.python()

		-- Custom tasks
		local custom = telescope.extensions.tasks.generators.custom
		local proprietary_tasks = require("proprietary.telescope-tasks-generators") or {}
		custom.add(unpack(proprietary_tasks)) -- replace with table.unpack
	end,
}
