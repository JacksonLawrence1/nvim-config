-- Debug printing
return {
	"andrewferrier/debugprint.nvim",

	opts = {
		keymaps = {
			normal = {
				plain_below = "<leader>pl",
				plain_above = "<leader>Pl",
				variable_below = "<leader>pv",
				variable_above = "<leader>pV",
				variable_below_alwaysprompt = "",
				variable_above_alwaysprompt = "",
				surround_plain = "g?sp",
				surround_variable = "g?sv",
				surround_variable_alwaysprompt = "",
				textobj_below = "g?o",
				textobj_above = "g?O",
				textobj_surround = "g?so",
				toggle_comment_debug_prints = "",
				delete_debug_prints = "",
			},
			visual = {
				variable_below = "<leader>pv",
				variable_above = "<leader>pV",
			},
		},
		commands = {
			toggle_comment_debug_prints = "ToggleCommentDebugPrints",
			delete_debug_prints = "DeleteDebugPrints",
			reset_debug_prints_counter = "ResetDebugPrintsCounter",
		},
		-- No printing prefix
		-- enabling this for some reason breaks the color scheme, so keep disabled for now
		-- print_tag = ""
	},

	dependencies = {
		"echasnovski/mini.nvim",
	},

	lazy = false,
	version = "*",
}
