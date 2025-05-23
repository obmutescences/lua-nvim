require("themer").setup({
	colorscheme = "everforest", -- default colorscheme
	transparent = true,
	term_colors = true,
	dim_inactive = false,
	disable_telescope_themes = {},
	styles = {
		heading = {
			h1 = {},
			h2 = {},
		},
		["function"] = { fg = "#A2CD5A" },
		functionBuiltIn = { style = "italic" },
		variable = { fg = "#A7C080" },
		variableBuiltIn = {},
		include = {},
		identifier = {},
		keyword = { style = "italic" },
		keywordBuiltIn = { style = "italic" },
		struct = {},
		string = { fg = "#77B98B" },
		parameter = {},
		field = {},
		type = { style = "italic" },
		typeBuiltIn = { style = "italic" },
		property = {},
		comment = { fg = "#556B2F", style = "italic" },
		punctuation = {},
		constructor = {},
		operator = {},
		constant = {},
		constantBuiltIn = {},
		todo = {},
		character = {},
		conditional = {},
		number = {},
		statement = {},
		uri = {},
		diagnostic = {
			underline = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
			virtual_text = {
				error = {},
				warn = {},
				info = {},
				hint = {},
			},
		},
	},
	remaps = {
		palette = {},
		-- per colorscheme palette remaps, for example:
		-- remaps.palette = {
		--     rose_pine = {
		--     	fg = "#000000"
		--     }
		-- },
		-- remaps.highlights = {
		--     rose_pine = {
		--	base = {
		--     	  Normal = { bg = "#000000" }
		--	},
		--     }
		-- },
		--
		-- Also you can do remaps.highlights.globals  for global highlight remaps
		highlights = {
			everforest = {
				base = {
					Normal = { bg = "#22292D" },
					-- Normal = { bg = "NONE", fg = "NONE" },
					ColorColumn = { bg = "#22292D", fg = "#22292D" },
					VertSplit = { bg = "#22292D", fg = "#22292D" },
					-- WinSeparator = { bg = "#22292D", fg = "#22292D" },
					WinSeparator = { bg = "NONE", fg = "NONE" },
					EndOfBuffer = { bg = "#22292D", fg = "#22292D" },
					-- EndOfBuffer = { bg = "NONE", fg = "NONE" },
					Visual = { bg = "#5C3F4F" },
					CursorLine = { bg = "#293135" },
					NvimTreeFolderIcon = {
						bg = "NONE",
						fg = "#A2CD5A",
					},
					NvimTreeFolderName = {
						bg = "NONE",
						fg = "#A2CD5A",
					},
				},
				plugins = {
					cmp = {
						CmpItemMenu = { fg = "#A7C080" },
						CmpItemAbbr = { fg = "#A7C080" },
						CmpItemAbbrMatch = { fg = "#ABF50A" },
						CmpItemAbbrMatchFuzzy = { fg = "#ABF50A" },
					},
				},
			},
		},
	},

	langs = {
		html = true,
		md = true,
	},

	plugins = {
		treesitter = true,
		indentline = true,
		barbar = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		lsp = true,
		telescope = true,
	},
	enable_installer = false, -- enable installer module
})
