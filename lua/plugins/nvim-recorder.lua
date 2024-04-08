return {
	"chrisgrieser/nvim-recorder",
	version = "*",
	dependencies = { "rcarriga/nvim-notify" },
	keys = {
		-- these must match the keys in the mapping config below
		{ "q", desc = " Start Recording" },
		{ "Q", desc = " Play Recording" },
	},
	opts = {
		mapping = {
			startStopRecording = "q",
			playMacro = "Q",
		},
	},
	config = function(_, opts)
		local recorder = require("recorder")

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
