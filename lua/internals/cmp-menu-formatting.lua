local source_mapping = {
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  buffer = "[Buffer]",
  path = "[Path]",
  luasnip = "[Snip]",
}

return {
  expandable_indicator = true,
  fields = { "abbr", "kind", "menu" },
  format = function(entry, vim_item)
    if entry.source.name == "html-css" then
      source_mapping["html-css"] = entry.completion_item.menu
    end

    vim_item.menu = source_mapping[entry.source.name]
    return vim_item
  end,
}
