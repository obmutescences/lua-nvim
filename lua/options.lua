-- Providers
vim.g.python3_host_prog = '/opt/homebrew/Cellar/python@3.10/3.10.5/bin/python3.10'
vim.g.python_host_prog = '/opt/homebrew/Cellar/python@3.10/3.10.5/bin/python3.10'


--system--
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'


--editor--

vim.o.cursorline = true
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
vim.o.lazyredraw = true
vim.o.visualbell = true

vim.o.tabstop      = 4
vim.o.softtabstop  = 4
vim.o.shiftwidth   = 4
-- vim.o.scrolloff    = 4
vim.o.ttimeoutlen  = 0
vim.o.tw           = 0
-- vim.o.foldlevel    = 99
vim.o.re           = 1
-- vim.o.synmaxcol    = 80
-- vim.o.colorcolumn = '60'
vim.o.viewoptions  = 'cursor,folds,slash,unix'
vim.o.indentexpr   = ''
vim.o.foldmethod   = 'indent'
-- vim.o.foldmethod   = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.inccommand   = 'split'
vim.o.completeopt  = 'longest,noinsert,menuone,noselect,preview'
-- vim.o.virtualedit  = 'block'
vim.opt.formatoptions:remove('tc')
vim.opt.shortmess:append('tc')
vim.opt.synmaxcol = 2048


vim.g.neoterm_autoscroll = 1
vim.g.notimeout = true
vim.g.noshowmode = true
-- vim.g.updatetime = '1000'

-- floaterm
vim.g.floaterm_keymap_new = '<Leader>ft'
vim.g.floaterm_keymap_kill = '<Leader>fk'
vim.g.floaterm_keymap_toggle = '<F12>'


-- neovide

-- set guifont=CodeNewRoman\ Nerd\ Font\ Mono:h14:b:cANSI
-- vim.g.guifont = 'CodeNewRoman\\ Nerd\\ Font\\ Mono:h15:cANSI'
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 800.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 30.0
vim.g.neovide_cursor_vfx_particle_speed = 50.0
vim.g.neovide_cursor_trail_length = 1.0
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_hide_mouse_when_typing = 1
vim.g.neovide_floating_blur = 1
vim.g.neovide_floating_opacity = 0.3
vim.g.neovide_floating_blur_amount_x = 5
vim.g.neovide_floating_blur_amount_y = 10
-- vim.g.neovide_fullscreen= true

-- lint: ale

-- vim.g.ale_lint_on_text_changed = "never"
-- vim.g.ale_lint_on_insert_leave = 0
-- vim.g.ale_lint_on_enter = 0
-- vim.g.ale_fix_on_save = 1
-- vim.g.ale_set_highlights = 0

-- rust
vim.g.rustfmt_autosave = 1

