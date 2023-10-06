return {
	"lpoto/telescope-tasks.nvim",
	dependency = {
		"nvim-telescope/telescope.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("tasks")

		-- Default tasks
		local default = telescope.extensions.tasks.generators.default
		default.lua()
		default.python()

		require("which-key").register({
			t = {
				t = { "<cmd>Telescope tasks<CR>", "Telescope tasks" },
			},
		}, { prefix = "<leader>" })

		-- Custom tasks
		local custom = telescope.extensions.tasks.generators.custom
		local proprietary_tasks = require("proprietary.telescope-tasks-generators") or {}
		custom.add(unpack(proprietary_tasks)) -- replace with table.unpack
	end,
}
