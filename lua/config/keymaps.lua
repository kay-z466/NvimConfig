local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.keymap.set
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SET LEADER KEYS
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- SYSTEM KEYBINDINGS
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Leader>", ":", { noremap = true, silent = true })
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
keymap("n", "<Leader>ww", ":write<CR>", { noremap = true, silent = true })                     -- write
keymap("n", "<Leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = true })                -- verticle split
keymap("n", "<Leader>wh", "<Cmd>split<CR>", { noremap = true, silent = true })                 -- horizontal split
keymap("n", "<Leader>wq", "<Cmd>wq<CR>", { noremap = true, silent = true })                    -- write quit
keymap("n", "<Leader>qq", "<Cmd>q!<CR>", { noremap = true, silent = true })                    -- force quit
keymap("n", "<Leader>bd", "<Cmd>bd<CR>", { noremap = true, silent = true })                    -- buffer delete
keymap("n", "<Leader>bq", "<Cmd>bd!<CR>", { noremap = true, silent = true })                   -- force buffer delete
keymap("n", "<Leader>gg", "gg", { noremap = true, silent = true })                             -- Move to begginig of file
keymap("n", "<Leader>gb", "G", { noremap = true, silent = true })                              -- Move to end of file
keymap("n", "<Leader>gh", "$", { noremap = true, silent = true })                              -- Move to end of line
keymap("n", "<Leader>gf", "_", { noremap = true, silent = true })                              -- Move to end of file
keymap("n", "<Leader>fn", " :ene <BAR> startinsert <CR>", { noremap = true, silent = true })   -- Creates new file in insert mode
keymap("n", "<Leader>cd", " :cd %:p:h <CR>", { noremap = true, silent = true })                -- Changes Current working directory to the directory of the file
keymap("n", "<Leader>t[", "<Cmd>tabprevious<CR>", { noremap = true, silent = true })           -- Keybindings for tabs
keymap("n", "<Leader>t]", "<Cmd>tabnext<CR>", { noremap = true, silent = true })               -- Keybindings for tabs
keymap("n", "<Leader>tn", "<Cmd>tabnew<CR>", { noremap = true, silent = true })                -- Keybindings for tabs
keymap("n", "<Leader>nh", "<Cmd>noh<CR>", { noremap = true, silent = true })                   -- No highlight
keymap("n", "<Leader>a", "A", { noremap = true, silent = true })                               -- Edit ahead line
keymap("n", "<Leader>i", "I", { noremap = true, silent = true })                               -- Edit before line
keymap({ "t" }, "jj", "<C-\\><C-n>", { noremap = true, silent = true })                        -- Exit terminal mode
keymap({ "t" }, "jk", "<C-\\><C-n> <BAR> :bprevious <CR> ", { noremap = true, silent = true }) -- Jump o previous buffer from terminal mode
keymap({ "n" }, "<Leader>bp", ":bprevious <CR> ", { noremap = true, silent = true })           -- Jump to previous buffer
keymap({ "n" }, "<Leader>bv", ":bprevious <CR> ", { noremap = true, silent = true })           -- Jump to previous buffer
keymap({ "n" }, "<Leader>bn", ":bnext<CR> ", { noremap = true, silent = true })                -- Jump to next buffer
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSP KEYBINDINGS
keymap("n", "<Leader>cf", "<Cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })                         -- format code via lsp
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true }) -- open diagonistics
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })  -- prev dignodtics
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })  -- next dignostics
vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })           -- dignostics in treesitter
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- map leader+y to copy to system clipboard in normal and visual mode
keymap({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })

-- PLUGIN KEYBINDINGS
keymap({ "n" }, "<Leader>fe", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>bb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>tf", "<Cmd>terminal<CR>", { noremap = true, silent = true })
-- NORMAL --
-- BETTER WINDOW NAVIGATION
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- RESIZE WITH ARROWS
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- VISUAL --
-- STAY IN INDENT MODE
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
-- VISUAL BLOCK --
-- MOVE TEXT UP AND DOWN
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- TERMINAL --
-- BETTER TERMINAL NAVIGATION
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
