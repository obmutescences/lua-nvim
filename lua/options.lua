-- Providers
vim.g.python3_host_prog = '/opt/homebrew/Cellar/python@3.10/3.10.8/bin/python3.10'
vim.g.python_host_prog = '/opt/homebrew/Cellar/python@3.10/3.10.8/bin/python3.10'


--system--
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'


--editor--

vim.o.cursorline = true
vim.o.number = true
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

vim.o.tabstop     = 4
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4
-- vim.o.scrolloff    = 4
vim.o.ttimeoutlen = 0
vim.o.tw          = 0
-- vim.o.foldlevel    = 99
vim.o.re          = 1
-- vim.o.synmaxcol    = 80
-- vim.o.colorcolumn = '60'
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.indentexpr  = ''
vim.o.foldmethod  = 'indent'
-- vim.o.foldmethod   = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.inccommand  = 'split'
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
-- vim.o.virtualedit  = 'block'
vim.opt.formatoptions:remove('tc')
vim.opt.shortmess:append('tc')
vim.opt.synmaxcol = 2048


vim.g.neoterm_autoscroll = 1
vim.g.notimeout = true
vim.g.noshowmode = true
-- vim.g.updatetime = '1000'


-- neovide

-- set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h14:b:cANSI
-- vim.g.guifont = 'CodeNewRoman\\ Nerd\\ Font\\ Mono:h15:cANSI'
vim.g.neovide_refresh_rate = 75
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 800.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 40.0
vim.g.neovide_cursor_vfx_particle_speed = 40.0
vim.g.neovide_cursor_trail_length = 1.0
vim.g.neovide_cursor_animation_length = 0.1
vim.g.neovide_hide_mouse_when_typing = 1
vim.g.neovide_scroll_animation_length = 0.15
vim.g.neovide_floating_blur = 1
vim.g.neovide_floating_opacity = 0.2
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 4.0
-- vim.g.neovide_transparency=0.8
-- vim.g.transparency = 0.9
-- vim.g.neovide_fullscreen= true

-- lint: ale

-- vim.g.ale_lint_on_text_changed = "never"
-- vim.g.ale_lint_on_insert_leave = 0
-- vim.g.ale_lint_on_enter = 0
-- vim.g.ale_fix_on_save = 0
-- vim.g.ale_set_highlights = 0
-- vim.g.ale_rust_cargo_use_check = 0
-- vim.g.ale_set_loclist = 0
-- vim.g.ale_set_quickfix = 0
-- vim.g.ale_open_list = 0
-- vim.g.ale_keep_list_window_open = 0
-- vim.g.ale_sign_column_always = 1
-- vim.g.ale_sign_error = '✗'
-- vim.g.ale_sign_warning = ''

-- rust
vim.g.rustfmt_autosave = 1
