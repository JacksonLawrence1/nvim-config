return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	commit = "e76cb03",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		-- Keybindings
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[O]pen [H]arpoon list" })
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[A]dd [H]arpoon list" })

		-- Choose a buffer from the Harpoon list
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>[", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>]", function()
			harpoon:list():next()
		end)
	end,
}
