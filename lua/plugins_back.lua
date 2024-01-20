-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	-- Load Packer
	cmd([[packadd packer.nvim]])
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
	autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Initialize pluggins
return require("packer").startup(function(use)
	-- Let Packer manage itself
	use({ "wbthomason/packer.nvim", opt = true })

	-- cursor under word colored
	use({
		"nyngwang/murmur.lua",
		config = function()
			require("murmur").setup({
				cursor_rgb = {
					guibg = "#263C05",
				},
				cursor_rgb_always_use_config = true, -- if set to `true`, then always use `cursor_rgb`.
				-- yank_blink = {
				--   enabled = true,
				--   on_yank = nil, -- Can be customized. See `:h on_yank`.
				-- },
				max_len = 40,
				min_len = 3, -- this is recommended since I prefer no cursorword highlighting on `if`.
				exclude_filetypes = {},
				callbacks = {
					-- to trigger the close_events of vim.diagnostic.open_float.
					function()
						-- Close floating diag. and make it triggerable again.
						vim.cmd("doautocmd InsertEnter")
						vim.w.diag_shown = false
					end,
				},
			})
		end,
	})
	-- use 'pechorin/any-jump.vim'
	use("airblade/vim-rooter")

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Undo Tree
	use("mbbill/undotree")

	-- Git
	-- use 'tpope/vim-fugitive'
	-- use 'airblade/vim-gitgutter'

	-- JSON.
	-- use 'elzr/vim-json'

	-- " Go
	-- use 'fatih/vim-go'
	use("ray-x/go.nvim")
	use("ray-x/guihua.lua")

	-- rust
	-- rust crates
	use({
		"saecki/crates.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
	use({
		'mrcjkb/rustaceanvim',
		version = '^3', -- Recommended
		ft = { 'rust' },
	})

	-- auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- Other visual enhancement
	-- use 'ryanoasis/vim-devicons'
	-- use 'luochen1990/rainbow'
	-- use 'wincent/terminus'

	-- Dependencies
	-- use 'kana/vim-textobj-user'
	-- use 'roxma/nvim-yarp'

	-- comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- themes
	use("shaunsingh/nord.nvim")
	-- use({
	-- 	"neanias/everforest-nvim",
	-- 	-- Optional; default configuration will be used if setup isn't called.
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			background = "hard",
	-- 			transparent_background_level = 2,
	-- 			italics = true,
	-- 			diagnostic_text_highlight = true,
	-- 			---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
	-- 			diagnostic_virtual_text = "coloured",
	-- 			---Some plugins support highlighting error/warning/info/hint lines, but this
	-- 			---feature is disabled by default in this colour scheme.
	-- 			diagnostic_line_highlight = true,
	-- 			---By default, this color scheme won't colour the foreground of |spell|, instead
	-- 			---colored under curls will be used. If you also want to colour the foreground,
	-- 			---set this option to `true`.
	-- 			spell_foreground = true,
	-- 		})
	-- 	end,
	-- })
	use("Yazeed1s/oh-lucy.nvim")
	use("folke/tokyonight.nvim")
	use("marko-cerovac/material.nvim")
	use("sainnhe/everforest")
	use("themercorp/themer.lua")

	-- find and grep
	use("kyazdani42/nvim-web-devicons")

	-- LSP server
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim") -- Helper for installing most language servers
	use("williamboman/mason-lspconfig.nvim")

	use("ray-x/lsp_signature.nvim") -- show function signature when typing
	-- use({
	-- 	'glepnir/lspsaga.nvim',
	-- 	branch = "main",
	-- 	config = function()
	-- 		require('lspsaga').setup({
	-- 			ui = {
	-- 				-- border type can be single,double,rounded,solid,shadow.
	-- 				-- border = 'rounded',
	-- 				border = 'solid',
	-- 				-- winblend = 40,
	-- 				title = false,
	-- 			},
	-- 			finder = {
	-- 				--percentag
	-- 				max_height = 0.5,
	-- 				left_width = 0.3,
	-- 				layout = 'float',
	-- 				-- force_max_height = false,
	-- 				default = 'def+ref+imp',
	-- 				keys = {
	-- 					toggle_or_open = 'o',
	-- 					edit = { '<CR>' },
	-- 					vsplit = 's',
	-- 					split = 'i',
	-- 					-- tabe = 't',
	-- 					-- tabnew = 'r',
	-- 					quit = { '<ESC>', 'q' },
	-- 					close = '<ESC>'
	-- 				},
	-- 			},
	-- 		})
	-- 	end
	-- })

	-- lsp help
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	})

	-- 代码片段，用于cmp自动提示
	use("L3MON4D3/LuaSnip") -- Snippet engine

	use({
		"hrsh7th/nvim-cmp",
		-- requires = {
		-- 	{ "tzachar/cmp-tabnine", run = "./install.sh" } -- tabnine 源,提供基于 AI 的智能补全
		-- }
	})

	use("hrsh7th/cmp-buffer")    -- buffer completions
	use("hrsh7th/cmp-path")      -- path completions
	use "hrsh7th/cmp-cmdline"    -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	-- use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use("hrsh7th/cmp-nvim-lua")
	use("f3fora/cmp-spell")  -- spell check
	use("onsails/lspkind.nvim") -- cmp kind
	use("lukas-reineke/cmp-rg")

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup(require("conf.startup"))
		end,
	})

	-- find and Replace
	use("windwp/nvim-spectre")

	-- rainbow color ({})
	use("HiPhish/rainbow-delimiters.nvim")

	-- fidget lsp loading ui
	-- use({
	-- 	"j-hui/fidget.nvim",
	-- 	branch = "legacy",
	-- 	config = function()
	-- 		require("fidget").setup({})
	-- 	end,
	-- })

	-- hlargs function param color
	use({
		"m-demare/hlargs.nvim",
		config = function()
			require("hlargs").setup({
				-- color = "#698b22"
				color = "#adcf9f",
			})
			require("hlargs").enable()
		end,
	})

	-- hop easy to move
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({
				vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1({})<cr>", {}),
			})
		end,
	})

	-- zen mode
	use({
		"folke/zen-mode.nvim",
		config = function()
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
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
					},
					twilight = { enabled = true }, -- enable to start twilight when zen mode opens
					gitsigns = { enabled = false }, -- disables git signs
				},
				-- callback where you can add custom code when the zen window opens
				on_open = function(win) end,
				-- callback where you can add custom code when the zen window closes
				on_close = function() end,
			})
		end,
	})

	-- highlight todo
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	-- gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			-- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
			{

				"nvim-telescope/telescope-fzf-native.nvim",
				run =
				"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
	})

	-- noice
	use(
		{
			"folke/noice.nvim",
			enabled = true,
			opts = {
				-- add any options here
			},
			requires = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
		}
	)

	-- cmdline
	use({
		"gelguy/wilder.nvim",
		-- event = 'CmdlineEnter', -- 懒加载：首次进入cmdline时载入
		-- config = function()
		--  require('wilder').setup({ modes = { ':', '/', '?' } })
		-- end
	})

	-- snippets
	-- use "rafamadriz/friendly-snippets"

	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup()
	-- 	end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- })

	-- dap
	use("theHamsta/nvim-dap-virtual-text")
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
		}
	})
	-- colors
	use({
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	})

	-- lsp format
	use({
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
	})

	-- pick icon
	use("stevearc/dressing.nvim")
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	})

	-- markdown
	use { "ellisonleao/glow.nvim", config = function()
		require("glow").setup({
			border = "none"
		})
	end }

	-- lint
	use "dense-analysis/ale"

	use(
		{
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" }
			},
			config = function()
				require("refactoring").setup({})
			end
		})
end)