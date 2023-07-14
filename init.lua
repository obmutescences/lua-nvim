-- Load all config files
require('options')
require('keymaps')
require('plugins')
require "conf"
require "lsp"
require('themes') -- Theme at the end, to prevent overwrite by other plugins
require('commands')
