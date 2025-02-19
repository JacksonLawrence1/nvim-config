return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		local icons = require("internals.icons")

		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				position = "left",
			},
			filesystem = {
				components = {
					name = function(config, node, state)
						local name = require("neo-tree.sources.common.components").name(config, node, state)
						if node:get_depth() == 1 then
							name.text = vim.fs.basename(vim.loop.cwd() or "")
						end
						return name
					end,
				},
			},
			git_status = {
				symbols = {
					added = icons.git_added,
					modified = icons.pencil,
					deleted = icons.x,
					renamed = icons.string,
					untracked = icons.git_untracked,
					ignored = icons.ignored,
					unstaged = icons.enum,
					staged = icons.git_staged,
					conflict = icons.interface,
				},
			},
		})

		-- neo-tree keybinds
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Open [E]xplorer" })
	end,
}
