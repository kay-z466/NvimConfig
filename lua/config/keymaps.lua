vim.g.mapleader = " "

-- SYSTEM KEYBINDINGS 
-- map leader+w to save current file in normal mode
vim.keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wh", "<Cmd>split<CR>", { noremap = true, silent = true })

-- map leader+y to copy to system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })


-- PLUGIN KEYBINDINGS
vim.keymap.set({ "n" }, "<Leader>fe", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>tf", "<Cmd>ToggleTerm<CR>", { noremap = true, silent = true })