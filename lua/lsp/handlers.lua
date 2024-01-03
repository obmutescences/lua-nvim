local M = {}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

M.capabilities = capabilities
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TODO: backfill this to template
M.setup = function()
	-- local signs = {
	-- 	{ name = "DiagnosticSignError", text = " " },
	-- 	{ name = "DiagnosticSignWarn", text = " " },
	-- 	{ name = "DiagnosticSignHint", text = " " },
	-- 	{ name = "DiagnosticSignInfo", text = " " },
	-- }
	--
	-- for _, sign in ipairs(signs) do
	-- 	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	-- end

	local config = {
		-- disable virtual text
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "●",
			-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
			-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
			-- prefix = "icons",
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
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
	local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- if client.server_capabilities.document_highlight then
	local status_oks, illuminate = pcall(require, "illuminate")
	if not status_oks then
		return
	end
	illuminate.on_attach(client)
	-- end
end

-- local function lsp_highlight_document(client)
--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]] ,
--       false
--     )
--   end
-- end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>Lspsaga goto_definition<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>Lspsaga peek_definition<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Lspsaga finder<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>u", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-i>", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-n>", '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-i>", '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", '<cmd>Lspsaga incoming_calls<CR>', opts)
	-- -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", '<cmd>Lspsaga outgoing_calls<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", '<cmd>Telescope lsp_incoming_calls<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", '<cmd>Telescope lsp_outgoing_calls<CR>', opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)

	-- add outline support for evey lanuage
	require("lsp_signature").on_attach()

	-- navigator
	require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
	require("navigator.dochighlight").documentHighlight(bufnr)
	require("navigator.codeAction").code_action_prompt(bufnr)

	require("lsp-inlayhints").on_attach(client, bufnr)
end

return M
