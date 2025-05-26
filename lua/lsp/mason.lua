local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

-- pylsp pyright ruff_lsp
local servers = {
	"bashls",
	"jsonls",
	"dockerls",
	"gopls",
	"golangci_lint_ls",
	"yamlls",
	-- "vue_ls",
	"lua_ls",
	-- "buf",
	"ts_ls",
	"vue_ls",
	-- "pylsp",
	-- "ruff_lsp",
	"basedpyright",
	-- "pyright",
	"ruff",
}

-- Here we declare which settings to pass to the mason, and also ensure servers are installed. If not, they will be installed automatically.
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		keymaps = {
			install_package = "I",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "a",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	server = vim.split(server, "@")[1]
	if server == "lua_ls" then
		opts.settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
			},
		}
	end
	if server == "basedpyright" then
		opts.settings = {
			basedpyright = {
				typeCheckingMode = "strict",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				autoImportCompletions = true,
				analysis = {
					diagnosticSeverityOverrides = {
						-- reportMissingParameterType = false,
						reportUnknownParameterType = false,
						strictDictionaryInference = false,
						reportExplicitAny = false,
					},
				},
			},
		}
	end
	if server == "pylsp" then
		opts.settings = {
			pylsp = {
				-- configurationSources = { "ruff" },
				plugins = {
					pycodestyle = {
						ignore = { "W391" },
						maxLineLength = 120,
						enabled = false,
					},
					autopep8 = {
						enabled = false,
					},
					flake8 = {
						enabled = false,
						maxLineLength = 120,
					},
					ruff = {
						enabled = true,
						lineLength = 120,
					},
					jedi_completion = { enabled = true },
					jedi_definition = { enabled = false },
					jedi_hover = { enabled = false },
					jedi_references = { enabled = false },
					jedi_signature_help = { enabled = false },
					jedi_symbols = { enabled = false },
					mccabe = { enabled = false },
					preload = { enabled = false },
					pydocstyle = { enabled = false },
					pyflakes = { enabled = false },
					pylint = { enabled = false },
					rope_autoimport = {
						enabled = true,
						completions = {
							enabled = false,
						},
						code_actions = {
							enabled = true,
						},
					},
					rope_completion = { enabled = false },
					yapf = { enabled = false },
					-- -- import sorting
					isort = { enabled = false },
				},
			},
		}
	end
	if server == "golangci_lint_ls" then
		local configs = require("lspconfig/configs")
		if not configs.golangcilsp then
			configs.golangcilsp = {
				default_config = {
					cmd = { "golangci-lint-langserver" },
					root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
					init_options = {
						command = {
							"golangci-lint",
							"run",
							"--output.json.path",
							"stdout",
							"--show-stats=false",
							"--issues-exit-code=1",
						},
					},
				},
			}
		end
		lspconfig.golangci_lint_ls.setup({
			filetypes = { "go", "gomod" },
		})
	end
	if server == "vue_ls" then
		lspconfig.vue_ls.setup({
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			init_options = {
				vue = {
					hybridMode = false,
				},
				typescript = {
					tsdk = "~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib",
				},
			},
		})
	end

	lspconfig[server].setup(opts)
	-- ::continue::
end
