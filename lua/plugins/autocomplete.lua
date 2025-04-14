return {
  'saghen/blink.cmp',
  dependencies = {
    "folke/lazydev.nvim"
  },
  version = '*', -- Release tag - auto downloads frizbee if not installed

  -- Get lazydev to add type hints
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = 'mono'
    },
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
    },
    completion = {
      ghost_text = { enabled = true },
      trigger = {
        show_on_blocked_trigger_characters = {},
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        }
      },
      menu = {
        draw = {
          treesitter = { 'lsp' }, -- Add color to list items
        }
      }
    },
    fuzzy = { implementation = "prefer_rust" },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        lsp = {
          override = {
            get_trigger_characters = function (self)
              local trigger_characters = self:get_trigger_characters()
              vim.list_extend(trigger_characters, { '\n', '\t', ' ' })
              return trigger_characters
            end
          }
        }
      },
    },
    signature = { enabled = true },
  },
  opts_extend = {"sources.default"},
}
