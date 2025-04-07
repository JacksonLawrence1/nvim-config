return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		-- "hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("internals.icons")

		-- Setup sign icons
		vim.fn.sign_define("DiagnosticSignError", { text = icons.diag_error, texthl = "Error" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = icons.diag_warn, texthl = "Warn" })
		vim.fn.sign_define("DiagnosticSignHint", { text = icons.diag_info, texthl = "Hint" })
		vim.fn.sign_define("DiagnosticSignHint", { text = icons.diag_hint, texthl = "Info" })

		vim.fn.sign_define("TODO", { text = " ", texthl = "Todo" })
		vim.fn.sign_define("PERF", { text = " ", texthl = "Performance" })

		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu, noinsert" },
			formatting = require("internals.cmp-menu-formatting"),
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Would like to use this, but conflicts with Copilot
				--['<Tab>'] = cmp.mapping.select_next_item(),
				--['<S-Tab>'] = cmp.mapping.select_prev_item(),

				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),

				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
