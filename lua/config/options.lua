vim.g.mapleader = ' '                                                                     -- set global leader key to space (also defined in keymaps.lua)
vim.opt.number = true                                                   --enable line numbers
vim.opt.relativenumber = true                                           --make line numbers relative
vim.opt.termguicolors = true                                            --enable all colors supported ny nvim
vim.opt.laststatus = 3                                                  -- size of status line
vim.opt.mouse = "a"                                                     --enable mouse mode
vim.opt.cursorline = true                                               -- Enable highlighting of the current line
vim.opt.ignorecase = true                                               -- Ignore case
vim.opt.smartcase = true                                                -- Don't ignore case with capitals
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" } -- I copied this and have no idea what this does
vim.wo.wrap = false                                                     -- Set no wrap
vim.wo.linebreak = false                                                -- set no linebreak
vim.wo.list = false                                                     -- extra option I set in addition to the ones in your question
vim.opt.tabstop = 4
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#6E808A', bold = true })  --set color for line numbers(I find theme colors to be a bit hard to read)
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow', bold = true })        --set color for line numbers(I find theme colors to be a bit hard to read)
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#6E808A', bold = true })  --set color for line numbers(I find theme colors to be a bit hard to read)
