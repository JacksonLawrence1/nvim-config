return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local shell = vim.o.shell;

		if vim.fn.has("win32") == 1 then
			shell = "pwsh"
		end

		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			terminal_mappings = true,
			direction = "float",
			shell = shell,
			autochdir = true,
		})

		-- split terminal
		vim.keymap.set("n", "<leader>ttf", ":ToggleTerm direction=horizontal<CR>", { desc = "[T]oggle [T]erminal [F]loat" })

		-- split terminal
		vim.keymap.set(
			"n",
			"<leader>tth",
			":ToggleTerm direction=horizontal<CR>",
			{ desc = "[T]oggle [T]erminal [H]orizontally" }
		)

		vim.keymap.set(
			"n",
			"<leader>ttv",
			":ToggleTerm size=40 direction=vertical<CR>",
			{ desc = "[T]oggle [T]erminal [V]ertically" }
		)
	end,
}
