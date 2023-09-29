-- Define a function to set custom LineNr highlighting
--
vim.cmd [[
  augroup IndentBlankLineToggle
    autocmd!
    autocmd BufEnter *.txt,*.md :IndentBlanklineToggle
  augroup END
]]


