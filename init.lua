-- Load all config files
require('options')
require('themes') -- Theme at the end, to prevent overwrite by other plugins
require('plugins')
require('keymaps')
require('commands')
require "conf"
require "lsp"
