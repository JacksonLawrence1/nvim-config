return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("i", "<A-s>", "<Plug>(copilot-suggest)")
	end,
}
