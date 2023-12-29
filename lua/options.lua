-- Providers
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog = '/usr/bin/python3'


--system--
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'


--editor--

vim.o.cursorline                            = true
-- vim.o.number = true
-- vim.bo.noexpandtab = true
vim.o.autoindent                            = true
vim.o.foldenable                            = false
vim.o.splitright                            = true
vim.o.splitbelow                            = true
vim.o.smartcase                             = true
vim.o.showcmd                               = true
vim.o.wildmenu                              = true
vim.o.ignorecase                            = true
vim.o.ttyfast                               = true
-- vim.o.lazyredraw = true
vim.o.visualbell                            = true
vim.o.tabstop                               = 4
vim.o.softtabstop                           = 4
vim.o.shiftwidth                            = 4
-- vim.o.scrolloff    = 4
vim.o.ttimeoutlen                           = 0
vim.o.tw                                    = 0
-- vim.o.re          = 1
vim.o.viewoptions                           = 'cursor,folds,slash,unix'
vim.o.indentexpr                            = ''
vim.o.inccommand                            = 'split'
vim.o.completeopt                           = 'longest,noinsert,menuone,noselect,preview'
-- vim.opt.formatoptions:remove('tc')
-- vim.opt.shortmess:append('tc')
vim.opt.synmaxcol                           = 500
vim.opt.linespace                           = 6
-- vim.g.neoterm_autoscroll = 1
-- vim.g.notimeout = true
-- vim.g.noshowmode = true
-- vim.opt.updatetime = 50

-- -- neovide
vim.g.neovide_refresh_rate                  = 240
vim.g.neovide_refresh_rate_idle             = 240
vim.g.neovide_no_idle                       = true
vim.g.neovide_cursor_vfx_mode               = "pixiedust"
vim.g.neovide_cursor_vfx_opacity            = 5000
vim.g.neovide_cursor_vfx_particle_lifetime  = 3.5
vim.g.neovide_cursor_vfx_particle_density   = 50.0
vim.g.neovide_cursor_vfx_particle_speed     = 15.0
vim.g.neovide_cursor_animation_length       = 0.2
vim.g.neovide_cursor_trail_size             = 0.3
vim.g.neovide_cursor_antialiasing           = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line   = true
vim.g.neovide_hide_mouse_when_typing        = true
vim.g.neovide_scroll_animation_length       = 0.45
-- vim.g.neovide_floating_blur = 1
-- vim.g.neovide_floating_opacity = 0.2
-- vim.g.neovide_floating_blur_amount_x = 1.0
-- vim.g.neovide_floating_blur_amount_y = 1.0
vim.g.neovide_scale_factor                  = 0.9
vim.g.neovide_floating_shadow               = false
vim.g.neovide_padding_right                 = 25
-- vim.g.neovide_transparency=1
-- vim.g.transparency = 0
vim.g.neovide_input_ime                     = true
vim.g.neovide_profiler                      = false
local alpha                                 = function()
	return string.format("%x", math.floor(255 * 0.8))
end
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
-- vim.g.neovide_background_color = "#343F44" .. alpha()
vim.g.neovide_fullscreen                    = true
-- vim.g.neovide_remember_window_size = true

if vim.g.neovide then
	vim.keymap.set('n', '<D-s>', ':w<CR>')   -- Save
	vim.keymap.set('v', '<D-c>', '"+y')      -- Copy
	vim.keymap.set('n', '<D-v>', '"+P')      -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P')      -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+')   -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- rust-tools
-- vim.g.rustfmt_autosave = 1

-- vim.o.pumblend = 40
-- vim.o.winblend = 30
