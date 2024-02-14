require('ezbookmarks').setup{
  cwd_on_open = 1,        -- change directory when opening a bookmark
  use_bookmark_dir = 1,   -- if a bookmark is part of a bookmarked directory, cd to that direcrtory (works independently of cwd_on_open)
  -- open_new_tab = 1,       -- open bookmark in a new tab.
}
