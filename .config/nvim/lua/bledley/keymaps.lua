vim.g.mapleader = " "
-- File Explorer (nvimtree)
vim.keymap.set("n", "<leader>o-", ":e.<CR>")
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>,", vim.cmd.Files)
vim.keymap.set("n", "<leader>.", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>/", vim.cmd.BLines)
vim.keymap.set("n", "<leader>rg", vim.cmd.Rg)
-- Buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)
vim.keymap.set("n", "<leader>en", vim.cmd.enew)
--Splits
vim.keymap.set("n", "<leader>ws", vim.cmd.split)
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
--Navigate Window Splits
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
--Keep cursor in place for Ctrl d?
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Write, Quit, Close, Source
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq!<CR>")
vim.keymap.set("n", "<leader>fs", ":w!<CR>")
vim.keymap.set("n", "<leader>sv", ":so<CR>")
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
vim.keymap.set("n", "<leader>wc", vim.cmd.close)
vim.keymap.set("n", "<leader>wx", vim.cmd.close)
vim.keymap.set("n", "<leader>q", ":q<CR>")
-- Tabs
--vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
--vim.keymap.set("n", "<C-w>", vim.cmd.tabclose)
-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
-- Keep search in centre
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Quick exit insert
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Zen mode
vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode)
--Shift lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
-- Map Shift+Tab to outdent
vim.api.nvim_set_keymap('i', '<S-Tab>', '<C-d>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true })
-- Set linebreak
vim.keymap.set("n", "<leader>lb", ":set linebreak<CR>")
vim.keymap.set("n", "<leader>nlb", ":set nolinebreak<CR>")
--toggle linenumbers 
vim.keymap.set("n", "<leader>tl", ":set nu!<CR>")
-- Define a Lua function to get the word count
function Get_word_count()
  local word_count = vim.fn.wordcount().words
  print("Word count: " .. word_count)
end
-- Set a keybinding to call the get_word_count function
vim.api.nvim_set_keymap('n', '<leader>cw', ':lua Get_word_count()<CR>', { noremap = true, silent = true })
-- Obsidian.nvim
vim.keymap.set("n", "<leader>j", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>y", ":ObsidianYesterday<CR>")
vim.keymap.set("n", "<leader>nn", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>r", ":ObsidianRename<CR>")
vim.keymap.set("n", "<leader>is", ":ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>")
-- Markdown Preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
-- Task popup
vim.keymap.set("n", "<leader>nt", ":! task project:Next<CR>")
vim.keymap.set("n", "<leader>t", ":! task<CR>")
vim.keymap.set("n", "<leader>at", ":! task add ")
