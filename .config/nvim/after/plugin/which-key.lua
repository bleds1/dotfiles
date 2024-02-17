require("which-key").setup {
{
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  motions = {
    count = true,
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000, -- positive value to position WhichKey above other floating windows.
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specifiy a list manually
  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
  triggers_nowait = {
    -- marks
    "`",
    "'",
    "g`",
    "g'",
    -- registers
    '"',
    "<c-r>",
    -- spelling
    "z=",
  },
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for keymaps that start with a native binding
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by default for Telescope
  disable = {
    buftypes = {},
    filetypes = {},
  },
}
}

-- Which-Key
local wk = require("which-key")
wk.register({
  a = {
    name = "Add",
    t = "Add Task",
  },
}, { prefix = "<leader>" })


wk.register({
  b = {
    name = "Buffers & Bookmarks",
    m = "Set bookmark",
    M = "Delete bookmark",
    i = "Buffer list",
    n = "Next buffer",
    N = "New empty buffer",
    O = "Kill other buffers",
    p = "Previous buffer",
    k = "Kill buffer",
    K = "Kill all buffers",
    s = "Save buffer",
    S = "Save all buffers",
    y = "Yank buffer",
    x = "Pop up scratch buffer",
    X = "Switch to scratch buffer",

  },
}, { prefix = "<leader>" })

wk.register({
  c = {
    name = "Count & check",
    b = "Check box",
    w = "Count Words",
  },
}, { prefix = "<leader>" })

wk.register({
  e = {
    name = "edit/new",
    e = "edit new buffer",
  },
}, { prefix = "<leader>" })

wk.register({
  h = {
    name = "Harpoon & Hunks",
    a = "Add mark to Harpoon",
    n = "Next mark Harpoon",
    p = "Previous mark Harpoon ",
    s = "GitGutterStageHunk",
    u = "GitGutterUndoHunk",
  },
}, { prefix = "<leader>" })

wk.register({
  i = {
    name = "Insert template", -- optional group name
    t = "Insert Obsidian template",
  },
}, { prefix = "<leader>" })

wk.register({
  f = {
    name = "File",
    f = { "<cmd>Telescope find_files<cr>", "Find file" },
    g = "Grep",
    r = { "<cmd>Telescope oldfiles<cr>", "Open recent file", noremap=false,},
    s = "Save file",
  },
}, { prefix = "<leader>" })

wk.register({
  g = {
    name = "Goto & Git",
    h = "cd home",
    p = "Git push",
    s = "Git status",
  },
}, { prefix = "<leader>" })

wk.register({
  m = {
    name = "Markdown",
    p = "Preview Markdown in browser",
    x = "Stop Markdown preview",
  },
}, { prefix = "<leader>" })

wk.register({
  n = {
    name = "",
    l = "set nolinebreak",
    t = "Tasks in project:Next",
  },
}, { prefix = "<leader>" })

wk.register({
  o = {
    name = "Open & Obsidian",
    d = "Go to daily note",
    i = "Insert Obsidian template",
    n = "New Obsidian note",
    o = "Toggle file explorer",
    r = "Rename Obsidian note",
    s = "Search Obsidian vault",
    t = "Search Obsidian tags",
    T = "Go to tomorrow's daily note",
    y = "Go to yesterday's daily note",
  },
}, { prefix = "<leader>" })


wk.register({
  p = {
    name = "Packer",
    c = "Packer Clean",
    i = "Packer Install",
    s = "Packer Sync",
  },
}, { prefix = "<leader>" })

wk.register({
  s = {
    name = "Search & source",
    b = "Search buffer",
    B = "Search open buffers",
    c = "Search Commands",
    f = "Search files in current dir",
    F = "Search current dir with FZF",
    g = "Search Git status",
    G = "Search current dir with grep",
    h = "Search Help",
    m = "Search Man pages",
    o = "Search Obsidian vault",
    p = "Search Git project files",
    r = "Search recent files",
    s = "Search with Telescope",
    t = "Search Todo list in dir",
    T = "Search Todo in dir",
    v = "Source init.lua",
  },
}, { prefix = "<leader>" })

wk.register({
  t = {
    name = "Toggle",
    l = "Line numbers",
    t = "Twilight",
    z = "Zen mode",
  },
}, { prefix = "<leader>" })

wk.register({
  w = {
    name = "Window & write",
    a = "Write all buffers",
    c = "Window close",
    h = "Window left",
    j = "Window down",
    k = "Window up",
    l = "Window right",
    m = "maximize",
    s = "Window split below",
    r = "Window rotate",
    w = "Window switch",
    v = "Window split right",
    q = "Write & quit!",
    },
}, { prefix = "<leader>" })
