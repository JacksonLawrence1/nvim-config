return {
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			"folke/lazydev.nvim",
			"rafamadriz/friendly-snippets",
		},
		version = "*", -- Release tag - auto downloads frizbee (rust fuzzy finder) if not installed

		-- Add type hints
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			appearance = {
				nerd_font_variant = "mono",
			},
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			completion = {
				ghost_text = { enabled = true },
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				trigger = {
					show_on_blocked_trigger_characters = {},
				},
				list = {
					selection = {
						preselect = true,
						auto_insert = false,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" }, -- Add color to list items
					},
				},
			},
			fuzzy = { implementation = "prefer_rust" },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer", "html-css" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
                    -- Source from cwd instead of file path
					path = {
						opts = {
							get_cwd = function(_)
								return vim.fn.getcwd()
							end,
						},
					},
                    -- Automatically show on new line
					lsp = {
						override = {
							get_trigger_characters = function(self)
								local trigger_characters = self:get_trigger_characters()
								vim.list_extend(trigger_characters, { "\n", "\t", " " })
								return trigger_characters
							end,
						},
					},
                    -- html-css completions
                    ["html-css"] = {
                      name = "html-css",
                      module = "blink.compat.source"
                    }
				},
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
