return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- image support for preview window
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
			default_component_configs = {
				git_status = {
					symbols = {
						added = icons.git_added,
						modified = icons.pencil,
						deleted = icons.git_deleted,
						renamed = icons.string,
						untracked = icons.git_untracked,
						ignored = icons.ignored,
						unstaged = icons.enum,
						staged = icons.git_staged,
						conflict = icons.interface,
					},
				},
			}
		})

		-- Open Neo-tree on the left
		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({
				toggle = true,
				reveal= true,
				position = "left",
				source = "filesystem"
			})
		end, { desc = "Open Neo-tree" })
	end,
}
