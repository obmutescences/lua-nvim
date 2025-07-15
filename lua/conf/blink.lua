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
		local m = vim.api.nvim_get_mode().mode
		return m == "i" -- 仅插入模式（含命令行补全）启用
	end,
	keymap = {
		-- set to 'none' to disable the 'default' preset
		preset = "none",

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },

		-- disable a keymap from the preset
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "select_and_accept", "fallback" },

		["<C-u>"] = { "select_prev", "fallback_to_mappings" },
		["<C-j>"] = { "select_next", "fallback_to_mappings" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },

		-- show with a list of providers
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},

	-- (Default) Only show the documentation popup when manually triggered
	completion = {
		ghost_text = {
			enabled = true,
		},
		documentation = { auto_show = true, auto_show_delay_ms = 700 },
		list = {
			max_items = 30,
			selection = { preselect = true, auto_insert = false },
		},
		menu = {
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
				treesitter = {},
				-- treesitter = { "lsp" },

				-- Components to render, grouped by column
				columns = { { "label", "label_description", gap = 2 }, { "kind_icon" } },
			},
		},
	},

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "buffer", "snippets", "path" },
	},

	-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
	-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
	-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
	--
	-- See the fuzzy documentation for more information
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
