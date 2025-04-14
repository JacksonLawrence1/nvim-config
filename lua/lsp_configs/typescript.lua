-- local function set_typescript_keymaps(client, bufnr)
--   -- Organize Imports
--   utils.set_keymap({
--     key = '<leader>oi',
--     cmd = function()
--       client:exec_cmd({
--         command = "_typescript.organizeImports",
--         arguments = { vim.api.nvim_buf_get_name(bufnr) }
--       })
--     end,
--     desc = "Organize Imports",
--     bufnr = bufnr,
--   })
-- end

local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

return {
  cmd = { "typescript-language-server" },
  filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_markers = { 'tsconfig.json', 'package.json', 'jsconfig.json', '.git' },
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    }
  },
}
