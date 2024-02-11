-- Transparent linenumbers column
vim.cmd('hi! LineNr guibg=none ctermbg=none')
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 15
--vim.g.netrw_browse_split = 0
--vim.g.netrw_keepdir = 0
--vim.g.netrw_localcopydircmd = 'cp -r'
-- Nvim tree
vim.g.nvim_tree_indent_markers = 1
vim.g.netrw_browsex_viewer = 'xdg-open'
vim.o.laststatus = 0
vim.o.nu = true
vim.o.relativenumber = false
vim.o.cursorline = true
--vim.o.guicursor = ""
--vim.o.showtabline =2
vim.o.showmode = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = true
--if i switch below to vim.o source errors?
vim.opt.fillchars = { eob = ' ' }
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.scrolloff = 8
--vim.o.signcolumn = "yes"
vim.o.updatetime = 100
vim.o.clipboard = "unnamedplus"
vim.o.mouse = 'a'
vim.o.breakindent = true
