-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/zerone/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/zerone/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/zerone/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/zerone/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/zerone/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["any-jump.vim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/any-jump.vim",
    url = "https://github.com/pechorin/any-jump.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["everforest-nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\vcursor\ngreen\18enable_italic\3\1\15background\vmedium\28diagnostic_virtual_text\fcolored!transparent_background_level\3\2\30diagnostic_text_highlight\3\1\nsetup\15everforest\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/everforest-nvim",
    url = "https://github.com/neanias/everforest-nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\venable\1\0\1\ncolor\f#698b22\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n¤\1\0\0\t\0\t\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0'\6\a\0'\a\b\0004\b\0\0B\3\5\0?\3\0\0B\0\2\1K\0\1\0-<cmd>lua require'hop'.hint_char1({})<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  indentLine = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nh\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\18saga_winblend\3<\17border_style\vsingle\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["minimal.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/minimal.nvim",
    url = "https://github.com/Yazeed1s/minimal.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yarp"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/nvim-yarp",
    url = "https://github.com/roxma/nvim-yarp"
  },
  ["oh-lucy.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/oh-lucy.nvim",
    url = "https://github.com/Yazeed1s/oh-lucy.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/ful1e5/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n¨\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\1\0\3\17show_headers\2\19show_http_info\2\rshow_url\2\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\5\26skip_ssl_verification\1\26result_split_in_place\1\28result_split_horizontal\1\20jump_to_request\1\17yank_dry_run\2\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  terminus = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/terminus",
    url = "https://github.com/wincent/terminus"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["true-zen.nvim"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-startify"] = {
    config = { "\27LJ\2\n{\0\0\5\0\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0006\1\0\0009\1\5\1'\3\6\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\fsource \bcmd\30/lua/plugins/startify.vim\vconfig\fstdpath\afn\bvim\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0\v\0\0\1\0\0\0\1K\0\1\0®\2\1\0\5\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\5\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\14\0023\3\15\0=\3\16\0023\3\17\0=\3\18\2B\0\2\1K\0\1\0\ron_close\0\fon_open\0\fplugins\rgitsigns\1\0\1\fenabled\1\rtwilight\1\0\1\fenabled\2\1\0\0\1\0\3\fshowcmd\1\nruler\1\fenabled\2\vwindow\1\0\0\foptions\1\0\2\15signcolumn\ano\17cursorcolumn\1\1\0\3\nwidth\3P\rbackdrop\3\1\vheight\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/zerone/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0\v\0\0\1\0\0\0\1K\0\1\0®\2\1\0\5\0\19\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\5\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\14\0023\3\15\0=\3\16\0023\3\17\0=\3\18\2B\0\2\1K\0\1\0\ron_close\0\fon_open\0\fplugins\rgitsigns\1\0\1\fenabled\1\rtwilight\1\0\1\fenabled\2\1\0\0\1\0\3\fshowcmd\1\nruler\1\fenabled\2\vwindow\1\0\0\foptions\1\0\2\15signcolumn\ano\17cursorcolumn\1\1\0\3\nwidth\3P\rbackdrop\3\1\vheight\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\1K\0\1\0\1\0\2\18saga_winblend\3<\17border_style\vsingle\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: everforest-nvim
time([[Config for everforest-nvim]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\vcursor\ngreen\18enable_italic\3\1\15background\vmedium\28diagnostic_virtual_text\fcolored!transparent_background_level\3\2\30diagnostic_text_highlight\3\1\nsetup\15everforest\frequire\0", "config", "everforest-nvim")
time([[Config for everforest-nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\venable\1\0\1\ncolor\f#698b22\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n¤\1\0\0\t\0\t\1\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\3\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0'\6\a\0'\a\b\0004\b\0\0B\3\5\0?\3\0\0B\0\2\1K\0\1\0-<cmd>lua require'hop'.hint_char1({})<cr>\6f\6n\20nvim_set_keymap\bapi\bvim\nsetup\bhop\frequire\3€€À™\4\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: vim-startify
time([[Config for vim-startify]], true)
try_loadstring("\27LJ\2\n{\0\0\5\0\a\0\0146\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2'\1\4\0&\0\1\0006\1\0\0009\1\5\1'\3\6\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\fsource \bcmd\30/lua/plugins/startify.vim\vconfig\fstdpath\afn\bvim\0", "config", "vim-startify")
time([[Config for vim-startify]], false)
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\n¨\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\29custom_dynamic_variables\vresult\1\0\3\17show_headers\2\19show_http_info\2\rshow_url\2\14highlight\1\0\2\ftimeout\3–\1\fenabled\2\1\0\5\26skip_ssl_verification\1\26result_split_in_place\1\28result_split_horizontal\1\20jump_to_request\1\17yank_dry_run\2\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
