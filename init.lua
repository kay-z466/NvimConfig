---[[ - ]] init.lua is the where our configurations lives [equivalent to init.vim]
-- We can put all our settings in this file but, instead we have opted for a easier
-- managed modular config file system
------------------------------------------------------------------------------------------------------------
require("config.options")           -- configuration for settings options
require("config.keymaps")           -- configuration for  setting keymap
require("config.lazy")              -- configuration for configuring package manager LAZY.nvim
require("config.configsnippets")    -- configuration for cnfiguring snippets via LuaSnip
require("config.autocmd")           -- configuration for setting auto commands
require("config.customfunctions")   -- configuration for setting custom lua functions
--------------------------------------------------------------------------------------------------------------
