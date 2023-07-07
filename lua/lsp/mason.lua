local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

-- pylsp pyright ruff_lsp
local servers = { "bashls", "jsonls", "dockerls", "golangci_lint_ls", "gopls", "yamlls", "rust_analyzer", "tsserver",
	"vuels", "lua_ls", "pylsp", "pyright" }

-- Here we declare which settings to pass to the mason, and also ensure servers are installed. If not, they will be installed automatically.
local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
		keymaps = {
			install_package = "I",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "a",
		}
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
	ensure_installed = servers,
	automatic_installation = true,
}

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
	if server == "rust_analyzer" then
		local rust_opts = require "lsp.rust"
		-- opts = vim.tbl_deep_extend("force", rust_opts, opts)
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
			return
		end

		rust_tools.setup(rust_opts)
		goto continue
	end
	if server == "pylsp" then
		opts.settings = {
			pylsp = {
				configurationSources = { 'ruff' },
				plugins = {
					pycodestyle = {
						ignore = { 'W391' },
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
					mccabe = {
						enabled = false,
					},
					-- rope_autoimport = {
					-- 	enabled = true,
					-- 	memory = true,
					-- },
					-- rope_completion = {
					-- 	enabled = true
					-- },
					pyflakes = {
						enabled = false
					},
					ruff = {
						enabled = true,
						lineLength = 120,
					}

				}
			}
		}
	end

	lspconfig[server].setup(opts)
	::continue::
end

require "lsp_signature".on_attach()
