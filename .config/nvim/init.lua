require("bledley")
-- hyper syntax
vim.filetype.add({
  pattern = {
      [".*/hyprland.conf"] = "hyprlang",
      [".*/hypr/.*.conf"] = "hyprlang",
  },
})vim.filetype.add({
  pattern = {
      [".*/hyprland.conf"] = "hyprlang",
      [".*/hypr/.*.conf"] = "hyprlang",
  },
})
local ft = require 'Comment.ft'
ft.hyprlang = '#%s'
