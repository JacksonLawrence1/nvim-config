return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		local icons = require("internals.icons")

		vim.api.nvim_set_hl(0, "Matrix", { fg = "#00ff2b" })

		-- TODO: change this

		local logo = {
			"              ██████            ████                ",
			"              ████████████████████████              ",
			"            ██████████████████████████              ",
			"            ██████████████████████████              ",
			"            ████████████████████████████            ",
			"            ████████████████████████████            ",
			"          ██████████████████████████████            ",
			"          ████████████████████████████████          ",
			"    ████████████████████████████████████████████    ",
			"████████████████████████████████████████████████████",
			"      ████████████████████████████████████████      ",
			"                  ░░████▒▒▒▒████                    ",
			"                                                    ",
			"        ████████████████████████████████████        ",
			"        ████████████████████████████████████        ",
			"        ██████        ████████        ██████        ",
			"          ████        ████████      ██████          ",
			"          ████████████████████████████████          ",
			"              ████████▓▓    ████████▓▓              ",
		}

		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = "Matrix"

		local function newButton(map, text, command, color)
			local b = dashboard.button(map, text, command)
			b.opts.hl = color or "Matrix"
			b.opts.hl_shortcut = "Title"
			return b
		end

		local function neovimVersion()
			local v = vim.version()
			return "v" .. tostring(v.major) .. "." .. tostring(v.minor) .. "." .. tostring(v.patch)
		end


		local function createFindFilesButton()
			-- where to index files
			local ok, filepaths = pcall(require, 'internals.filepaths')

			if not ok or not filepaths.search then
				vim.notify("Warning: Missing `filepaths.search` property in `internals/filepaths.lua`", vim.log.levels.WARN)
				return
			end
			return newButton("f", icons.file .. "   Files", ":cd " .. filepaths.search ..  " | Telescope find_files<CR>")
		end

		-- Central buttons
		dashboard.section.buttons.val = {
			newButton("e", icons.new_file .. "   New file", ":ene <BAR> startinsert <CR>"),
			newButton("p", icons.folder .. "   Projects", ":Telescope projects<CR>"),
			newButton("r", icons.back_in_time .. "   Recent", ":Telescope oldfiles<CR>"),
			createFindFilesButton(),
			newButton(
				"s",
				icons.cog .. "   Settings",
				':lua require"telescope.builtin".find_files({ cwd = vim.fn.stdpath("config")})<CR>'
			),
			{ type = "padding", val = 1 },
			newButton("q", icons.x .. "   Quit", ":qa<CR>", "Error"),
		}

		-- Style footer
		dashboard.section.footer.val = icons.info .. " Neovim " .. neovimVersion()
		dashboard.section.footer.opts.hl = "Comment"

		require("alpha").setup(dashboard.config)

		-- Alt + Shift + h to open home screen
		vim.keymap.set("n", "<A-S-h>", ":Neotree action=close<CR> <BAR> :Alpha<CR>", { desc = "[H]ome" })
	end,
}
