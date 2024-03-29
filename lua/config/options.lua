vim.g.mapleader =
' '                                                                     -- Set global leader key to space (also defined in keymaps.lua)
vim.opt.number = true                                                   -- Enable line numbers
vim.opt.relativenumber = true                                           -- Make line numbers relative
vim.opt.termguicolors = true                                            -- Enable all colors supported ny nvim
vim.opt.laststatus = 3                                                  -- Size of status line
vim.opt.mouse = "a"                                                     -- Enable mouse mode
vim.opt.cursorline = true                                               -- Enable highlighting of the current line
vim.opt.autochdir = true                                                -- Automatically change directory
vim.opt.ignorecase = true                                               -- Ignore case
vim.opt.smartcase = true                                                -- Don't ignore case with capitals
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- I copied this and have no idea what this does
vim.wo.wrap = false                                                     -- Set no wrap
vim.wo.linebreak = false                                                -- Set no linebreak
vim.wo.list = false                                                     -- Set no list >
vim.opt.tabstop = 4                                                     -- Tab set to 4 instead of 8
vim.o.background = "dark"                                               -- Or "light" for light mode
