vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
	},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			-- you can also put keymaps in here
			vim.lsp.inlay_hint.enable(bufnr)
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Tab>",
				'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		end,
		settings = {
			-- rust-analyzer language server configuration
			['rust-analyzer'] = {
				lens = {
					enable = true,
					references = {
						adt = {
							enable = true
						},
						enumVariant = {
							enable = true
						},
						method = {
							enable = true
						},
						trait = {
							enable = true
						}
					}
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
				},
				cargo = {
					allFeatures = true,
				},
				diagnostics = {
					enable = true,
					-- experimental = {
					-- 	enable = true
					-- }
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
						enable = true,
					},
					closureCaptureHints = {
						enable = true
					},
					lifetimeElisionHints = {
						enable = false,
						useParameterNames = false,
						maxLength = 25,
					},
					parameterHints = {
						enable = true,
					},
					-- reborrowHints = {
					-- 	enable = true,
					-- },
					discriminantHints = {
						enable = true
					},
					-- expressionAdjustmentHints = {
					-- 	enable = true
					-- },
					implicitDrops = {
						enable = true
					},
					renderColons = true,
				},
				semanticHighlighting = {
					operator = {
						enable = true,
						specialization = {
							enable = true,
						}
					},
					punctuation = {
						enable = true,
						specialization = {
							enable = true
						}
					}
				}
			},
		},
		-- DAP configuration
		dap = {
		},
	}
}
