vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
	},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
		end,
		settings = {
			-- rust-analyzer language server configuration
			['rust-analyzer'] = {
				lens = {
					enable = true,
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
				},
				cargo = {
					allFeatures = true,
				},
				inlayHints = {
					bindingModeHints = {
						enable = true,
					},
					typeHints = {
						enable = true,
						hideClosureInitialization = false,
						hideNamedConstructor = false,
					},
					chainingHints = {
						enable = true,
					},
					closingBraceHints = {
						enable = true,
						minLines = 25,
					},
					closureReturnTypeHints = {
						enable = "never",
					},
					lifetimeElisionHints = {
						enable = "never",
						useParameterNames = false,
						maxLength = 25,
					},
					parameterHints = {
						enable = true,
					},
					reborrowHints = {
						enable = "never",
					},
					renderColons = true,
				}
			},
		},
		-- DAP configuration
		dap = {
		},
	}
}

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})
