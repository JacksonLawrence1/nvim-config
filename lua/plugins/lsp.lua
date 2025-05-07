return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- autocomplete
		"saghen/blink.cmp",

		-- Bottom left lsp notifications
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		local cfg = function(config)
			return require("lsp_configs." .. config)
		end

		-- Load global lsp config (diagnostics, keybinds)
		cfg("global")

		-- Load any custom configs in /lsp/ directory
		-- NOTE: server name must be valid in :Mason 
		local servers = {
			lua_ls = cfg("lua"), -- Lua
			ts_ls = cfg("typescript"), -- Typescript
		}

		-- Install necessary tools (formatters + linters)
		local ensure_installed = vim.tbl_keys(servers)

		-- Servers without a custom config
		-- NOTE: Some servers also require package managers
		-- E.g. go = go, python = pip, js = node
		vim.list_extend(ensure_installed, {
			-- LSPs
			"pyright",
			"gopls",
			"html",
			"cssls",
			"tailwindcss",
			"svelte",

			-- Formatters
			"stylua",
			"black", -- for python
			"prettierd", -- faster than prettier
			"rustywind", -- ordering tailwind classes

			-- Linters
			"eslint_d",
		})

		-- Install required dependencies
		require("mason").setup()
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
