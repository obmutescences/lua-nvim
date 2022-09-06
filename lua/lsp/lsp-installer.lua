local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("nvim-lspconfig not found!")
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)

	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
		flags = {
		  debounce_text_changes = 150,
		}
	}

	if server.name == "pyright" then
		local pyright_opts = require("lsp.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server.name == "rust_analyzer" then
		require("rust-tools").setup({
			tools = {
				reload_workspace_from_cargo_toml = true,
				inlay_hints = {
					auto = true,
					only_current_line = true,
					show_parameter_hints = true,
					other_hints_prefix = "-> ",
				}
			},
			server = {
				on_attach = opts.on_attach,
				cmd = { vim.fn.stdpath('data') .. "/lsp_servers/rust/rust-analyzer" };
			}
		})
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
