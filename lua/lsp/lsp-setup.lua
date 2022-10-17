
local vim = vim

local function default_config()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = false,
		float = {
			focusable = false,
			-- close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			-- scope = 'cursor',
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- local function lsp_keymaps(bufnr)
-- 	local opts = { noremap = true, silent = true }
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- 	vim.api.nviu_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>u", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- 	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-i>", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- 	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- 	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
-- end

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- vim.api.nviu_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>Telescope lsp_references<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>u", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-i>", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

	local status_oks, illuminate = pcall(require, "illuminate")
	if not status_oks then
		return
	end
	illuminate.on_attach(client)

end

-- local function lsp_highlight_document(client)
-- 	-- if client.server_capabilities.document_highlight then
-- 	local status_oks, illuminate = pcall(require, "illuminate")
-- 	if not status_oks then
-- 		return
-- 	end
-- 	illuminate.on_attach(client)
-- 	-- end
-- end

default_config()

local c = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, lsp_setup = pcall(require, "lsp-setup")
if not status_cmp_ok then
	return
end

local lsp_setup_config = {
	-- Default mappings
	-- gD = 'lua vim.lsp.buf.declaration()',
	-- gd = 'lua vim.lsp.buf.definition()',
	-- gt = 'lua vim.lsp.buf.type_definition()',
	-- gi = 'lua vim.lsp.buf.implementation()',
	-- gr = 'lua vim.lsp.buf.references()',
	-- K = 'lua vim.lsp.buf.hover()',
	-- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
	-- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
	-- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
	-- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
	-- ['<space>e'] = 'lua vim.diagnostic.open_float()',
	-- ['[d'] = 'lua vim.diagnostic.goto_prev()',
	-- [']d'] = 'lua vim.diagnostic.goto_next()',
	default_mappings = true,
	-- Custom mappings, will overwrite the default mappings for the same key
	-- Example mappings for telescope pickers:
	-- gd = 'lua require"telescope.builtin".lsp_definitions()',
	-- gi = 'lua require"telescope.builtin".lsp_implementations()',
	-- gr = 'lua require"telescope.builtin".lsp_references()',
	mappings = {},
	-- Global on_attach
	on_attach = function(client, bufnr)
		-- Support custom the on_attach function for global
		-- Formatting on save as default
		require('lsp-setup.utils').format_on_save(client)
		-- lsp_keymaps(bufnr)
		-- lsp_highlight_document(client)

		-- -- add outline support for evey lanuage
		-- require "lsp_signature".on_attach()
	end,
	-- Global capabilities
	capabilities = vim.lsp.protocol.make_client_capabilities(),
	-- Configuration of LSP servers
	servers = {
		rust_analyzer = require('lsp-setup.rust-tools').setup({
			tools = {
				executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
				reload_workspace_from_cargo_toml = true,
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "<-",
					other_hints_prefix = "-->",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 10,
					highlight = "Comment",
				},
				hover_actions = {
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
					auto_focus = true,
				},
			},
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(c),
				on_attach = on_attach,
				settings = {
					['rust-analyzer'] = {
						cargo = {
							loadOutDirsFromCheck = true,
							allFeatures = true,
						},
						procMacro = {
							enable = true,
						},
						checkOnSave = {
							-- default: `cargo check`
							command = "clippy"
						},
					},
				},
			},
		})
		-- Install LSP servers automatically
		-- LSP server configuration please see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		-- pylsp = {},
		-- rust_analyzer = {
		--     settings = {
		--         ['rust-analyzer'] = {
		--             cargo = {
		--                 loadOutDirsFromCheck = true,
		--             },
		--             procMacro = {
		--                 enable = true,
		--             },
		--         },
		--     },
		-- },
	},
}

lsp_setup.setup(lsp_setup_config)
require('lspconfig')["sumneko_lua"].setup{
    on_attach = on_attach,
}
require('lspconfig')["gopls"].setup{
    on_attach = on_attach,
}
require('lspconfig')["pyright"].setup{
    on_attach = on_attach,
}
require "lsp_signature".on_attach()
