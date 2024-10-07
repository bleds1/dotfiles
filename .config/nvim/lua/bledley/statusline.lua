-- Function to get git branch and icon in the statusline
-- TODO:Show changes -- Improved to not show fatal when in non file buffers
function GetGitStatus()
  local git_dir = vim.fn.finddir('.git', vim.fn.expand('%:p:h') .. ';')
  if git_dir ~= '' then
    local branch = vim.fn.systemlist('git -C ' .. vim.fn.fnameescape(vim.fn.expand('%:p:h')) .. ' rev-parse --abbrev-ref HEAD 2>/dev/null')[1]
    if branch ~= nil and branch ~= '' then
      local icon = '' -- Unicode character for branch icon
      return string.format('%s %s', icon, branch)
    else
      return ''
    end
  else
    return ''
  end
end
-- Function to get full name for the statusline
-- Place this in the statusline without quotes --> "%{luaeval("GetFullModeName()")}"
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
   elseif mode == 't' then
     return 'TERMINAL'
   else
     return mode
   end
 end
-- StatusLine layout
vim.o.statusline ='%#StatusLine# %{luaeval("GetTmuxSession()")} %{luaeval("GetGitStatus()")}  %t %w %r %m%=%-14.(Ln %l, Col %c%) '..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..' %(%{luaeval("GetScrollPercentage()")}%%%) '
-- Function to get scroll percentage
function GetScrollPercentage()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local percentage = math.floor((current_line / total_lines) * 100)
  return tostring(percentage)
end
-- Statusline autocommand that updates on file change
  vim.cmd([[
    augroup StatusLineUpdate
      autocmd!
      autocmd BufEnter * lua vim.wo.statusline = '%#StatusLine# %{luaeval("GetTmuxSession()")} %{luaeval("GetGitStatus()")}  %t %w %r %m%=%-14.(Ln %l, Col %c%) '..vim.bo.filetype:sub(1,1):upper()..vim.bo.filetype:sub(2)..' %(%{luaeval("GetScrollPercentage()")}%%%) '
   augroup END
 ]])
-- Define the GetTmuxSession() function
function GetTmuxSession()
  if vim.fn.exists('$TMUX') == 1 then
    local tmux_session = vim.fn.system('tmux display-message -p "#S"')
    tmux_session = string.gsub(tmux_session, "%s*$", "")  -- Remove trailing whitespace
    return '[' .. tmux_session .. ']'
  else
    return ''
  end
end
--Set status bar colors on InsertEnter
vim.cmd([[
  augroup StatusBarColors
    autocmd!
    autocmd InsertEnter * hi statusline guifg='#282828' guibg=#6B95B8
    autocmd InsertLeave * hi statusline guifg='#9da7b4' guibg=#1c1c1c
  augroup END
]])
