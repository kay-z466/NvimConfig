-- Define a function to set custom LineNr highlighting
--
vim.cmd [[
  augroup IndentBlankLineToggle
    autocmd!
    autocmd BufEnter *.txt,*.md,*.tex :IBLToggle
  augroup END
]]

-- vim.cmd [[
--   augroup IndentBlankLineToggle
--     autocmd!
--     autocmd BufLeave *.txt,*.md,*.tex :IBLToggle
--   augroup END
-- ]]
