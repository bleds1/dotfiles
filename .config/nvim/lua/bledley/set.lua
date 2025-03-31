vim.cmd('autocmd VimEnter * silent! :intro')
-- Transparent linenumbers column
vim.cmd('hi! LineNr guibg=none ctermbg=none')
-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_browsex_viewer = 'xdg-open'
-- status bar/line
vim.o.laststatus = 2
-- linenumbers
vim.o.nu = true
vim.o.relativenumber = true
vim.o.cursorline = true
-- vim.opt.guicursor = "a:blinkon900"
--vim.o.showtabline =2
--see Insert/Normal under statusline
vim.o.showmode = true
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
vim.g.termguicolors = true
vim.o.updatetime = 100
vim.o.clipboard = "unnamedplus"
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.conceallevel = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ruler = false
--which-key
vim.opt.timeout = true
vim.opt.timeoutlen = 300
-- set spelling automatically for markdown files
vim.cmd('autocmd FileType markdown setlocal spell linebreak')
-- Spell lang
vim.opt.spelllang = 'en_gb'
-- Toggle linenumbers in inbuilt terminal
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
-- Start inbuilt terminal in Insert mode
vim.cmd('autocmd TermOpen * startinsert')
-- Disable completions in markdown
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "markdown" },
--     callback = function()
--         require("cmp").setup({ enabled = false })
--     end,
-- })
-- no linenumbers in org or md
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.org", "*.md"},
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
