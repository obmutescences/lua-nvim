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
	"lua_ls",
	"vue_ls",
	"vtsls",
	-- "basedpyright",
	"ruff",
	"ty",
	"pylsp",
	"pyrefly",
}

-- Here we declare which settings to pass to the mason, and also ensure servers are installed. If not, they will be installed automatically.
local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "",
			package_pending = "◍",
			package_uninstalled = "",
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

local handlers = {
	["textDocument/hover"] = function()
		vim.lsp.buf.hover({ border = "none" })
	end,
	-- ["textDocument/signatureHelp"] = function()
	-- 	vim.lsp.buf.signature_help({ border = "none" })
	-- end,
}

vim.lsp.config("*", {
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
	handlers = handlers,
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
		handlers = handlers,
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
						enabled = false,
						lineLength = 120,
					},
					jedi_completion = { enabled = true },
					jedi_definition = { enabled = true },
					jedi_hover = { enabled = true },
					jedi_references = { enabled = false },
					jedi_signature_help = { enabled = true },
					jedi_symbols = { enabled = true },
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
					isort = { enabled = true },
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
		-- lspconfig.golangci_lint_ls.setup({
		-- 	filetypes = { "go", "gomod" },
		-- })
		opts.settings = {
			golangci_lint_ls = {
				filetypes = { "go", "gomod" },
			},
		}
	end

	if server == "pyrefly" then
		opts.settings = {
			pyrefly = {
				cmd = { "uv", "pyrefly", "lsp" },
			},
		}
	end

	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
	-- lspconfig[server].setup(opts)
	-- ::continue::
end

local vue_language_server_path =
	"~/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
local vtsls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
local vue_ls_config = {
	on_init = function(client)
		client.handlers["tsserver/request"] = function(_, result, context)
			local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
			if #clients == 0 then
				vim.notify("Could not found `vtsls` lsp client, vue_lsp would not work with it.", vim.log.levels.ERROR)
				return
			end
			local ts_client = clients[1]

			local param = unpack(result)
			local id, command, payload = unpack(param)
			ts_client:exec_cmd({
				command = "typescript.tsserverRequest",
				arguments = {
					command,
					payload,
				},
				title = "",
			}, { bufnr = context.bufnr }, function(_, r)
				local response = r and r.body
				local response_data = { { id, response } }
				---@diagnostic disable-next-line: param-type-mismatch
				client:notify("tsserver/response", response_data)
			end)
		end
	end,
}
-- nvim 0.11 or above
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.enable({ "vtsls", "vue_ls" })

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
	automatic_enable = false,
})
