vim.opt.number = true
vim.opt.relativenumber = true

-- use global statusline
vim.opt.laststatus = 3
vim.g.mapleader = ' '
-- disable mouse
vim.opt.mouse = "a" --enable mouse mode 



vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'gray', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'gray', bold = true })
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.ignorecase = true -- Ignore case
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vim.opt.smartcase = true -- Don't ignore case with capitals