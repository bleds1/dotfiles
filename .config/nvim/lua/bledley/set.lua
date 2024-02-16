vim.cmd('autocmd VimEnter * silent! :intro')
-- Transparent linenumbers column
vim.cmd('hi! LineNr guibg=none ctermbg=none')
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- GUI font --NOTE:Is this actually working?
if vim.fn.has('gui_running') == 1 then
    vim.o.guifont = "JetBrains Mono:h13"
end
-- Nvim tree
vim.g.nvim_tree_indent_markers = 1
-- is this working?
vim.g.nvim_tree_side = 'right'
vim.g.netrw_browsex_viewer = 'xdg-open'
vim.o.laststatus = 2
-- linenumbers
vim.o.nu = true
vim.o.relativenumber = false
vim.o.cursorline = true
--vim.o.signcolumn = "yes"
--vim.o.guicursor = ""
--vim.o.showtabline =2
--See Insert etc.
vim.o.showmode = false
--tabs and indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.scrolloff = 8 -- line wrapping
vim.o.wrap = true
--tilde fringe off
vim.opt.fillchars = { eob = ' ' }
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
--search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.clipboard = "unnamedplus"
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.conceallevel = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ruler = false
--nvim tree
vim.g.nvim_tree_side = ''
--which-key
vim.opt.timeout = true
vim.opt.timeoutlen = 300
