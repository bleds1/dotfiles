-- Function to get git branch and icon in the statusline
-- TODO:Show changes
function GetGitStatus()
  local git_dir = vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';')
  if git_dir ~= '' then
    local branch = vim.fn.systemlist('git -C ' .. vim.fn.fnameescape(vim.fn.expand('%:p:h')) .. ' rev-parse --abbrev-ref HEAD')[1]
    local icon = '' -- Unicode character for branch icon
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
     return '--INSERT--'
   elseif mode == 'v' then
     return '--VISUAL--'
   elseif mode == 'V' then
     return '--V-LINE--'
   elseif mode == '^V' then
     return '--V-BLOCK--'
   elseif mode == 'R' then
     return '--REPLACE--'
   elseif mode == 'c' then
     return '--COMMAND--'
   else
     return mode
   end
 end
-- StatusLine (Must match autocmd below to stay consistent on buffer change)
vim.o.statusline = '%#StatusLine# %{luaeval("GetFullModeName()")}  %t %w %r %m%=%-14.(Ln %l, Col %c%) %{luaeval("GetGitStatus()")} ['..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..'] '
-- Statusline with autocommand that updates on file change
 vim.cmd([[
   augroup StatusLineUpdate
     autocmd!
     autocmd BufEnter * lua vim.wo.statusline = '%#StatusLine# %{luaeval("GetFullModeName()")}  %t %w %r %m%=%-14.(Ln %l, Col %c%) %{luaeval("GetGitStatus()")} ['..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..'] '
  augroup END
]])
-- Set status bar colors on InsertEnter
vim.cmd([[
  augroup StatusBarColors
    autocmd!
    autocmd InsertEnter * hi statusline guifg='#2b313C' guibg=#6B95B8
    autocmd InsertLeave * hi statusline guifg='#9da7b4' guibg=#2b313C
  augroup END
]])

