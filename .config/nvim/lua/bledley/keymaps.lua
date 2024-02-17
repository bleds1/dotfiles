-- Leader key
vim.g.mapleader = " "
-- File Explorer (nvimtree)
vim.keymap.set("n", "<leader>o-", ":e.<CR>")
vim.keymap.set("n", "<leader>oo", vim.cmd.NvimTreeToggle)
-- fzf find files
vim.keymap.set("n", "<leader>sF", vim.cmd.Files)
-- vim.keymap.set("n", "<leader>,", vim.cmd.Buffers)
vim.keymap.set("n", "<leader>sb", vim.cmd.BLines)
vim.keymap.set("n", "<leader>sc", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>sg", ":Telescope git_status<CR>")
vim.keymap.set("n", "<leader>sm", ":Telescope man_pages<CR>")
vim.keymap.set("n", "<leader>tt", ":Twilight<CR>")

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
vim.keymap.set("n", "<leader>wj", "<C-w>j") vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>")
vim.keymap.set("n", "<leader>wc", vim.cmd.close)
--Keep cursor in place for Ctrl d? -- does it work?
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Write, Quit, Close, Source
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>wa", ":wa<CR>")
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
vim.keymap.set("n", "<leader>tz", vim.cmd.ZenMode)
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
vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>")
vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>")
vim.keymap.set("n", "<leader>oT", ":ObsidianTomorrow<CR>")
vim.keymap.set("n", "<leader>ot", ":ObsidianTag<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>or", ":ObsidianRename<CR>")
vim.keymap.set("n", "<leader>oi", ":ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>so", ":ObsidianSearch<CR>")
-- Packer
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
vim.keymap.set("n", "<leader>pc", ":PackerClean<CR>")
vim.keymap.set("n", "<leader>pi", ":PackerInstall<CR>")
-- Todo's 
vim.keymap.set("n", "<leader>sT", ":TodoTelescope<CR>")
vim.keymap.set("n", "<leader>st", ":TodoLocList<CR>")
-- Telescope
vim.keymap.set("n", "<leader>ss", ":Telescope<CR>")
-- Markdown Preview
vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>")
vim.keymap.set("n", "<leader>mx", ":MarkdownStop<CR>")
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
vim.api.nvim_set_keymap('n', '<leader><CR>', ':lua require"ezbookmarks".OpenBookmark()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bm', ':lua require"ezbookmarks".AddBookmark()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bM', ':lua require"ezbookmarks".RemoveBookmark()<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>bd', ':lua require"ezbookmarks".AddBookmarkDirectory()<CR>', { noremap = true, silent = true })
--git push
vim.keymap.set("n", '<leader>gp', ":Git push<CR>")
