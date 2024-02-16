-- Leader key
vim.g.mapleader = " "
-- File Explorer (nvimtree)
vim.keymap.set("n", "<leader>o-", ":e.<CR>")
vim.keymap.set("n", "<leader>oo", vim.cmd.NvimTreeToggle)
-- fzf find files
vim.keymap.set("n", "<leader>.", vim.cmd.Files)
-- vim.keymap.set("n", "<leader>,", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>/", vim.cmd.BLines)
-- rgrep
vim.keymap.set("n", "<leader>rg", vim.cmd.Rg)
-- Buffers
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bk", vim.cmd.bd)
vim.keymap.set("n", "<leader>en", vim.cmd.enew)
--Splits/Windows
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>ws", vim.cmd.split)
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>wr", "<C-w>r")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
vim.keymap.set("n", "<leader>wc", vim.cmd.close)
--Keep cursor in place for Ctrl d? -- does it work?
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Write, Quit, Close, Source
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq!<CR>")
vim.keymap.set("n", "<leader>fs", ":w!<CR>")
vim.keymap.set("n", "<leader>sv", ":so<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
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
-- Toggle linenumbers 
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
-- Taskwarrior terminal popup
vim.keymap.set("n", "<leader>nt", ":! task project:Next<CR>")
vim.keymap.set("n", "<leader>t", ":! task<CR>")
vim.keymap.set("n", "<leader>at", ":! task add ")
-- Go to vault dir
vim.keymap.set("n", "<leader>gv", ":cd ~/Dropbox/vault/<CR>")
-- Go to dotfiles dir
vim.keymap.set("n", "<leader>g.", ":cd ~/dotfiles/<CR>")
-- Go to blog dir
vim.keymap.set("n", "<leader>gb", ":cd ~/sba/<CR>")
-- Go to home dir
vim.keymap.set("n", "<leader>gh", ":cd<CR>")
-- exbookmarks
vim.api.nvim_set_keymap('n', '<leader>bb', ':lua require"ezbookmarks".OpenBookmark()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bm', ':lua require"ezbookmarks".AddBookmark()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bM', ':lua require"ezbookmarks".RemoveBookmark()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>bd', ':lua require"ezbookmarks".AddBookmarkDirectory()<CR>', { noremap = true, silent = true })
--git push
vim.keymap.set("n", '<leader>gp', ":Git push<CR>")
-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>`", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>0", function() ui.nav_file(10) end)
vim.keymap.set("n", "<leader>hn", require('harpoon.ui').nav_next)
vim.keymap.set("n", "<leader>hp", require('harpoon.ui').nav_prev)
-- Which-Key
local wk = require("which-key")
wk.register({
  b = {
    name = "buffers & bookmarks", -- optional group name
    b = "Bookmark list",
    m = "Bookmark add",
    M = "Bookmark remove",
    i = "Buffer list",
    n = "Buffer next",
    p = "Buffer previous",
    k = "Buffer kill",
  },
}, { prefix = "<leader>" })

wk.register({
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    g = "Grep",
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false,}, -- additional options for creating the keymap
    s = "Save File", -- same as above
  },
}, { prefix = "<leader>" })

wk.register({
  g = {
    name = "goto & git", -- optional group name
    h = "cd ~",
    p = "Git push",
    s = "GitStatus",
  },
}, { prefix = "<leader>" })

wk.register({
  o = {
    name = "open & obsidian", -- optional group name
    o = "Toggle Tree ~",
    s = "ObsidianSearch",
  },
}, { prefix = "<leader>" })

wk.register({
  n = {
    name = "", -- optional group name
    l = "set nolinebreak",
    t = "Task project:Next",
  },
}, { prefix = "<leader>" })

wk.register({
  w = {
    name = "window & write", -- optional group name
    c = "Window close",
    h = "Window left",
    j = "Window down",
    k = "Window up",
    l = "Window right",
    m = "Window maximizer",
    s = "Window split below",
    r = "Window rotate",
    w = "Window switch",
    v = "Window split right",
    q = "Write quit!",
  },
}, { prefix = "<leader>" })
