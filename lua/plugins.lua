-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Boostrap Packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])

-- Initialize pluggins
return require('packer').startup(function(use)
  -- use "lewis6991/impatient.nvim"
  -- Let Packer manage itself
  use({ 'wbthomason/packer.nvim', opt = true })

  use 'RRethy/vim-illuminate'
  use 'pechorin/any-jump.vim'
  use 'airblade/vim-rooter'

  -- Pretty Dress
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'


  -- Snippets
  use 'SirVer/ultisnips'

  -- Undo Tree
  use 'mbbill/undotree'

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- JSON.
  use 'elzr/vim-json'

  -- " Go
  -- Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
  use 'fatih/vim-go'

  -- rust
  use 'rust-lang/rust.vim'


  -- Python
  -- use 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
  use 'Vimjas/vim-python-pep8-indent'
  use 'numirias/semshi'

  -- Editor Enhancement
  use 'jiangmiao/auto-pairs'


  -- Formatter
  -- use 'Chiel92/vim-autoformat'

  -- For general writing
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- Find & Replace
  use 'brooth/far.vim'
  use 'osyo-manga/vim-anzu'

  -- Other visual enhancement
  use 'ryanoasis/vim-devicons'
  use 'luochen1990/rainbow'
  use 'wincent/terminus'

  -- Dependencies
  use 'kana/vim-textobj-user'
  use 'roxma/nvim-yarp'

  -- comment
  use 'tpope/vim-commentary'

  -- indentLine
  use 'Yggdroot/indentLine'

  -- themes
  -- use 'mhartington/oceanic-next'
  -- use 'voronianski/oceanic-next-color-scheme'
  -- use 'liuchengxu/space-vim-theme'
  -- use 'joshdick/onedark.vim'
  -- use 'liuchengxu/space-vim-dark'
  use 'wadackel/vim-dogrun'
  use 'glepnir/oceanic-material'
  use 'sainnhe/everforest'
  use 'marko-cerovac/material.nvim'

  use({
    "themercorp/themer.lua",
    config = function()
      require("themer").setup({
        colorscheme = "everforest",
		styles = {
			string = {
				fg = "#A7C080"
			},
			comment = {
				fg = "#549688"
			},
			['function' ]= {
				fg = "#89BEBA"
			},
			functionBuiltIn = {
				fg = "#89BEBA"
			},
			conditional = {
				fg = "#A7C080"
			},
			keywordBuiltIn = {
				fg = "#A7C080"
			},
			keyword = {
				fg = "#A7C080"
			}
		}
      })
    end
  })



  -- language packs
  -- use 'sheerun/vim-polyglot'


  -- find and grep
  -- use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'kyazdani42/nvim-web-devicons'

  -- lint
  use 'dense-analysis/ale'

  -- float
  use 'voldikss/vim-floaterm'

  -- LSP server
  use({
    'neovim/nvim-lspconfig',
    -- config = function() require('plugins.lspconfig') end
  })
  use 'williamboman/nvim-lsp-installer' -- Helper for installing most language servers
  use "ray-x/lsp_signature.nvim" -- show function signature when typing
  use({ 
      'glepnir/lspsaga.nvim',
      config = function()
        require("lspsaga").init_lsp_saga()
      end
    })

  -- Autocomplete
  use "L3MON4D3/LuaSnip" -- Snippet engine

  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    -- config = function() require('plugins.cmp') end,
    requires = {
      {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
    }
  })

  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "f3fora/cmp-spell" -- spell check

  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end,
  })

  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    -- config = function() require('plugins.nvimtree') end, -- Must add this manually
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    -- commit = "668de0951a36ef17016074f1120b6aacbe6c4515",
    -- config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use { 'nvim-telescope/telescope-ui-select.nvim' }

  use { "nvim-telescope/telescope-file-browser.nvim" }

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Startify
  use({
    'mhinz/vim-startify',
    config = function()
      local path = vim.fn.stdpath('config') .. '/lua/plugins/startify.vim'
      vim.cmd('source ' .. path)
    end
  })

  -- find and Replace
  use 'windwp/nvim-spectre'

  -- rainbow color ({})
  use 'p00f/nvim-ts-rainbow'

  -- fidget lsp loading ui
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup{}
    end 
  })

  -- hlargs 
  use({
    'm-demare/hlargs.nvim',
    config = function()
      require('hlargs').setup{
        color = "#3b7960"
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
      require'hop'.setup { 
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
          width = 100, -- width of the zen window
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

	-- true zen
	use "Pocco81/TrueZen.nvim"


  if packer_bootstrap then
    -- require('packer').sync()
  end
end)
