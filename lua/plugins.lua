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
	"ahmedkhalf/project.nvim",

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
				src = {
					cmp = {
						enabled = true,
					},
				},
			})
		end,
	},
	{
		'mrcjkb/rustaceanvim',
		version = '^3', -- Recommended
		ft = { 'rust' },
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
	"Yazeed1s/oh-lucy.nvim",
	"folke/tokyonight.nvim",
	"marko-cerovac/material.nvim",
	"sainnhe/everforest",
	"themercorp/themer.lua",

	-- find and grep
	"kyazdani42/nvim-web-devicons",

	-- LSP server
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim", -- Helper for installing most language servers
	"williamboman/mason-lspconfig.nvim",
	"ray-x/lsp_signature.nvim", -- show function signature when typing

	-- lsp help
	{
		"ray-x/navigator.lua",
		dependencies = {
			{ "ray-x/guihua.lua",     build = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	},

	-- 代码片段，用于cmp自动提示
	"L3MON4D3/LuaSnip", -- Snippet engine

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer", -- buffer completions
		"hrsh7th/cmp-path",   -- path completions
		"hrsh7th/cmp-cmdline", -- cmdline completions
		"saadparwaiz1/cmp_luasnip", -- snippet completions
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"f3fora/cmp-spell", -- spell check
		"onsails/lspkind.nvim", -- cmp kind
		"lukas-reineke/cmp-rg",
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
	"windwp/nvim-spectre",

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

	-- hop easy to move
	{
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({
				vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1({})<cr>", {}),
			})
		end,
	},

	-- zen mode
	"folke/zen-mode.nvim",

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
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
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
	"gelguy/wilder.nvim",

	{
		"jackMort/ChatGPT.nvim",
		enabled = false,
		config = function()
			require("chatgpt").setup()
		end,
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
		}
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
		config = function()
			require("conform").setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					go = { "gofmt", "goimports" },

				},
			})
		end,
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

	-- markdown
	{
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup({
				border = "none"
			})
		end
	},

	-- lint
	"dense-analysis/ale",

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" }
		},
		config = function()
			require("refactoring").setup({})
		end
	},

	-- float term
	{ 'akinsho/toggleterm.nvim', version = "*", config = true }
})
