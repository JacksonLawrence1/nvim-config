return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"tpope/vim-sleuth",
	},
	opts = {
		theme = "auto",
		sections = {
			lualine_x = { "SleuthIndicator", "filetype" },
			lualine_z = { "location", }
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
}
