--------------------------------------------------------------------------Definations-----------------------------------------------------------------------
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.keymap.set
-- SYSTEM KEYBINDINGS
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><Leader>", ":", { noremap = true, silent = true })
--------------------------------------------------------------------------Basic-----------------------------------------------------------------------
vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>ww", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wv", "<Cmd>vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wh", "<Cmd>split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>wq", "<Cmd>wq<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>qq", "<Cmd>q!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bd", "<Cmd>bd!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bq", "<Cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gg", "gg", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gb", "G", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gh", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gf", "_", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fn", " :ene <BAR> startinsert <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>cd", " :cd %:p:h <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>t[", "<Cmd>tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>t]", "<Cmd>tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>tn", "<Cmd>tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>b]", "<Cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bn", "<Cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>b[", "<Cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bv", "<Cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", "<Cmd>noh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>nn", "<Cmd>noh<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>tf", "<Cmd>terminal<CR>", { noremap = true, silent = true })
vim.keymap.set({ "t" }, "jj", "<C-\\><C-n>", { noremap = true, silent = true })
----------------------------------------------------------------------------------------------------------------------------
-- LSP KEYBINDINGS
vim.keymap.set("n", "<Leader>cf", "<Cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
----------------------------------------------------------------------------------------------------------------------------
-- Map leader+y to copy to system clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })
----------------------------------------------------------------------------------------------------------------------------
-- PLUGIN KEYBINDINGS
vim.keymap.set({ "n" }, "<Leader>fe", "<Cmd>Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>bb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fw", "<Cmd>Telescope grep_string<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>ht", "<Cmd>Telescope colorscheme<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>fp", "<Cmd>Telescope git_files<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>cp", "<Cmd>ColorPickOklch<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<2-LeftMouse>', ':lua pcall(require("oklch-color-picker").pick_under_cursor)<CR>',
-- 	{ noremap = true, silent = true })
vim.keymap.set({ "n" }, "<Leader>cd", "<Cmd>Telescope zoxide list<CR>", { noremap = true, silent = true })
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
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--------------------------------------------------------------------------Advanced-----------------------------------------------------------------------

-- Define the list of filetypes where the color picker should be enabled
local color_filetypes = {
	"css", "scss", "sass", "less", "stylus", "html", "javascript", "typescript",
	"javascriptreact", "typescriptreact", "vue", "toml", "yaml", "json"
}

-- Create an autocommand group for setting the keymap only in specific filetypes
vim.api.nvim_create_augroup("ColorPickerKeymap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "ColorPickerKeymap",
	pattern = color_filetypes,
	callback = function()
		vim.api.nvim_buf_set_keymap(0, 'n', '<2-LeftMouse>',
			':lua local ok, _ = pcall(require("oklch-color-picker").pick_under_cursor); if not ok then vim.cmd("echohl None | echo \'\'") end<CR>',
			{ noremap = true, silent = true })
	end,
})

vim.keymap.set("n", "<leader>ko", function()
	local file_path = vim.api.nvim_buf_get_name(0)                 -- Get the current file's full path
	vim.fn.system("kate " .. vim.fn.shellescape(file_path) .. " &") -- Open the file in Kate
end, { desc = "Open current file in Kate", silent = true })
