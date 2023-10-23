vim.g.mapleader = " "
-- File Explorer
--vim.keymap.set("n", "<leader>o-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>o-", ":e.<CR>")
--vim.keymap.set("n", "<leader>ol", vim.cmd.Hex)
--vim.keymap.set("n", "<leader>oo", vim.cmd.Lex)
vim.keymap.set("n", "<leader>oo", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>.", vim.cmd.Files)
vim.keymap.set("n", "<leader>,", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>/", vim.cmd.BLines)
vim.keymap.set("n", "<leader>rg", vim.cmd.Rg)
-- Buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)
vim.keymap.set("n", "<leader>en", vim.cmd.enew)
--Splits
vim.keymap.set("n", "<leader>wh", vim.cmd.split)
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
--Navigate Splits
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>ww", "<C-w>w", opts)
vim.keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
vim.keymap.set("n", "<leader>wc", vim.cmd.close)
-- Tabs
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-w>", vim.cmd.tabclose)
-- Quick write
-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- Keep search in centre
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Quick exit insert
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)
vim.keymap.set("i", "<C-c>", "<Esc>")
