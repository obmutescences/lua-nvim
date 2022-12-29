-- Themes

local colorscheme = "everforest"


vim.g.termguicolors = true
vim.g.background = "dark"
vim.g.everforest_background = 'medium'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 0
vim.g.everforest_cursor = "green"
vim.g.everforest_transparent_background = 0
vim.g.everforest_ui_contrast = "low"
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_virtual_text = "colored"

vim.g.material_theme_style = "minimal"

vim.g.material_style = "minimal"
vim.cmd[[colorscheme everforest]]

-- nord
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_bold = false


-- eleline.vim
vim.g.airline_powerline_fonts = "0"
vim.g.airline_section_c = "%F"
vim.g.airline_theme = "nord"

-- GitGutter
vim.g.gitgutter_signs = 0
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_override_sign_column_highlight = 0
vim.g.gitgutter_preview_win_floating = 1

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--     vim.notify("colorscheme " .. colorscheme .. " not found!")
--     return
-- end
