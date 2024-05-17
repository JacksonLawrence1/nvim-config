return {
	"Pocco81/auto-save.nvim",
	config = function()
		local restricted_ft = {
			"harpoon",
			"neo-tree",
		}

		require("auto-save").setup({
			trigger_events = { "BufLeave" },
			condition = function(buf)
				local utils = require("auto-save.utils.data")
				local fn = vim.fn

				if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), restricted_ft) then
					return true
				end

				return false
			end,
		})
	end,
}
