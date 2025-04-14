return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<A-S-f>", -- Alt-shift-f
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettierd", "rustywind" },
			css = { "prettier", "rustywind"},
			typescript = { "prettierd", "rustywind" },
			javascript = { "prettierd", "rustywind" },
			javascriptreact = { "prettierd", "rustywind" },
			typescriptreact = { "prettierd", "rustywind" },
			svelte = { "prettierd", "rustywind" },
			json = { "prettierd" },
			xml = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			python = { "black" },
		},
	},
}
