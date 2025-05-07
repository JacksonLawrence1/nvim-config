return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "css", "html", "json", "svelte", "markdown" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = false },
	},

	config = function(_, opts)
		-- git instead of default to download as apparently faster
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}

