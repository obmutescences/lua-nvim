local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end
--require'luasnip'.filetype_extend("go", {"go"})
--require'luasnip'.filetype_extend("python", {"python"})
--require'luasnip'.filetype_extend("rust", {"rust"})

---when inside a snippet, seeks to the nearest luasnip field if possible, and checks if it is jumpable
---@param dir number 1 for forward, -1 for backward; defaults to 1
---@return boolean true if a jumpable luasnip field is found while inside a snippet
local function jumpable(dir)
	local luasnip_ok, luasnip = pcall(require, "luasnip")
	if not luasnip_ok then
		return
	end

	local win_get_cursor = vim.api.nvim_win_get_cursor
	local get_current_buf = vim.api.nvim_get_current_buf

	local function inside_snippet()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
		return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
	end

	---sets the current buffer's luasnip to the one nearest the cursor
	---@return boolean true if a node is found, false otherwise
	local function seek_luasnip_cursor_node()
		-- for outdated versions of luasnip
		if not luasnip.session.current_nodes then
			return false
		end

		local pos = win_get_cursor(0)
		pos[1] = pos[1] - 1
		local node = luasnip.session.current_nodes[get_current_buf()]
		if not node then
			return false
		end

		local snippet = node.parent.snippet
		local exit_node = snippet.insert_nodes[0]

		-- exit early if we're past the exit node
		if exit_node then
			local exit_pos_end = exit_node.mark:pos_end()
			if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		node = snippet.inner_first:jump_into(1, true)
		while node ~= nil and node.next ~= nil and node ~= snippet do
			local n_next = node.next
			local next_pos = n_next and n_next.mark:pos_begin()
			local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
				or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

			-- Past unmarked exit node, exit early
			if n_next == nil or n_next == snippet.next then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end

			if candidate then
				luasnip.session.current_nodes[get_current_buf()] = node
				return true
			end

			local ok
			ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
			if not ok then
				snippet:remove_from_jumplist()
				luasnip.session.current_nodes[get_current_buf()] = nil

				return false
			end
		end

		-- No candidate, but have an exit node
		if exit_node then
			-- to jump to the exit node, seek to snippet
			luasnip.session.current_nodes[get_current_buf()] = snippet
			return true
		end

		-- No exit node, exit from snippet
		snippet:remove_from_jumplist()
		luasnip.session.current_nodes[get_current_buf()] = nil
		return false
	end

	if dir == -1 then
		return inside_snippet() and luasnip.jumpable(-1)
	else
		return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
	end
end

---checks if emmet_ls is available and active in the buffer
---@return boolean true if available, false otherwise
local is_emmet_active = function()
	local clients = vim.lsp.get_clients()

	for _, client in pairs(clients) do
		if client.name == "emmet_ls" then
			return true
		end
	end
	return false
end

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
	return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets
require("luasnip.loaders.from_vscode").load({
	paths = { -- load custom snippets
		vim.fn.stdpath("config") .. "/my-snippets",
	},
}) -- Load snippets from my-snippets folder

local lspkind = require("lspkind")

local buffer_option = {
	-- Complete from all visible buffers (splits)
	get_bufnrs = function()
		local bufs = {}
		for _, win in ipairs(vim.api.nvim_list_wins()) do
			bufs[vim.api.nvim_win_get_buf(win)] = true
		end
		return vim.tbl_keys(bufs)
	end,
}

cmp_config = {
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	completion = {
		---@usage The minimum length of a word to complete on.
		keyword_length = 1,
		completeopt = "menu,menuone,noinsert",
		-- completeopt = "menu,noselect",
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	view = {
		entries = "centered",
	},
	preselect = cmp.PreselectMode.None,
	formatting = {
		fields = { "abbr", "kind", "menu" },
		kind_icons = {
			Class = " ",
			Color = " ",
			Constant = "ﲀ ",
			Constructor = " ",
			Enum = "練",
			EnumMember = " ",
			Event = " ",
			Field = " ",
			File = "",
			Folder = " ",
			Function = " ",
			Interface = "ﰮ ",
			Keyword = " ",
			Method = " ",
			Module = " ",
			Operator = "",
			Property = " ",
			Reference = " ",
			Snippet = " ",
			Struct = " ",
			Text = " ",
			TypeParameter = " ",
			Unit = "塞",
			Value = " ",
			Variable = " ",
		},
		source_names = {
			nvim_lsp = "[LSP]",
			-- emoji = "[Emoji]",
			path = "[Path]",
			-- calc = "(Calc)",
			-- cmp_tabnine = "(Tabnine)",
			-- vsnip = "(Snippet)",
			-- luasnip = "(Snippet)",
			buffer = "[Buffer]",
			spell = "[Spell]",
		},
		duplicates = {
			buffer = 0,
			path = 1,
			nvim_lsp = 1,
			-- luasnip = 0,
			-- vsnip = 0,
			cmp_tabnine = 1,
		},
		duplicates_default = 0,
		format = lspkind.cmp_format({
			maxwidth = 30,
			ellipsis_char = "...",
			mode = "symbol_text",
			before = function(entry, vim_item)
				vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
				vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
					or cmp_config.formatting.duplicates_default
				return vim_item
			end,
		}),
	},
	sorting = {
		priority_weight = 1.0,
		comparators = {
			cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
			cmp.config.compare.locality,
			cmp.config.compare.recently_used,
			cmp.config.compare.offset,
			cmp.config.compare.order,
			cmp.config.compare.kind,
			cmp.config.compare.exact,
			-- cmp.config.compare.offset,
			-- cmp.config.compare.order,
			-- cmp.config.compare.score,
			-- -- cmp.config.compare.sort_text,
			cmp.config.compare.length,
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({ border = "none" }),
		documentation = cmp.config.window.bordered({ border = "none" }),
	},
	sources = cmp.config.sources({
		-- { name = "cmp_tabnine", priority = 10 },
		{
			name = "nvim_lsp",
			priority = 9,
			entry_filter = function(entry)
				return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
			end,
		},
		{
			name = "buffer",
			keyword_length = 2,
			priority = 7,
			option = buffer_option,
		},
		-- { name = "nvim_lsp_signature_help", priority = 3 },
		-- { name = "nvim_lua", priority = 5 },
		-- { name = "path", priority = 4 },
		-- {
		-- 	name = "luasnip",
		-- 	priority = 2,
		-- 	keyword_length = 2,
		-- },
		-- { name = "emoji" },
		-- { name = "treesitter" },
		{ name = "crates" },
		-- { name = "calc" },
	}),
	mapping = cmp.mapping.preset.insert({
		["<C-u>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-p>"] = cmp.config.disable,
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- elseif luasnip.expandable() then
				-- 	luasnip.expand()
			elseif jumpable(0) then
				luasnip.jump(1)
			elseif check_backspace() then
				fallback()
			elseif is_emmet_active() then
				return vim.fn["cmp#complete"]()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
}
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = 'cmdline' }
-- 	}, {
-- 		{ name = 'path' }
-- 	})
-- })

-- disable autocompletion for guihua
vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")

cmp.setup(cmp_config)
