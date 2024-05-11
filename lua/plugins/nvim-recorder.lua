return {
	"chrisgrieser/nvim-recorder",
	main = "recorder",
	version = "*",
	dependencies = { "rcarriga/nvim-notify" },
	lazy = true,
	keys = {
		{ "<leader>r", desc = " Start Recording" },
		{ "<leader>R", desc = " Play Recording" },
	},
	opts = {
		mapping = {
			startStopRecording = "<leader>r",
			playMacro = "<leader>R",
		},
	},
	config = function(pkg, opts)
		local recorder = require(pkg.main)

		recorder.setup(opts)

		-- Add to lualine
		local lualine = require("lualine")

		local lualineZ = lualine.get_config().sections.lualine_z or {}
		local lualineY = lualine.get_config().sections.lualine_y or {}
		table.insert(lualineZ, { recorder.recordingStatus })
		table.insert(lualineY, { recorder.displaySlots })

		lualine.setup({
			sections = {
				lualine_y = lualineY,
				lualine_z = lualineZ,
			},
		})
	end,
}
