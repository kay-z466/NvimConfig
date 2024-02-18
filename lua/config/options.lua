vim.g.mapleader =
' '                                                                     -- set global leader key to space (also defined in keymaps.lua)
vim.opt.number = true                                                   -- enable line numbers
vim.opt.relativenumber = true                                           -- make line numbers relative
vim.opt.termguicolors = true                                            -- enable all colors supported ny nvim
vim.opt.laststatus = 3                                                  -- size of status line
vim.opt.mouse = "a"                                                     -- enable mouse mode
vim.opt.cursorline = true                                               -- Enable highlighting of the current line
vim.opt.autochdir = true                                                -- Automatically change directory
vim.opt.ignorecase = true                                               -- Ignore case
vim.opt.smartcase = true                                                -- Don't ignore case with capitals
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- I copied this and have no idea what this does
vim.wo.wrap = false                                                     -- Set no wrap
vim.wo.linebreak = false                                                -- set no linebreak
vim.wo.list = false                                                     -- Set no list >
vim.opt.tabstop = 4                                                     -- tab set to 4 instead of 8
vim.o.background = "dark" -- or "light" for light mode
