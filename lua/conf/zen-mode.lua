require("zen-mode").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	window = {
		backdrop = 1, -- shade the backdrop of the zen window. set to 1 to keep the same as normal
		-- height and width can be:
		-- * an absolute number of cells when > 1
		-- * a percentage of the width / height of the editor when <= 1
		-- * a function that returns the width or the height
		width = 80, -- width of the zen window
		height = 1, -- height of the zen window
		-- by default, no options are changed for the zen window
		-- uncomment any of the options below, or add other vim.wo options you want to apply
		options = {
			signcolumn = "no", -- disable signcolumn
			-- number = false, -- disable number column
			-- relativenumber = false, -- disable relative numbers
			-- cursorline = false, -- disable cursorline
			cursorcolumn = false, -- disable cursor column
			-- foldcolumn = "0", -- disable fold column
			-- list = false, -- disable whitespace characters
		},
	},
	plugins = {
		-- disable some global vim options (vim.o...)
		-- comment the lines to not apply the options
		options = {
			enabled = true,
			ruler = false,           -- disables the ruler text in the cmd line area
			showcmd = false,         -- disables the command in the last line of the screen
		},
		twilight = { enabled = true }, -- enable to start twilight when zen mode opens
		gitsigns = { enabled = false }, -- disables git signs
	},
	-- callback where you can add custom code when the zen window opens
	on_open = function(win) end,
	-- callback where you can add custom code when the zen window closes
	on_close = function() end,
})
