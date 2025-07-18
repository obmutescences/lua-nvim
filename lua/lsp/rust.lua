vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {
		float_win_config = {

			-- the border that is used for floating windows
			---@see vim.api.nvim_open_win()
			---@type string[][] | string
			-- border = {
			-- 	{ "╭", "FloatBorder" },
			-- 	{ "─", "FloatBorder" },
			-- 	{ "╮", "FloatBorder" },
			-- 	{ "│", "FloatBorder" },
			-- 	{ "╯", "FloatBorder" },
			-- 	{ "─", "FloatBorder" },
			-- 	{ "╰", "FloatBorder" },
			-- 	{ "│", "FloatBorder" },
			-- }, -- maybe: 'double', 'rounded', 'shadow', 'single',
			border = nil,

			--- maximal width of floating windows. Nil means no max.
			---@type integer | nil
			max_width = nil,

			--- maximal height of floating windows. Nil means no max.
			---@type integer | nil
			max_height = nil,

			--- whether the window gets automatically focused
			--- default: false
			---@type boolean
			auto_focus = false,
		},
	},
	-- LSP configuration
	server = {
		standalone = true,
		capabilities = vim.lsp.protocol.make_client_capabilities(),
		on_attach = function(_, bufnr)
			-- you can also put keymaps in here
			-- vim.lsp.inlay_hint.enable(bufnr, true)
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<Cmd>lua require('telescope.builtin').lsp_definitions()<CR>",
				opts
			)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Tab>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>Telescope lsp_implementations<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>Lspsaga rename<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Space>ca", "<Cmd>RustLsp codeAction<CR>", opts)
		end,
		settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				lens = {
					enable = true,
					references = {
						adt = {
							enable = true,
						},
						enumVariant = {
							enable = true,
						},
						method = {
							enable = true,
						},
						trait = {
							enable = true,
						},
					},
				},
				check = {
					command = "clippy",
					features = "all",
				},
				checkOnSave = {
					enable = true,
					command = "clippy",
					extraArgs = { "--no-deps" },
				},
				cargo = {
					allFeatures = true,
					-- loadOutDirsFromCheck = true,
					runBuildScripts = true,
				},
				diagnostics = {
					enable = true,
					experimental = {
						enable = true,
					},
				},
				procMacro = {
					enable = true,
					ignored = {
						-- ["async-trait"] = { "async_trait" },
						-- ["napi-derive"] = { "napi" },
						-- ["async-recursion"] = { "async_recursion" },
					},
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
						enable = true,
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
						enable = true,
					},
					-- expressionAdjustmentHints = {
					-- 	enable = true
					-- },
					implicitDrops = {
						enable = true,
					},
					renderColons = true,
				},
				semanticHighlighting = {
					operator = {
						enable = true,
						specialization = {
							enable = true,
						},
					},
					punctuation = {
						enable = true,
						specialization = {
							enable = true,
						},
					},
				},
			},
		},
		-- DAP configuration
		dap = {},
	},
}
