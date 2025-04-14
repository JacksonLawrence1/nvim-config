-- Add color previews to colors e.g.
--
-- CSS names
-- class="goldenrod"
--
-- HEX
-- #FFFFFF
--
-- RGB
--  rgb(203 166 247)
--
-- HSL
-- hsl(94 33 65)
--
-- Tailwind
-- bg-blue-400
--
-- Variables
-- --primary: #769b94
-- var(--primary)

return {
	"brenoprata10/nvim-highlight-colors",

	config = function()
		vim.opt.termguicolors = true

		require("nvim-highlight-colors").setup({
			-- Prefix using ■ symbol of the color
			render = "virtual",
			enable_tailwind = true,
		})
	end,
}
