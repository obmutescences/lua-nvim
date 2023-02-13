-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
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
return require('packer').startup(function(use)
	-- Let Packer manage itself
	use({ 'wbthomason/packer.nvim', opt = true })

	use 'RRethy/vim-illuminate'
	-- use 'pechorin/any-jump.vim'
	use 'airblade/vim-rooter'

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Undo Tree
	use 'mbbill/undotree'

	-- Git
	-- use 'tpope/vim-fugitive'
	-- use 'airblade/vim-gitgutter'

	-- JSON.
	-- use 'elzr/vim-json'

	-- " Go
	use 'fatih/vim-go'

	-- rust
	use({
		-- simrat39
		-- kdarkhan
		'simrat39/rust-tools.nvim'
	})

	-- auto pairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- Other visual enhancement
	-- use 'ryanoasis/vim-devicons'
	-- use 'luochen1990/rainbow'
	-- use 'wincent/terminus'

	-- Dependencies
	-- use 'kana/vim-textobj-user'
	-- use 'roxma/nvim-yarp'

	-- comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- themes
	-- use 'mhartington/oceanic-next'
	-- use 'sainnhe/everforest'
	use 'shaunsingh/nord.nvim'
	use 'Yazeed1s/minimal.nvim'
	use 'ful1e5/onedark.nvim'
	use({
		"neanias/everforest-nvim",
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				background = "soft",
				transparent_background_level = 0,
				italics = true,
				-- cursor = "green",
				-- diagnostic_text_highlight = 1,
				-- diagnostic_virtual_text = "colored"
			})
		end,
	})
	use 'Yazeed1s/oh-lucy.nvim'

	-- find and grep
	use 'kyazdani42/nvim-web-devicons'


	-- LSP server
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim' -- Helper for installing most language servers
	use 'williamboman/mason-lspconfig.nvim'

	use "ray-x/lsp_signature.nvim" -- show function signature when typing
	use({
		'glepnir/lspsaga.nvim',
		branch = "main",
		config = function()
			require('lspsaga').setup({
				ui = {
					theme = 'round',
					-- border type can be single,double,rounded,solid,shadow.
					border = 'rounded',
					winblend = 20,
					colors = {
						--float window normal bakcground color
						normal_bg = '#556b2f',
						--title background color
						title_bg = '#556b2f',
					}
				}
			})
		end
	})

	-- 代码片段，用于cmp自动提示
	use "L3MON4D3/LuaSnip" -- Snippet engine

	use({
		"hrsh7th/nvim-cmp",
		-- requires = {
		-- 	{ "tzachar/cmp-tabnine", run = "./install.sh" } -- tabnine 源,提供基于 AI 的智能补全
		-- }
	})

	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use "hrsh7th/cmp-nvim-lua"
	use "f3fora/cmp-spell" -- spell check
	use "onsails/lspkind.nvim" -- cmp kind

	-- NvimTree
	use({
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	})

	-- Treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	})

	use {
		"startup-nvim/startup.nvim",
		requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
		config = function()
			require"startup".setup(require"conf.startup")
		end
	}

	-- find and Replace
	use 'windwp/nvim-spectre'

	-- rainbow color ({})
	use 'mrjones2014/nvim-ts-rainbow'

	-- fidget lsp loading ui
	use({
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup {}
		end
	})

	-- hlargs function param color
	use({
		'm-demare/hlargs.nvim',
		config = function()
			require('hlargs').setup {
				color = "#698b22"
			}
			require('hlargs').enable()
		end
	})

	-- hop easy to move
	use {
		'phaazon/hop.nvim',
		branch = 'v1', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require 'hop'.setup {
				vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({})<cr>", {})
			}
		end
	}

	-- zen mode
	use {
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup {
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
				on_open = function(win)
				end,
				-- callback where you can add custom code when the zen window closes
				on_close = function()
				end,
			}
		end
	}

	-- highlight todo
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	-- gitsigns
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}

	-- Telescope
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})

	use { 'nvim-telescope/telescope-ui-select.nvim' }

	use { "nvim-telescope/telescope-file-browser.nvim" }

	use { "nvim-telescope/telescope-project.nvim" }

	use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

	-- rust crates
	use {
		'saecki/crates.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup()
		end,
	}

	-- show nvim diagnostic using virtual lines
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	if packer_bootstrap then
		-- require('packer').sync()
	end
end)
