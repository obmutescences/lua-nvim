-- Providers
-- vim.g.python3_host_prog = "/home/zerone/projects/shuiyun/admin-backend/.venv/bin/python3"
-- vim.g.python_host_prog = "/home/zerone/projects/shuiyun/admin-backend/.venv/bin/python3"

--system--
vim.o.autochdir = true
vim.o.clipboard = "unnamedplus"

--editor--

vim.o.cursorline = true
-- vim.o.number = true
-- vim.bo.noexpandtab = true
vim.o.autoindent = true
vim.o.foldenable = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.smartcase = true
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.ignorecase = true
vim.o.ttyfast = true
-- vim.o.lazyredraw = true
vim.o.visualbell = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- vim.o.scrolloff    = 4
vim.o.ttimeoutlen = 0
vim.o.tw = 0
-- vim.o.re          = 1
vim.o.viewoptions = "cursor,folds,slash,unix"
vim.o.indentexpr = ""
vim.o.inccommand = "split"
vim.o.completeopt = "longest,noinsert,menuone,noselect,preview"
-- vim.opt.formatoptions:remove('tc')
-- vim.opt.shortmess:append('tc')
vim.opt.synmaxcol = 500
vim.opt.linespace = 6
-- vim.g.neoterm_autoscroll = 1
-- vim.g.notimeout = true
-- vim.g.noshowmode = true
-- vim.opt.updatetime = 50
vim.opt.fillchars = {
	vert = " ", -- 垂直分割线
	horiz = " ", -- 水平分割线
	horizup = " ", -- 上升的水平分割线
	horizdown = " ", -- 下降的水平分割线
	eob = " ", -- 空白处的 '~' 符号
}
vim.o.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- -- neovide
vim.g.neovide_refresh_rate = 180
vim.g.neovide_refresh_rate_idle = 180
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 5000
vim.g.neovide_cursor_vfx_particle_lifetime = 3.5
vim.g.neovide_cursor_vfx_particle_density = 50.0
vim.g.neovide_cursor_vfx_particle_speed = 15.0
vim.g.neovide_cursor_animation_length = 0.2
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_scroll_animation_length = 0.40

vim.g.neovide_floating_blur = 1
vim.g.neovide_floating_opacity = 1
vim.g.neovide_floating_blur_amount_x = 3.0
vim.g.neovide_floating_blur_amount_y = 3.0

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_floating_shadow = false
vim.g.neovide_padding_left = 30
vim.g.neovide_padding_top = 20
vim.g.neovide_transparency = 0.80
vim.g.neovide_normal_opacity = 0.55
vim.g.neovide_window_blurred = true
-- vim.g.transparency = 0
vim.g.neovide_input_ime = true
vim.g.neovide_profiler = false
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_text_gamma = 0
vim.g.neovide_text_contrast = 20
vim.g.neovide_position_animation_length = 0.45
vim.g.neovide_fullscreen = false
vim.g.neovide_floating_corner_radius = 0.6
vim.g.neovide_text_gamma = 1.5
vim.g.neovide_text_contrast = 0.0
vim.g.neovide_underline_stroke_scale = 0.5
-- vim.g.neovide_remember_window_size          = true

local uname = vim.loop.os_uname().sysname
local shortv = "<C-v>"
local shortc = "<C-c>"
if uname == "Darwin" then
	shortv = "<D-v>"
	shortc = "<D-c>"
end

if vim.g.neovide then
	vim.o.pumblend = 80
	vim.o.winblend = 80
	-- vim.keymap.set("n", "<D-s>", ":w<CR>")   -- Save
	vim.keymap.set("v", shortc, '"+y') -- Copy
	vim.keymap.set("n", shortv, '"+P') -- Paste normal mode
	vim.keymap.set("v", shortv, '"+P') -- Paste visual mode
	vim.keymap.set("c", shortv, "<C-R>+") -- Paste command mode
	vim.keymap.set("i", shortv, '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", shortv, "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", shortv, "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", shortv, "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", shortv, "<C-R>+", { noremap = true, silent = true })

-- ale
-- 只为 Go 启用 golangci-lint
vim.g.ale_fix_on_save = 0
vim.g.ale_set_loclist = 0
vim.g.ale_go_golangci_lint_package = 1
vim.g.ale_lint_on_text_changed = "never"
vim.g.ale_lint_on_insert_leave = 0
vim.g.ale_linters = {
	go = { "golangci-lint", "gofmt", "staticcheck", "govet" },
	-- rust = { "analyzer" },
	rust = {},
}
