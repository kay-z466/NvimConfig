local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- SYSTEM KEYBINDINGS
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Leader>", ":", { noremap = true, silent = true })

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

keymap("n", "<Leader>ww", ":write<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>wh", "<Cmd>split<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>wq", "<Cmd>wq<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>qq", "<Cmd>q!<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bd", "<Cmd>bd<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>bq", "<Cmd>bd!<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>gg", "gg", { noremap = true, silent = true })                           -- move to begginig of file
keymap("n", "<Leader>gb", "G", { noremap = true, silent = true })                            -- move to end of file
keymap("n", "<Leader>gh", "$", { noremap = true, silent = true })                            -- move to end of line
keymap("n", "<Leader>gf", "_", { noremap = true, silent = true })                            -- move to end of file
keymap("n", "<Leader>fn", " :ene <BAR> startinsert <CR>", { noremap = true, silent = true }) -- Creates new file in insert mode
keymap("n", "<Leader>cd", " :cd %:p:h <CR>", { noremap = true, silent = true })              -- changes Current working directory to the directory of the file
keymap("n", "<Leader>t[", "<Cmd>tabprevious<CR>", { noremap = true, silent = true })         --keybindings for tabs
keymap("n", "<Leader>t]", "<Cmd>tabnext<CR>", { noremap = true, silent = true })             --keybindings for tabs
keymap("n", "<Leader>tn", "<Cmd>tabnew<CR>", { noremap = true, silent = true })              --keybindings for tabs
keymap("n", "<Leader>nh", "<Cmd>noh<CR>", { noremap = true, silent = true })
keymap("n", "<Leader>ut", "<Cmd>:colorscheme <TAB>", { noremap = true, silent = true })
keymap("n", "<Leader>a", "A", { noremap = true, silent = true })          
keymap("n", "<Leader>i", "I", { noremap = true, silent = true })          

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSP KEYBINDINGS
keymap("n", "<Leader>cf", "<Cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true }) --format code via lsp
vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dt', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })

-- map leader+y to copy to system clipboard in normal and visual mode
keymap({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })

-- PLUGIN KEYBINDINGS
keymap({ "n" }, "<Leader>fe", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

keymap({ "n" }, "<Leader>bb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>tf", "<Cmd>terminal<CR>", { noremap = true, silent = true })
keymap({ "t" }, "jj", "<C-\\><C-n>", { noremap = true, silent = true })
keymap({ "t" }, "jk", "<C-\\><C-n> <BAR> :bprevious <CR> ", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>bp", ":bprevious <CR> ", { noremap = true, silent = true })
keymap({ "n" }, "<Leader>bn", ":bnext<CR> ", { noremap = true, silent = true })

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down

keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
