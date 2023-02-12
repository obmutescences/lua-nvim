-- Load all config files
require "conf"
require "lsp"
require('options')
require('themes') -- Theme at the end, to prevent overwrite by other plugins
require('plugins')
require('keymaps')
require('commands')
