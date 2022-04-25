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
  use "lewis6991/impatient.nvim"
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


  -- Mini Vim-APP
  -- use { 'liuchengxu/vim-clap', run = ':Clap install-binary' }
  -- use 'mhinz/vim-startify'


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
  use 'mhartington/oceanic-next'
  use 'voronianski/oceanic-next-color-scheme'
  use 'liuchengxu/space-vim-theme'
  use 'joshdick/onedark.vim'
  use 'liuchengxu/space-vim-dark'
  use 'wadackel/vim-dogrun'
  use 'glepnir/oceanic-material'
  use 'sainnhe/everforest'



  -- language packs
  use 'sheerun/vim-polyglot'


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

  -- Autocomplete
  use "L3MON4D3/LuaSnip" -- Snippet engine

  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    -- config = function() require('plugins.cmp') end,
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

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Startify
  use({
    'mhinz/vim-startify',
    config = function()
      local path = vim.fn.stdpath('config') .. '/lua/plugins/startify.vim'
      vim.cmd('source ' .. path)
    end
  })

  if packer_bootstrap then
    -- require('packer').sync()
  end
end)
