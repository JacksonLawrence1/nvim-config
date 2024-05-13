return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			direction = 'float',
			shell = 'pwsh',
		})
	end,
}
