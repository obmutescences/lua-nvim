require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		go = {},
		python = {
			-- To fix lint errors.
			"ruff_fix",
			-- To run the Ruff formatter.
			"ruff_format",
		},
		["javascript"] = { "prettier" },
		["javascriptreact"] = { "prettier" },
		["typescript"] = { "prettier" },
		["typescriptreact"] = { "prettier" },
		["vue"] = { "prettier" },
		["css"] = { "prettier" },
		["scss"] = { "prettier" },
		["less"] = { "prettier" },
		["html"] = { "prettier" },
		["json"] = { "prettier" },
		["jsonc"] = { "prettier" },
		["yaml"] = { "prettier" },
		["markdown"] = { "prettier" },
		["markdown.mdx"] = { "prettier" },
		["graphql"] = { "prettier" },
		["handlebars"] = { "prettier" },
	},
})
