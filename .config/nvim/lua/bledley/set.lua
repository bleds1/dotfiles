-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- nvim tree
vim.g.nvim_tree_indent_markers = 1
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 15
--vim.g.netrw_browse_split = 0
--vim.g.netrw_keepdir = 0
--vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_browsex_viewer = 'xdg-open'
--vim.opt.laststatus = 0
vim.opt.nu = true
vim.opt.relativenumber = true
--vim.opt.cursorline = true
--vim.opt.laststatus = 0
--vim.opt.guicursor = ""
--vim.opt.showtabline =2
vim.opt.showmode = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.fillchars = { eob = ' ' }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"

vim.opt.updatetime = 100
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = 'a'
vim.opt.breakindent = true

