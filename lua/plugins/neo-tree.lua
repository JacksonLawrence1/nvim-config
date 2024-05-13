return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
		},
		filesystem = {
			components = {
				name = function(config, node, state)
					local name = require('neo-tree.sources.common.components').name(config, node, state)
					if node:get_depth() == 1 then
						name.text = vim.fs.basename(vim.loop.cwd() or "")
					end
					return name
				end,
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- neo-tree keybinds
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", { desc = "Open [E]xplorer" })

		-- open neo-tree on entering vim
		-- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
		-- vim.api.nvim_create_autocmd("BufRead", {
		--     desc = "Open neo-tree on enter",
		--     group = "neotree_autoopen",
		--     once = true,
		--     callback = function()
		--         if not vim.g.neotree_opened then
		--             -- check if there is a GitHub head in the directories
		--
		--             vim.cmd("Neotree action=show dir=%:p:h")
		--             vim.g.neotree_opened = true
		--         end
		--     end,
		-- })
	end,
}
