return {
	"stevearc/conform.nvim",
	dependencies = {
		"tpope/vim-sleuth",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		local firstFormat = true

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
				timeout_ms = 1000,
			}, function()
				if firstFormat then
					vim.cmd("silent Sleuth")
					firstFormat = false
				end
			end)
		end, { desc = "[F]ormat file" })

		vim.api.nvim_create_autocmd("BufLeave", {
			callback = function()
				firstFormat = true
			end,
		})
	end,
}
