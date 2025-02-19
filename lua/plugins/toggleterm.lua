return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			terminal_mappings = true,
			direction = "float",
			shell = "pwsh",
			autochdir = true,
		})

		-- split terminal
		vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=horizontal<CR>", { desc = "Open [T]erminal [F]loat" })

		-- split terminal
		vim.keymap.set(
			"n",
			"<leader>th",
			":ToggleTerm direction=horizontal<CR>",
			{ desc = "Open [T]erminal [H]orizontally" }
		)

		vim.keymap.set(
			"n",
			"<leader>tv",
			":ToggleTerm size=40 direction=vertical<CR>",
			{ desc = "Open [T]erminal [V]ertically" }
		)
	end,
}
