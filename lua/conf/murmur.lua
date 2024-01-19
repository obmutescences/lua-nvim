require("murmur").setup({
	cursor_rgb = {
		guibg = "#263C05",
	},
	cursor_rgb_always_use_config = true, -- if set to `true`, then always use `cursor_rgb`.
	-- yank_blink = {
	--   enabled = true,
	--   on_yank = nil, -- Can be customized. See `:h on_yank`.
	-- },
	max_len = 40,
	min_len = 3, -- this is recommended since I prefer no cursorword highlighting on `if`.
	exclude_filetypes = {},
	callbacks = {
		-- to trigger the close_events of vim.diagnostic.open_float.
		function()
			-- Close floating diag. and make it triggerable again.
			vim.cmd("doautocmd InsertEnter")
			vim.w.diag_shown = false
		end,
	},
})
