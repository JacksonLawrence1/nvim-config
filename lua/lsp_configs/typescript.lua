-- TODO: fix organizeImports cmd
vim.keymap.set("n", "<leader>oi", function()
	-- Need get correct client
	local client = vim.lsp.get_client_by_id(0)

	if client then
		client:exec_cmd({
			title = "[O]rganize [I]mports",
			command = "_typescript.organizeImports",
			-- Ensure this points to relevant buffers
			arguments = { vim.api.nvim_buf_get_name(0) },
		})
	end
end)

local inlayHints = {
	includeInlayParameterNameHints = "all",
	includeInlayFunctionParameterTypeHints = true,
	includeInlayVariableTypeHints = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayEnumMemberValueHints = true,
}

return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
	root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
	settings = {
		typescript = {
			inlayHints = inlayHints,
		},
		javascript = {
			inlayHints = inlayHints,
		},
	},
}
