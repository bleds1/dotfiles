vim.cmd('autocmd VimEnter * silent! :intro')
-- Transparent linenumbers column
vim.cmd('hi! LineNr guibg=none ctermbg=none')
-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
-- Function to get git branch and icon in the statusline
-- TODO:Show changes
function GetGitStatus()
  local git_dir = vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';')
  if git_dir ~= '' then
    local branch = vim.fn.systemlist('git -C ' .. vim.fn.fnameescape(vim.fn.expand('%:p:h')) .. ' rev-parse --abbrev-ref HEAD')[1]
    local icon = ''  -- Unicode character for branch icon
    return string.format('%s %s', icon, branch)
  else
    return ''
  end
end
-- Function to get full name for the statusline
function GetFullModeName()
  local mode = vim.fn.mode()
  if mode == 'n' then
    return 'NORMAL'
  elseif mode == 'i' then
    return 'INSERT'
  elseif mode == 'v' then
    return 'VISUAL'
  elseif mode == 'V' then
    return 'V-LINE'
  elseif mode == '^V' then
    return 'V-BLOCK'
  elseif mode == 'R' then
    return 'REPLACE'
  elseif mode == 'c' then
    return 'COMMAND'
  else
    return mode
  end
end
-- best working below
vim.o.statusline = '%#StatusLine# %{luaeval("GetFullModeName()")}  %{luaeval("GetGitStatus()")} %t %w %r %m%=%-14.(Ln %l, Col %c%) '..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..' '
-- Statusline with autocommand that updates on file change
 vim.cmd([[
   augroup StatusLineUpdate
     autocmd!
     autocmd BufEnter * lua vim.wo.statusline = '%#StatusLine# %{luaeval("GetFullModeName()")}  %{luaeval("GetGitStatus()")} %t %w %r %m%=%-14.(Ln %l, Col %c%) '..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..' '
  augroup END
]])
