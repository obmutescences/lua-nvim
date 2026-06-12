-- Parser management and highlighting are handled by tree-sitter-manager plugin.
-- This file only enables additional treesitter features.

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash", "json", "lua", "python", "go",
		"vim", "gomod", "toml", "yaml", "vue",
		"html", "http", "javascript", "rust",
		"markdown", "markdown_inline", "typescript",
		"proto", "sql", "regex", "gowork", "gosum",
		"gotmpl", "comment", "latex", "typst",
	},
	callback = function()
		-- treesitter-based folding (built into Neovim)
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldmethod = "expr"
	end,
})
