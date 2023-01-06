local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("null-ls not found!")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,     -- for lua
		-- formatting.gofmt,       -- for golang

    -- diagnostics.flake8,

		completion.spell,
	},
  -- you can reuse a shared lspconfig on_attach callback here
})

require("mason-null-ls").setup({
    ensure_installed = { "stylua"}
})
