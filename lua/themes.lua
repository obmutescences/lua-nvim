-- Themes

-- Material
-- vim.g.material_style = 'oceanic'
-- vim.cmd [[colorscheme everforest]]
local colorscheme = "everforest"
-- require "user.conf.github-nvim-theme"


vim.g.termguicolors = true
vim.g.background = "dark"
vim.g.everforest_background = 'medium'
vim.g.material_theme_style = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- eleline.vim
vim.g.airline_powerline_fonts = "0"
vim.g.airline_section_c = "%F"
vim.g.airline_theme = "everforest"

-- GitGutter
vim.g.gitgutter_signs = 0
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_preview_win_floating = 1
