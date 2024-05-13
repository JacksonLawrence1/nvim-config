return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "rustywind", "prettier" },
				typescriptreact = { "rustywind", "prettier" },
				svelte = { "rustywind", "prettier" },
				html = { "rustywind", "prettier" },
				css = { "rustywind", "prettier" },
				json = { "prettier" },
				xml = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				python = { "black" },
				go = { "gofumpt" },
			},
		})

		vim.keymap.set("n", "<A-S-f>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "[F]ormat file" })
	end,
}
