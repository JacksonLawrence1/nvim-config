return {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      -- runtime = {
      --   version = "LuaJIT"
      -- },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}
