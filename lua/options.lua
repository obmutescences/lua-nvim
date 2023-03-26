-- Providers
vim.g.python3_host_prog = '/opt/homebrew/Cellar/python@3.11/3.11.2_1/bin/python3.11'
vim.g.python_host_prog = '/opt/homebrew/Cellar/python@3.11/3.11.2_1/bin/python3.11'


--system--
vim.o.autochdir = true
vim.o.clipboard = 'unnamedplus'


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

vim.o.tabstop     = 4
vim.o.softtabstop = 4
vim.o.shiftwidth  = 4
-- vim.o.scrolloff    = 4
vim.o.ttimeoutlen = 0
vim.o.tw          = 0
vim.o.re          = 1
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.indentexpr  = ''
vim.o.inccommand  = 'split'
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.opt.formatoptions:remove('tc')
vim.opt.shortmess:append('tc')
vim.opt.synmaxcol = 2048
vim.opt.linespace = 2


vim.g.neoterm_autoscroll = 1
vim.g.notimeout = true
vim.g.noshowmode = true


-- neovide
-- vim.g.neovide_refresh_rate = 75
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_cursor_vfx_opacity = 1000.0
vim.g.neovide_cursor_vfx_particle_lifetime = 2.5
vim.g.neovide_cursor_vfx_particle_density = 40.0
vim.g.neovide_cursor_vfx_particle_speed = 30.0
-- vim.g.neovide_cursor_trail_length = 2.0
vim.g.neovide_cursor_animation_length = 0.15
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_hide_mouse_when_typing = 1
vim.g.neovide_scroll_animation_length = 0.7
vim.g.neovide_floating_blur = 1
vim.g.neovide_floating_opacity = 0.2
vim.g.neovide_floating_blur_amount_x = 1.0
vim.g.neovide_floating_blur_amount_y = 1.0
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_transparency=0.0
vim.g.transparency = 0.8
local alpha = function()
  return string.format("%x", math.floor(255 * 0.8))
end
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
vim.g.neovide_background_color = "#343F44" .. alpha()
-- vim.g.neovide_fullscreen= true

-- rust-tools
vim.g.rustfmt_autosave = 1

vim.o.pumblend = 70
vim.o.winblend = 30

