-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Initialize pluggins
require("lazy").setup({
	-- cursor under word colored
	"nyngwang/murmur.lua",

	-- root dir change
	-- orgin repo
	-- "ahmedkhalf/project.nvim",
	"TheLeoP/project.nvim",

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- Undo Tree
	-- "mbbill/undotree",
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { -- load the plugin only when using it's keybinding:
			{ "L", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},

	-- " Go
	"ray-x/go.nvim",
	"ray-x/guihua.lua",

	-- rust
	-- rust crates
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				-- completion = {
				-- 	cmp = {
				-- 		enabled = true,
				-- 	},
				-- },
				lsp = {
					enabled = true,
					-- on_attach = function(_, _)
					-- end,
					actions = true,
					completion = true,
					hover = true,
				},
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false,
	},

	-- auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- themes
	"shaunsingh/nord.nvim",
	"yazeed1s/oh-lucy.nvim",
	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"sainnhe/everforest",
	"themercorp/themer.lua",
	{
		"hardhackerlabs/theme-vim",
		config = function()
			-- vim.cmd.colorscheme("hardhacker")
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require('nordic').load()
		end,
	},
	{ "Mofiqul/dracula.nvim" },
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- Your configuration options here.
		},
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"frenzyexists/aquarium-vim",

	-- find and grep
	"kyazdani42/nvim-web-devicons",

	-- LSP server
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim", -- Helper for installing most language servers
	"williamboman/mason-lspconfig.nvim",
	"ray-x/lsp_signature.nvim", -- show function signature when typing

	-- vue
	"yioneko/nvim-vtsls",

	-- lsp help
	{
		"ray-x/navigator.lua",
		dependencies = {
			{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	},

	-- 代码片段，用于cmp自动提示
	"L3MON4D3/LuaSnip", -- Snippet engine

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path", -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"f3fora/cmp-spell", -- spell check
		"onsails/lspkind.nvim", -- cmp kind
		"lukas-reineke/cmp-rg",
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
	},

	-- NvimTree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- start bord
	{
		"startup-nvim/startup.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup(require("conf.start"))
		end,
	},

	-- find and Replace
	{
		"MagicDuck/grug-far.nvim",
		-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		config = function()
			-- optional setup call to override plugin options
			-- alternatively you can set options with vim.g.grug_far = { ... }
			require("grug-far").setup({
				-- options, see Configuration section below
				-- there are no required options atm
			})
		end,
	},

	-- rainbow color ({})
	"HiPhish/rainbow-delimiters.nvim",

	-- hlargs function param color
	{
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup({
				-- color = "#698b22"
				color = "#adcf9f",
			})
			require("hlargs").enable()
		end,
	},
	-- highlight cursor word
	"RRethy/vim-illuminate",

	-- hop easy to move
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({
				vim.api.nvim_set_keymap("n", "f", "<cmd>HopChar2<cr>", {}),
			})
		end,
	},

	-- zen mode
	"folke/zen-mode.nvim",
	"obmutescences/true-zen.nvim",

	-- highlight todo
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
			"smartpde/telescope-recent-files",
			"jonarrien/telescope-cmdline.nvim",
		},
	},

	-- noice
	{
		"folke/noice.nvim",
		enabled = true,
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	-- cmdline
	-- "gelguy/wilder.nvim",

	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		-- config = function()
		-- 	require("chatgpt").setup()
		-- end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	-- dap
	"theHamsta/nvim-dap-virtual-text",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	-- colors
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- lsp format
	{
		"stevearc/conform.nvim",
	},

	-- pick icon
	"stevearc/dressing.nvim",
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({})
		end,
	},

	-- float term
	{ "akinsho/toggleterm.nvim", version = "*", config = true },

	-- git diffent view
	"sindrets/diffview.nvim",

	{
		"xiyaowong/transparent.nvim",
		config = function()
			if vim.g.neovide then
				vim.g.transparent_enabled = false
			else
				vim.g.transparent_enabled = true
				require("transparent").clear_prefix("lualine")
				require("transparent").clear_prefix("NvimTree")
			end
		end,
	},

	-- trouble
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
	},

	-- lspsaga.nvim
	"nvimdev/lspsaga.nvim",

	-- show indent
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup({
				symbol = "",
				mappings = {
					-- Textobjects
					object_scope = "",
					object_scope_with_border = "",
				},
			})
		end,
	},

	-- select move
	{
		"echasnovski/mini.move",
		version = false,
		config = function()
			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<M-b>",
					right = "<M-i>",
					down = "<M-j>",
					up = "<M-u>",

					-- Move current line in Normal mode
					line_left = "<M-b>",
					line_right = "<M-i>",
					line_down = "<M-j>",
					line_up = "<M-u>",
				},
			})
		end,
	},

	-- line diagnostic
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
	},

	-- ai code
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
		opts = {
			-- add any opts here
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			-- "zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
})
