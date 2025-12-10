-- NOTE: install ripgrep for live_grep picker

-- ====for live_grep raw====:
-- for rp usage: reference: https://segmentfault.com/a/1190000016170184
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -e 正则表达式匹配
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
-- -F fixed-string 原意字符串，类似python的 r'xxx'

-- examples:
-- command	Description
-- rg image utils.py	Search in a single file utils.py
-- rg image src/	Search in dir src/ recursively
-- rg image	Search image in current dir recursively
-- rg '^We' test.txt	Regex searching support (lines starting with We)
-- rg -i image	Search image and ignore case (case-insensitive search)
-- rg -s image	Smart case search
-- rg -F '(test)'	Search literally, i.e., without using regular expression
-- rg image -g '*.py'	File globing (search in certain files), can be used multiple times
-- rg image -g '!*.py'	Negative file globing (do not search in certain files)
-- rg image --type py or rg image -tpy1	Search image in Python file
-- rg image -Tpy	Do not search image in Python file type
-- rg -l image	Only show files containing image (Do not show the lines)
-- rg --files-without-match image	Show files not containing image
-- rg -v image	Inverse search (search files not containing image)
-- rg -w image	Search complete word
-- rg --count	Show the number of matching lines in a file
-- rg --count-matches	Show the number of matchings in a file
-- rg neovim --stats	Show the searching stat (how many matches, how many files searched etc.)

-- ====for fzf search=====
-- Token	Match type	Description
-- sbtrkt	fuzzy-match	Items that match sbtrkt
-- 'wild	exact-match (quoted)	Items that include wild
-- ^music	prefix-exact-match	Items that start with music
-- .mp3$	suffix-exact-match	Items that end with .mp3
-- !fire	inverse-exact-match	Items that do not include fire
-- !^music	inverse-prefix-exact-match	Items that do not start with music
-- !.mp3$	inverse-suffix-exact-match	Items that do not end with .mp3

-- A single bar character term acts as an OR operator.
-- For example, the following query matches entries that start with core and end with either go, rb, or py.
-- ^core go$ | rb$ | py$

local telescope = require("telescope")
local actions = require("telescope.actions")
-- local icons = require("config.icons")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function formattedName(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

local tel_config = {
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-n>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
				-- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				-- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["u"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,
			},
		},
		winblend = 5,
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		previewer = false,
		prompt_prefix = "  ",
		selection_caret = "  ",
		file_ignore_patterns = { "node_modules", "package-lock.json", "%.git/.", "Cargo.lock", "target", "go.sum" },
		initial_mode = "insert",
		select_strategy = "reset",
		sorting_strategy = "ascending",
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		layout_config = {
			prompt_position = "top",
			preview_cutoff = 120,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
	},
	pickers = {
		find_files = {
			previewer = false,
			path_display = formattedName,
			layout_config = {
				height = 0.5,
				width = 0.4,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		live_grep = {
			only_sort_text = true,
			previewer = true,
			layout_config = {
				height = 0.5,
				width = 0.8,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		oldfiles = {
			previewer = false,
			path_display = formattedName,
			layout_config = {
				height = 0.5,
				width = 0.4,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		commands = {
			previewer = false,
			path_display = formattedName,
			layout_config = {
				height = 0.5,
				width = 0.6,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		git_files = {
			previewer = false,
			path_display = formattedName,
			layout_config = {
				height = 0.4,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		buffers = {
			path_display = formattedName,
			previewer = false,
			initial_mode = "normal",
			-- theme = "dropdown",
			layout_config = {
				height = 0.4,
				width = 0.6,
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		current_buffer_fuzzy_find = {
			previewer = true,
			layout_config = {
				prompt_position = "top",
				preview_cutoff = 120,
			},
		},
		grep_string = {
			only_sort_text = true,
			previewer = true,
		},
		lsp_references = {
			show_line = false,
			previewer = true,
			layout_config = {
				height = 0.4,
				width = 0.6,
				prompt_position = "top",
				-- preview_cutoff = 120,
			},
		},
		treesitter = {
			show_line = false,
			previewer = true,
		},
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				previewer = false,
				initial_mode = "normal",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						width = 0.5,
						height = 0.4,
						preview_width = 0.6,
					},
				},
			}),
		},
		frecency = {
			default_workspace = "CWD",
			show_scores = true,
			show_unindexed = true,
			disable_devicons = false,
			ignore_patterns = {
				"*.git/*",
				"*/tmp/*",
				"*/lua-language-server/*",
			},
		},
		cmdline = {
			-- Adjust telescope picker size and layout
			picker = {
				layout_config = {
					width = 40,
					height = 25,
				},
			},
			-- Adjust your mappings
			mappings = {
				complete = "<Tab>",
				run_selection = "<C-CR>",
				run_input = "<CR>",
			},
			-- Triggers any shell command using overseer.nvim (`:!`)
			overseer = {
				enabled = true,
			},
		},
	},
}

if vim.g.neovide then
	tel_config.defaults.winblend = 95
else
	tel_config.defaults.winblend = 5
end

telescope.setup(tel_config)
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
-- telescope.load_extension("refactoring")
telescope.load_extension("frecency")
telescope.load_extension("file_browser")
telescope.load_extension("project")
telescope.load_extension("recent_files")
telescope.load_extension("cmdline")
