local blend = vim.g.neovide and 90 or 10

require("blink.cmp").setup({
	-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
	-- 'super-tab' for mappings similar to vscode (tab to accept)
	-- 'enter' for enter to accept
	-- 'none' for no mappings
	--
	-- All presets have the following mappings:
	-- C-space: Open menu or open docs if already open
	-- C-n/C-p or Up/Down: Select next/previous item
	-- C-e: Hide menu
	-- C-k: Toggle signature help (if signature.enabled = true)
	--
	-- See :h blink-cmp-config-keymap for defining your own keymap
	enabled = function()
		return vim.api.nvim_get_mode().mode == "i" -- 仅插入模式启用（命令行补全已单独禁用）
	end,
	keymap = {
		-- set to 'none' to disable the 'default' preset
		preset = "enter",
		-- 自定义覆盖（合并进 preset，同名键覆盖）：
		-- Tab: 菜单可见时选中下一个（preselect=false 时第一次 Tab 即选中第一项）
		--      -> 否则跳 snippet -> 否则插入字面 Tab
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		-- CR: 有选中则接受选中项，无选中则接受第一项
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
		-- ["<Up>"] = { "select_prev", "fallback" },
		-- ["<Down>"] = { "select_next", "fallback" },
		-- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
		-- ["<C-j>"] = { "scroll_documentation_down", "fallback" },
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		ghost_text = {
			enabled = false,
		},
		documentation = { auto_show = true, auto_show_delay_ms = 700 },
		list = {
			max_items = 30,
			selection = {
				-- 不自动选中第一项：菜单弹出后无选中，用 Tab 选中
				preselect = false,
				-- 选中时不自动插入/预览到缓冲区（避免"选了第一个但实际没补全"）
				auto_insert = true,
			},
		},
		-- accept = { auto_brackets = { enabled = true } },
		menu = {
			-- 输入满 2 个字符才自动弹出补全菜单（手动 <C-space> 不受此限制）
			-- auto_show = function(ctx)
			-- 	return #ctx.get_keyword() >= 2
			-- end,
			winblend = blend,
			scrollbar = false,
			draw = {
				align_to = "label", -- or 'none' to disable, or 'cursor' to align to the cursor
				-- Left and right padding, optionally { left, right } for different padding on each side
				padding = 1,
				-- Gap between columns
				gap = 2,
				-- Priority of the cursorline highlight, setting this to 0 will render it below other highlights
				cursorline_priority = 10000,
				-- Use treesitter to highlight the label text for the given list of sources
				-- treesitter = {},
				treesitter = { "lsp" },

				-- Components to render, grouped by column
				columns = { { "label", "label_description", gap = 2 }, { "kind_icon", "kind", gap = 1 } },
			},
		},
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "buffer", "path", "snippets" },
	},

	cmdline = {
		enabled = false,
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "rust" },
})
