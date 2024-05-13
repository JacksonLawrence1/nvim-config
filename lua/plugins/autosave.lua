return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			trigger_events = { "BufLeave" },
			condition = function(buf)
				if vim.bo[buf].filetype == "harpoon" then
					return false
				end
			end,
		})
	end,
}
