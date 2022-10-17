local true_zen = require("true-zen")

-- local function tmux_off()
--   if vim.fn.exists "$TMUX" == 0 then
--     return
--   end
--   vim.cmd [[silent !tmux set status off]]
-- end

-- local function tmux_on()
--   if vim.fn.exists "$TMUX" == 0 then
--     return
--   end
--   vim.cmd [[silent !tmux set status on]]
-- end

-- local function open_cb()
--   tmux_off()
-- end

-- local function close_cb()
--   tmux_on()
-- end

true_zen.setup({
	modes = {
		ataraxis = {
			shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
			backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
			minimum_writing_area = { -- minimum size of main window
				width = 70,
				height = 0,
			},
			quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
			padding = { -- padding windows
				left = 80,
				right = 20,
				top = 0,
				bottom = 0,
			},
			open_callback = nil, -- run a function when opening Ataraxis mode
			close_callback = nil, -- run a function when closing Ataraxis mode
		},
		minimalist = {
			options = { -- options to be disabled when entering Minimalist mode
				number = false,
				relativenumber = false,
				showtabline = 0,
				signcolumn = "yes",
				statusline = "",
				cmdheight = 1,
				laststatus = 0,
				showcmd = true,
				showmode = false,
				ruler = false,
				numberwidth = 1,
			},
			open_callback = nil,
			close_callback = nil,
		},
	},
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
		kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
			enabled = true,
			font = "+1"
		},
		twilight = false, -- enable twilight (ataraxis)
		lualine = false
	},
})
