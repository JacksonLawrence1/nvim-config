return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-tree/nvim-web-devicons", enabled = true },
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local fb_actions = telescope.extensions.file_browser.actions

			local function openInNewFolder(prompt_bufnr)
				fb_actions.change_cwd(prompt_bufnr)

				-- open a new file
				vim.cmd("ene!")

				-- open neotree
				vim.cmd("Neotree filesystem reveal left")
			end

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_moduls",
					},
					mappings = {
						i = {
							-- in picker window, CTRL-s to open in vertical split
							["<C-s>"] = "select_vertical",
						},
					},
					path_display = {
						"tail",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						mappings = {
							["i"] = {
								["<C-o>"] = openInNewFolder,
							},
						},
					},
				},
			})

			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
			telescope.load_extension("projects")

			-- telescope keybinds
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })

			-- search for projects
			vim.keymap.set("n", "<leader>sp", function()
				telescope.extensions.projects.projects({})
			end, { desc = "[S]earch [P]rojects" })

			-- search for folders
			vim.keymap.set("n", "<leader>sF", function()
				telescope.extensions.file_browser.file_browser()
			end, { desc = "[S]earch [P]rojects" })

			-- search for neovim config files
			vim.keymap.set("n", "<leader>sc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch for Neovim [C]onfig files" })
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
