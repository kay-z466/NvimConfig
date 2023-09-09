vim.opt.number = true
vim.opt.relativenumber = true

-- use global statusline
vim.opt.laststatus = 3

-- disable mouse
vim.opt.mouse = ""



vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'gray', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'yellow', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'gray', bold = true })
